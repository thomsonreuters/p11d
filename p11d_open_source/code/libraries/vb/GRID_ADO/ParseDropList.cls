VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ParseDropList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Implements IParseItem
' apf changed 21/2
'*  {DROPLIST=DisplayValue,DBValue}
'*  GIVES A DROPDOWN BOX WITH THE GIVEN ITEMS IN IT
Private Property Get IParseItem_ActionParamCount() As Long
  IParseItem_ActionParamCount = -1
End Property

Private Property Get IParseItem_ActionStr() As String
  IParseItem_ActionStr = "DROPLIST"
End Property

Private Function IParseItem_OnAction(psett As TCSPARSE.IParseSettings, objCurItem As Variant, pre As String, ByVal paramcount As Long, params() As String) As PARSESTATUS
  Dim aCol As AutoCol
  Dim i As Long
  
  If FormatRemove Then Err.Raise ERR_NOREMOVEFORMAT, IParseItem_ActionStr, "Cannot remove " & IParseItem_ActionStr & " format"
  Set aCol = objCurItem
  aCol.DropType = DROPDOWN_LIST
  aCol.BoundDataField = aCol.DataField
  For i = 1 To paramcount
    Call aCol.AddParam(params(i))
  Next i
  IParseItem_OnAction = PARSESTATUS_OK
End Function


