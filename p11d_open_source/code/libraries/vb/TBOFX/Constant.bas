Attribute VB_Name = "Constant"
Option Explicit

Public gNotify As IBaseNotify

Public Enum Filter_Action
  OVERWRITE_TABLE_STRUCTURE = 1
  NO_REMOVE_FIELDS = 2
  DELETE_TABLES = 4
  OVERWRITE_QUERY_STRUCTURE = 8
  DELETE_QUERIES = 16
  OVERWRITE_DATA = 32
End Enum

Public Const STRUCTURE_FILTER = OVERWRITE_TABLE_STRUCTURE + NO_REMOVE_FIELDS + DELETE_TABLES + OVERWRITE_QUERY_STRUCTURE + DELETE_QUERIES
Public Const DATA_FILTER = OVERWRITE_DATA
Public Const FULL_SYNC = OVERWRITE_TABLE_STRUCTURE + DELETE_TABLES + OVERWRITE_QUERY_STRUCTURE + DELETE_QUERIES + OVERWRITE_DATA


Public Enum DAInternalErrors
  'This has the first 512 errors from TCSDA reserved for TBOFix.dll
  ERR_APPLY_FIXES = TCSDA_ERROR
  ERR_DB_NOTHING
  ERR_COPY_TEMPLATE_FILE
  ERR_NO_KILL_FIELD
  ERR_UNKNOWN_FILTER_TYPE
  ERR_NO_FILTER_STRING
  ERR_NO_TABLE
  ERR_RS_EMPTY
  ERR_NO_FILE
End Enum
