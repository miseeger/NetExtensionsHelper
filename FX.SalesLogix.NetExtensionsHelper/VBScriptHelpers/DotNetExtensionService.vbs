Const RESULT_OK = "OK"

Class ExtensionService

    Dim extHandle

    Public Sub Load(ByVal ExtensionName, ByVal ExtensionClass)
    Dim args(4)

        ' Initialisierung
        args(0) = 1234567890
        args(1) = false
        args(2) = false
        args(3) = ""

        ' Handle erstellen und Service-Instanz initialisieren
        extHandle = Application.Managed.Create(ExtensionName, ExtensionClass)
        Application.Managed.Run extHandle, args
    End Sub


    Public Function Execute (ByVal Command, ByVal CommandArgs)
    Dim args(1)

        ' Initialisierung
        args(0) = "CMD:" & UCase(Command)
        args(1) = CommandArgs

        ' Servicekommando Ausführen
        Execute = Application.Managed.Run (extHandle, args)
    End Function


    Public Sub Unload()
        Application.Managed.Destroy extHandle
    End Sub


    Private Sub Class_Initialize()
    End Sub


    Private Sub Class_Terminate()
        Unload
    End Sub

End Class