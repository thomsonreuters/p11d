VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ParseNoItems"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Implements IParseItem

'*  {NOITEMS=6}
'*  THIS SETS THE NUMBER OF ITEMS IN A DROP DOWN
Private Property Get IParseItem_ActionParamCount() As Long
  IParseItem_ActionParamCount = 1
End Property

Private Property Get IParseItem_ActionStr() As String
  IParseItem_ActionStr = "NOITEMS"
End Property

Private Function IParseItem_OnAction(psett As TCSPARSE.IParseSettings, objCurItem As Variant, pre As String, ByVal paramcount As Long, params() As String) As PARSESTATUS
  Dim aCol As AutoCol
  
  Set aCol = objCurItem
  aCol.ComboMaxRows = CLng(params(1))
  IParseItem_OnAction = PARSESTATUS_OK
End Function

