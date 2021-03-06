VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ParseLineWidth"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Implements IParseItem

Private Property Get IParseItem_ActionStr() As String
  IParseItem_ActionStr = "LINEWIDTH"
End Property

Private Property Get IParseItem_ActionParamCount() As Long
  IParseItem_ActionParamCount = -1
End Property

Private Function IParseItem_OnAction(psett As IParseSettings, objCurItem As Variant, pre As String, ByVal paramcount As Long, params() As String) As PARSESTATUS
  Call DisplayText(pre)
  If paramcount = 0 Then
    LINEWIDTH = LINEWIDTH_CONST
  ElseIf paramcount = 1 Then
    LINEWIDTH = CSng(params(1))
  Else
    Call Err.Raise(ERR_PARSELINEWIDTH, "ParseLineWidth", "Expected 0 or 1 parameter found " & CStr(paramcount))
  End If
End Function


