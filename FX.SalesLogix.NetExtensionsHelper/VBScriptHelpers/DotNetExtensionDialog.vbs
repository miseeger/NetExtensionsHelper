' Customer FX .NET Extensions Helper
' Copyright © 2011 Customer FX Corporation

Option Explicit

Sub ShowDialog(ByVal ExtensionName, ByVal ExtensionClass, ByVal RecordID)
    ShowDialogWithCallback ExtensionName, ExtensionClass, RecordID, ""
End Sub

    
Sub ShowDialogWithCallback(ByVal ExtensionName, ByVal ExtensionClass, ByVal RecordID, ByVal CallbackName)
Dim ext
Dim args(2)

    args(0) = RecordID
    If CallbackName <> "" Then Set args(1) = GetRef(CallbackName)

    ext = Application.Managed.Create(ExtensionName, ExtensionClass)
    Application.Managed.Run ext, args

    Application.Managed.Destroy ext
End Sub