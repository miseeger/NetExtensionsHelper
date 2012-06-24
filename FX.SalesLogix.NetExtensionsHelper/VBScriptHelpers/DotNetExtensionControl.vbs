' Customer FX .NET Extensions Helper
' Copyright © 2011 Customer FX Corporation

'----------------------------------------------------------------------------------
' USAGE:
'
' Declare global ExtensionControl class variable
' Dim ext
'
' On form open, instatiate the class and call Load, passing the following:
' Param 1: Extension title
' Param 2: Namespace.ClassName for the extension
' Param 3: Handle (HWND) of the container to embed the control in
' Param 4: Boolean to indicate to resize the control to fill the parent container
' Sub AXFormOpen(Sender)
'     Set ext = new ExtensionControl
'     ext.Load "SampleExtension", "SampleExtension.UserControl1", Form.HWND, True
' End Sub
'
' On record change, set the CurrentID property for the extension
' Sub AXFormChange(Sender)
'     ext.CurrentID = Form.CurrentID
' End Sub
'----------------------------------------------------------------------------------

Option Explicit

Class ExtensionControl

    Dim extHandle
    Dim forceResize

    
    Public Sub Load(ByVal ExtensionName, ByVal ExtensionClass, ByRef ParentHandle, ByVal FillParent)
        LoadWithCallback ExtensionName, ExtensionClass, ParentHandle, FillParent, ""
    End Sub

    
    Public Sub LoadWithCallback(ByVal ExtensionName, ByVal ExtensionClass, ByRef ParentHandle, ByVal FillParent, ByVal CallbackName)
    Dim args(4)

        args(0) = ParentHandle
        args(1) = FillParent
        args(2) = forceResize
        If CallbackName <> "" Then Set args(3) = GetRef(CallbackName)

        extHandle = Application.Managed.Create(ExtensionName, ExtensionClass)
        Application.Managed.Run extHandle, args
    End Sub


    Public Property Let ForceResizeMode(ByVal ForceResizeValue)
        forceResize = ForceResizeValue
    End Property


    Public Property Let CurrentID(ByVal RecordID)
        Application.Managed.Run extHandle, RecordID
    End Property


    Public Sub Resize
        Application.Managed.Run extHandle, "CMD:Resize"
    End Sub


    Public Sub Unload()
        Application.Managed.Destroy extHandle
    End Sub


    Private Sub Class_Initialize()
        forceResize = False
    End Sub


    Private Sub Class_Terminate()
        Unload
    End Sub

End Class