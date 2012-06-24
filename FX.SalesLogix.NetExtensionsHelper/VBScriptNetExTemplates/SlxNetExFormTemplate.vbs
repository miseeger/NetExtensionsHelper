' Copy the following lines of code into your AXForm script, include 
' the script "DotNetExtensionControl" from your plugin repository and
' be sure to attach all the following AX-Methods to their according
' EventHandler in the SLX ActiveForm.

'Including Script - System dotNet:DotNetExtensionControl

option explicit

Dim ext

Sub AXFormCreate(Sender)
    Set ext = new ExtensionControl
End Sub


Sub AXFormOpen(Sender)
    ext.Load "<ExtensionTitle>", "<Namespace.UserControlName>", Form.HWND, true
End Sub


Sub AXFormChange(Sender)
    ' Add the following line to set any current Id on record changing ...
	' ... for example the CurrentAccountId using the Application object:
	' ext.CurrentId = Application.BasicFunctions.CurrentAccountId
End Sub


Sub AXFormResize(Sender)
	' Call the built-in command "Resize" for ExtensionControls whenever
	' the size of the form changes:
    if not(IsEmpty(ext)) then ext.Resize
End Sub


Sub AXFormDestroy(Sender)
    Set ext = Nothing
End Sub