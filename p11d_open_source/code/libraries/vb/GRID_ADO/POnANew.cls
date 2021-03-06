VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ParseOnAddNew"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Implements IParseItem

'* Similar to NewRecord however calculated value is put in OnNewRecord
Private Property Get IParseItem_ActionParamCount() As Long
  IParseItem_ActionParamCount = 1
End Property

Private Property Get IParseItem_ActionStr() As String
  IParseItem_ActionStr = "ONADDNEW"
End Property

Private Function IParseItem_OnAction(psett As IParseSettings, objCurItem As Variant, pre As String, ByVal paramcount As Long, params() As String) As PARSESTATUS
  Dim acol As AutoCol, s As String
  Dim CalcType As DERIVED_VALUES_CALC
  
  If FormatRemove Then Err.Raise ERR_NOREMOVEFORMAT, IParseItem_ActionStr, "Cannot remove " & IParseItem_ActionStr & " format"
  Set acol = objCurItem
  s = params(1)
  CalcType = DerivedValueType(s)
  acol.OnAddNewCalcValueType = CalcType
  acol.OnAddNewCalcValue = s
  acol.NoAddNew = True
  IParseItem_OnAction = PARSESTATUS_OK
End Function

