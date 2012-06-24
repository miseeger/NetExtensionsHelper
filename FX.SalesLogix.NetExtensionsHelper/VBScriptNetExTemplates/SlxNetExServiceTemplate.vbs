' Copy the following lines of code into your AXForm script or VBScript
' script, include the script "DotNetExtensionService" from your plugin 
' repository and be sure to attach following AX-Methods to their according
' EventHandler in an SLX ActiveForm.

'Including Script - System dotNet:DotNetExtensionService

option explicit

Dim ext

Sub AXFormCreate(Sender)
    Set ext = new ExtensionService
    extS.Load "<ExtensionTitle>", "<Namespace.ServiceClassName>"
End Sub


Sub AXFormDestroy(Sender)
    Set ext = Nothing
End Sub


Sub ButtonClick(Sender)
Dim args(0)

    args(0) = "HelloWorldTextArgument"
    extS.Execute "HelloWorld", args

End Sub
