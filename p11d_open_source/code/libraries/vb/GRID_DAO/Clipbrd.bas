Attribute VB_Name = "Clipboard"
Option Explicit
Private Type ClipColumn
  FieldName As String
  bCopyField As Boolean
  bUnboundColumn As Boolean
  GridIndex As Long
End Type
Public Sub SetClipboardColumn(ByVal aCols As Collection, ByVal bClipboardColumn As Boolean)
  Dim aCol As AutoCol
  
  For Each aCol In aCols
    aCol.ClipboardColumn = bClipboardColumn
  Next aCol
End Sub

Private Function GridIndex(ByVal aCols As Collection, ByVal grid As TDBGrid, ByVal FieldName As String) As Long
  Dim aCol As AutoCol, ColSet As TrueDBGrid60.Column
  
  Set aCol = aCols.Item(FieldName)
  GridIndex = aCol.GridColumn
  If GridIndex >= 0 Then
    Set ColSet = grid.Columns(GridIndex)
    If (ColSet.Width < GRID_MINCOLWIDTH) Or Not ColSet.Visible Then
      GridIndex = -1
    End If
  End If
End Function

Public Function GetColumns(ByVal ac As AutoClass, ByVal NumberOfColumnsRequired) As Long
  On Error GoTo GetColumns_ERR
  
  Call SetCursor(vbDefault)
  GetColumns = frmColumns.GetColumns(ac, NumberOfColumnsRequired)
  Set frmColumns = Nothing
  
GetColumns_END:
  Call ClearCursor
  Exit Function
GetColumns_ERR:
  Call ErrorMessage(ERR_ERROR, Err, "GetColumns", "Get Columns", "Error in GetColumns")
  Resume GetColumns_END
End Function

Public Function IsPasteField(ByVal aCols As Collection, ByVal FieldName As String) As Boolean
  Dim aCol As AutoCol
  
  If Len(FieldName) > 0 Then
    Set aCol = aCols.Item(FieldName)
    IsPasteField = ((aCol.OnAddNewCalcValueType And DERIVED_VALUE_NO_CALC) = DERIVED_VALUE_NO_CALC) And ((aCol.OnUpdateCalcValueType And DERIVED_VALUE_NO_CALC) = DERIVED_VALUE_NO_CALC) And (Not aCol.NoEdit)
  End If
End Function

Public Function CountCopyColumns(ByVal ac As AutoClass) As Long
  Dim aCol As AutoCol
  Dim i As Long
  
  For Each aCol In ac.AutoColumns
    If aCol.ClipboardColumn Then i = i + 1
  Next
  CountCopyColumns = i
End Function

Public Function IsCopyField(ByVal aCols As Collection, ByVal FieldName As String) As Boolean
  Dim aCol As AutoCol
  
  If Len(FieldName) > 0 Then
    Set aCol = aCols.Item(FieldName)
    IsCopyField = (Not aCol.NoCopy) And aCol.ClipboardColumn
  End If
End Function

Private Sub SortByGridIndex(ByRef ClipColumns() As ClipColumn)
  Dim lb As Long, ub As Long
  Dim i As Long, j As Long
  Dim tmpCC As ClipColumn, minValue As Long
  
  lb = LBound(ClipColumns)
  ub = UBound(ClipColumns)
  For i = lb To ub
    minValue = i
    For j = (i + 1) To ub
      If ClipColumns(j).GridIndex < ClipColumns(minValue).GridIndex Then
        minValue = j
      End If
    Next j
    If minValue <> i Then
      tmpCC = ClipColumns(i)
      ClipColumns(i) = ClipColumns(minValue)
      ClipColumns(minValue) = tmpCC
    End If
  Next i
End Sub

Public Sub CopyPasteGridValue(ByVal grid As TrueDBGrid60.TDBGrid, ByVal aCols As Collection)
  Dim ColSet As TrueDBGrid60.Column
  Dim vbmk As Variant
  
  On Error GoTo CopyPasteGridValue_err
  If grid.AllowUpdate And (grid.Col >= 0) Then
    If (grid.AddNewMode = dbgAddNewCurrent) Or (grid.AddNewMode = dbgAddNewPending) Then
      If grid.VisibleRows > 1 Then vbmk = grid.RowBookmark(grid.VisibleRows - 2)
    Else
      vbmk = IsNullEx(grid.GetBookmark(-1), "")
    End If
    If Len(vbmk) > 0 Then
      Set ColSet = grid.Columns(grid.Col)
      If IsPasteField(aCols, ColSet.DataField) Then
        ColSet.Value = ColSet.CellValue(vbmk)
      End If
    End If
    
  End If
  Exit Sub
  
CopyPasteGridValue_err:
  Call ErrorMessage(ERR_ERROR, Err, "CopyPasteGridValue", "Copy and Paste from column above failed", "Error during current row column copy")
End Sub

Public Sub CopyPasteCurrentGridRow(ByVal grid As TrueDBGrid60.TDBGrid, ByVal aCols As Collection)
  Dim ColSet As TrueDBGrid60.Column
  Dim i As Integer, cCount As Long
  Dim cRow As Long, Values() As Variant
  Dim vbmk As Variant
  
  On Error GoTo CopyPasteCurrentGridRow_err
  If grid.AllowAddNew And (grid.AddNewMode <> dbgAddNewPending) Then
    If grid.AddNewMode = dbgAddNewCurrent Then
      If grid.VisibleRows > 1 Then
        vbmk = grid.RowBookmark(grid.VisibleRows - 2)
      End If
    Else
      vbmk = grid.Bookmark
      grid.MoveLast
      grid.Row = grid.Row + 1
    End If
    If Len(vbmk) > 0 Then
      cCount = (grid.Columns.Count - 1)
      ReDim Values(0 To cCount)
      For i = 0 To cCount
        Values(i) = grid.Columns(i).CellValue(vbmk)
        If Len(Values(i)) = 0 Then Values(i) = Null
      Next i
      For i = 0 To cCount
        Set ColSet = grid.Columns(i)
        If IsPasteField(aCols, ColSet.DataField) Then
          grid.Columns(i).Value = Values(i)
        End If
      Next i
    End If
  End If
  Exit Sub
  
