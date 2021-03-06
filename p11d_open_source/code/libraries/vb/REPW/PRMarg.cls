VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ParseRightMargin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Implements IParseItem

Private Property Get IParseItem_ActionStr() As String
  IParseItem_ActionStr = "RIGHTMARGIN"
End Property

Private Property Get IParseItem_ActionParamCount() As Long
  IParseItem_ActionParamCount = 1
End Property

Private Function IParseItem_OnAction(psett As IParseSettings, objCurItem As Variant, pre As String, ByVal paramcount As Long, params() As String) As PARSESTATUS
  Dim rm As Single, pWidth As Single
  
  Call DisplayText(pre)
  rm = CSng(params(1))
  If (rm < 0) Or (rm > 49) Then Err.Raise ERR_MARGIN, "RightMargin", "The right margin of the page must be between 0 and 49 percent."
  pWidth = ReportControl.PageWidth + ReportControl.LeftMargin - 1 + ReportControl.RightMargin
  rm = GetPercent(rm, pWidth)
  ReportControl.RightMargin = rm
  ReportControl.PageWidth = pWidth - ReportControl.LeftMargin + 1 - rm
End Function


