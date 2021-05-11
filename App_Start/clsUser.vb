

Public Class clsUser
    Public user As String
    Public name As String
    Public password As String
    Public perfil As String
    Public departamento As Integer
    Public auditor As Integer
    Public email As String
    Public telefono As String
    Private _foto As String = ""
    Private _profile As Integer
    Public _id As String
    Private _pass As String
    Private _logued As Boolean = False
    Private _loguedMessage As String
    Private _loguedErrorType As Integer = 2

    Public ReadOnly Property loguedErrorType() As Integer
        Get
            Return Me._loguedErrorType
        End Get
    End Property
    Public ReadOnly Property logued() As String
        Get
            Return Me._logued
        End Get
    End Property
    Public ReadOnly Property loguedMessage() As String
        Get
            Return Me._loguedMessage
        End Get
    End Property
    Public ReadOnly Property profile() As Integer
        Get
            Return Me._profile
        End Get
    End Property
    Public ReadOnly Property foto() As String
        Get
            Return Me._foto
        End Get
    End Property
    Public ReadOnly Property id() As String
        Get
            Return Me._id
        End Get
    End Property
    Public Sub New(ByVal strUser As String, ByVal strPass As String)
        Me.user = strUser
        Me._pass = strPass
        Me.password = strPass

    End Sub

    Public Sub New()
    End Sub

    Public Sub Login()
        Try

            Dim objLogin As New clsLogin()
            Dim ds = objLogin.LoginUser(Me.user, Me._pass)

            If (ds IsNot Nothing) AndAlso (ds.Tables(0).Rows(0).Item("Mensaje") = "OK") Then

                Me._id = ds.Tables(0).Rows(0).Item("id")
                Me.user = ds.Tables(0).Rows(0).Item("Usuario")
                Me.password = ds.Tables(0).Rows(0).Item("Contraseña")
                Me.name = ds.Tables(0).Rows(0).Item("Nombre")
                Me.perfil = ds.Tables(0).Rows(0).Item("Perfil")
                Me._profile = ds.Tables(0).Rows(0).Item("idPerfil")
                Me.email = ds.Tables(0).Rows(0).Item("Mail")
                Me.telefono = ds.Tables(0).Rows(0).Item("Telefono")
                'le llena el resto de los datos al USER
                'Me._id = ds.Tables(ds.Tables.Count - 1).Rows(0).Item("Vecino")
                'If ds.Tables(ds.Tables.Count - 1).Rows(0).Item("PerfilNombre") Is DBNull.Value Then
                '    Me._profile = -1
                'Else
                '    Me._profile = ds.Tables(ds.Tables.Count - 1).Rows(0).Item("PerfilNombre")
                'End If

                'Me.name = ds.Tables(ds.Tables.Count - 1).Rows(0).Item("Nombre")
                'Me._foto = clsDB.checkDBNullorNothing(clsDB.checkDBNullorNothing(ds.Tables(0).Rows(0).Item("Foto")))

                Me._logued = True
            ElseIf (Not ds Is Nothing) AndAlso (ds.Tables(ds.Tables.Count - 1).Rows(0).Item(0) = "ERROR_LOGIN") Then
                Me._logued = False
                Me._loguedMessage = ds.Tables(ds.Tables.Count - 1).Rows(0).Item("MensajeResultado")
                Me._loguedErrorType = ds.Tables(ds.Tables.Count - 1).Rows(0).Item("ErrorTipo")
            Else
                Me._logued = False
            End If
        Catch ex As Exception
            clsLOG.generateError("clsLogin - LoginUser - Exception: " + ex.Message)
        End Try
    End Sub


    Public Sub obtenerUsuarioById(ByVal Id)

        If Not String.IsNullOrEmpty(Id) Then
            Dim listaParam As New Dictionary(Of String, String)
            listaParam.Add("IdUsuario", Id)
            listaParam.Add("OP", "id")

            Dim objDB As New clsDB()
            Dim ds = objDB.ExecuteSP("[SP_MDA_ObtenerClientes]", listaParam)

            If objDB.isValidDS(ds) Then
                Me.name = objDB.checkDBNullorNothing(ds.Tables(0).Rows(0).Item("name")).ToString
                Me.email = objDB.checkDBNullorNothing(ds.Tables(0).Rows(0).Item("Email")).ToString

                Me.password = objDB.checkDBNullorNothing(ds.Tables(0).Rows(0).Item("password")).ToString
            End If
        End If
    End Sub

End Class
