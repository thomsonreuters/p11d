VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ParseXAbs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Implements IParseItem

Private Property Get IParseItem_ActionStr() As String
  IParseItem_ActionStr = "XABS"
End Property

Private Property Get IParseItem_ActionParamCount() As Long
  IParseItem_ActionParamCount = 1
End Property

Private Function IParseItem_OnAction(psett As IParseSettings, objCurItem As Variant, pre As String, ByVal paramcount As Long, params() As String) As PARSESTATUS
  Call xSet("ParseXABS")
  
  Call DisplayText(pre)
  If (ReportControl.rTarget = RPT_PRINTER) Or (ReportControl.rTarget = RPT_PREVIEW_PRINT) Then
    Printer.CurrentX = ReportControl.LeftMargin + GetAbsolute(CSng(params(1)), ReportControl.PageWidth)
  ElseIf (ReportControl.rTarget = RPT_PREVIEW_DISPLAYPAGE) Or (ReportControl.rTarget = RPT_CONFIG) Then
    ReportControl.Preview.CurrentX = ReportControl.LeftMargin + GetAbsolute(CSng(params(1)), ReportControl.PageWidth)
  ElseIf IsExportHTML Then
    Call CloseDiv
    Call SetOpenDiv
    ReportControl.HTML.CurrentX = GetAbsolute(CSng(params(1)), ReportControl.PageWidth)
  End If
  Call xReturn("ParseXABS")
End Function