CopyPasteCurrentGridRow_err:
  Call ErrorMessage(ERR_ERROR, Err, "CopyPasteCurrentGridRow", "Copy and Paste Current row failed", "Error during current row copy/paste")
End Sub

Public Sub CopyClipboardRowEx(ByVal rs As Recordset, ByVal rsRDO As RDOResultset, ByVal grid As TrueDBGrid60.TDBGrid, ByVal aCols As Collection)
  Dim qGridCopy As QString, qCopy As QString
  Dim sGridCopy As String, sCopy As String
  Dim dFld As field, rFld As rdoColumn
  Dim rbmk As Variant, vValue As Variant
  Dim ClipColumns() As ClipColumn
  Dim aCol As AutoCol
  Dim i As Long, j As Long, fCount As Long, nCopyField As Long, iCopyField As Long
  Dim t0 As Long
  
  On Error GoTo CopyClipboardRowEx_err
  If grid.SelBookmarks.Count = 0 Then GoTo CopyClipboardRowEx_end
  t0 = GetTicks()
  
  Set qGridCopy = New QString
  Set qCopy = New QString
  
  'Setup ClipColumns array
  rbmk = grid.SelBookmarks(0)
  If Not rs Is Nothing Then
    rs.Bookmark = rbmk
    fCount = (rs.Fields.Count - 1)
    ReDim ClipColumns(0 To fCount)
    For j = 0 To fCount
      Set dFld = rs.Fields(j)
      ClipColumns(j).FieldName = dFld.Name
    Next j
  End If
  If Not rsRDO Is Nothing Then
    grid.Bookmark = rbmk
    fCount = (rsRDO.rdoColumns.Count - 1)
    ReDim ClipColumns(0 To fCount)
    For j = 0 To fCount
      Set rFld = rsRDO.rdoColumns(j)
      ClipColumns(j).FieldName = rFld.Name
    Next j
  End If
  
  For j = 1 To aCols.Count
    Set aCol = aCols.Item(j)
    If aCol.UnboundColumn Then
      fCount = fCount + 1
      ReDim Preserve ClipColumns(0 To fCount)
      ClipColumns(fCount).FieldName = aCol.DataField
      ClipColumns(fCount).bUnboundColumn = True
      ClipColumns(fCount).GridIndex = aCol.GridColumn
    End If
  Next j
    
  For j = 0 To fCount
    ClipColumns(j).bCopyField = IsCopyField(aCols, ClipColumns(j).FieldName)
    ClipColumns(j).GridIndex = GridIndex(aCols, grid, ClipColumns(j).FieldName)
    If ClipColumns(j).bCopyField Then nCopyField = nCopyField + 1
  Next j
  Call SortByGridIndex(ClipColumns)
  
  iCopyField = 0
  For j = 0 To fCount
    If ClipColumns(j).bCopyField Then
      iCopyField = iCopyField + 1
      qCopy.Append ClipColumns(j).FieldName
      If iCopyField < nCopyField Then qCopy.Append vbTab
    End If
  Next
  
  qCopy.Append vbCrLf
  'Put Headers in firstline, Fieldnames in second line - order independent
  For i = 0 To grid.SelBookmarks.Count - 1
    iCopyField = 0
    rbmk = grid.SelBookmarks(i)
    For j = 0 To fCount
      If ClipColumns(j).bCopyField Then
        If Not rs Is Nothing Then
          If ClipColumns(j).bUnboundColumn Then
            Set aCol = aCols.Item(ClipColumns(j).FieldName)
            vValue = GetCalculatedValue(Nothing, rs, aCol, aCol.OnUpdateCalcValue, aCol.OnUpdateCalcValueType, rbmk)
          Else
            rs.Bookmark = rbmk
            vValue = rs.Fields(ClipColumns(j).FieldName).Value
          End If
        End If
        If Not rsRDO Is Nothing Then
          rsRDO.Bookmark = rbmk
          vValue = rsRDO.rdoColumns(ClipColumns(j).FieldName).Value
        End If
        
        iCopyField = iCopyField + 1
        qCopy.Append IsNullEx(vValue, "")
        If iCopyField < nCopyField Then qCopy.Append vbTab
        
        If ClipColumns(j).GridIndex >= 0 Then
          qGridCopy.Append IsNullEx(vValue, "")
          If iCopyField < nCopyField Then qGridCopy.Append vbTab
        End If
      End If
    Next j
    qCopy.Append vbCrLf
    qGridCopy.Append vbCrLf
  Next i
  sGridCopy = qGridCopy
  sCopy = qCopy
  Call SetAnyClipboardData(sGridCopy, AutoClipHandle, sCopy)

CopyClipboardRowEx_end:
  Debug.Print "Copy time: " & GetTicks() - t0
  Exit Sub
  
CopyClipboardRowEx_err:
  Resume CopyClipboardRowEx_end
  Resume
End Sub
