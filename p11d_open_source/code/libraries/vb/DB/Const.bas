Attribute VB_Name = "CONST"
Option Explicit

' in Core
' TCS_InitialiseDefaultWS
Public mDBInitCount As Long
Public m_wsMain As Workspace
Public m_SystemMDWPath As String
Public m_SQLExplorer As Object  'SQLDebug

'TCS core defined errors
Public Enum TCSDB_UDE
  ERR_SAME_DEST = TCSDB_ERROR + 1
  ERR_TABLEEXISTS
  ERR_NOTBOOKMARKABLE
  ERR_FIELD_ADD
  ERR_KILL_TABLE
  ERR_KILL_QUERY
  ERR_COPY_DB
  ERR_KILL_FIELD
  ERR_KILL_INDEX
  ERR_NOT_EXCLUSIVE
  ERR_UPDATE_TABLE
  ERR_RECORDSET_ISNOTHING
  ERR_INVALIDOBJECT
  ERR_NOFILE
  ERR_COPYTABLEDEF
  ERR_ODBC_CONNECTION
  ERR_ODBC_CONNECTIONTIMEOUT
  ERR_DBOPEN
  ERR_EXPLORESQL
End Enum

