Attribute VB_Name = "Start"
Option Explicit
'************************************************************************
'* This is the main module for your file.  Do not add code here, only   *
'* call functions in other modules.                                     *
'* Always use exitapp to terminate your application not END.            *
'************************************************************************
Public Sub Main()
  Dim AppName As String
  
  On Error GoTo main_nocore_err
  AppName = App.EXEName
  If App.PrevInstance Then
    Call ActivatePrevInstance
    GoTo main_end
  End If
  If Not CoreSetup(Command$(), VB.Global) Then Err.Raise ERR_CORESETUP, "Main", "Unable to initialise Core library"
  
  On Error GoTo main_err
  AppName = GetStatic("ApplicationName")
  frmMain.Show
  frmMain.Caption = AppName & " Version " & GetStatic("Version")

  '** The rest of your standard initialisation here if error goto main_end
  
  Call SetupConst
  Call SetupScreen
  Call Reinitialise
  
main_clean_end:
  Exit Sub

main_end:
  Call ExitApp(True)
  Exit Sub
  
main_err:
  Call ErrorMessage(ERR_ERROR, Err, "Main", "Fatal Error in " & AppName, "There was an Error in the main module of this Application")
  Resume main_end
  
main_nocore_err:
  MsgBox "There was an Error in the main module of this Application" & vbCrLf & "Error(" & Err.Number & "): " & Err.Description, vbCritical + vbOKOnly, "Fatal Error in " & AppName
  Resume main_end
End Sub

Public Sub ExitApp(Optional ByVal bForce As Boolean = False)
  Static inexitapp As Boolean
  
  On Error Resume Next
  If (Not inexitapp) Then
    inexitapp = True
    gbAllowAppExit = True
    gbForceExit = bForce
    If gbMDILoaded Then
      Unload frmMain     ' takes account of FatalError
    Else
      Call UserAppShutDown
    End If
    If gbAllowAppExit Then
      Call CoreShutDown
      Set frmMain = Nothing
    Else
      gbForceExit = False
      inexitapp = False
    End If
  End If
End Sub

' Use this function to clean up App specific items
Public Function UserAppShutDown() As Boolean
  Dim ShutDownOk As Boolean
  
  On Error Resume Next
  ShutDownOk = True
  'user app specific here set ShutDownOk variable
  If ShutDownOk Then
    Call CloseAllForms(Forms, True)
    UserAppShutDown = True
  End If
End Function

