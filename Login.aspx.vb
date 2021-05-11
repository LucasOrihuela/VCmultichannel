Public Class Login
    Inherits System.Web.UI.Page

    Public classError As String = "danger"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim cookie = Request.Cookies.Get("session")
        If Not cookie Is Nothing Then
            LoginCookie(cookie("user"), cookie("pass"))
        End If

        If Not IsPostBack Then
            Session.Abandon()
        End If

    End Sub


    Protected Sub Login() Handles btnLogin.Click
        Dim redirectAgregar As Boolean = False
        Dim str As String = ""
        Dim objUser As clsUser
        Dim objSeguridad As New clsSeguridad
        Try
            Dim strUser As String = CType(Me.FindControl("user"), HtmlInputText).Value
            Dim strPass As String = CType(Me.FindControl("pass"), HtmlInputPassword).Value
            'objUser = New clsUser(strUser, objSeguridad.ConnPut(strPass))
            objUser = New clsUser(strUser, strPass)
            objUser.Login()

            If objUser.logued Then
                Session("user") = objUser

                Dim user As clsUser
                user = Session("user")

                Dim cookie = New HttpCookie("session")
                cookie.Values.Add("user", objSeguridad.ConnPut(user.user))
                cookie.Values.Add("pass", objSeguridad.ConnPut(user.password))
                cookie.Values.Add("name", objSeguridad.ConnPut(user.name))
                cookie.Values.Add("email", objSeguridad.ConnPut(user.email))
                cookie.Values.Add("idPerfil", objSeguridad.ConnPut(user.profile))
                cookie.Values.Add("perfil", objSeguridad.ConnPut(user.perfil))
                cookie.Values.Add("id", objSeguridad.ConnPut(user.id))
                cookie.Expires = DateTime.Now.AddDays(2)
                Response.Cookies.Add(cookie)

                redirectAgregar = True

            Else
                mensajeError.Visible = True
                lblMensajeError.Text = objUser.loguedMessage
                If objUser.loguedErrorType = 2 Then
                    lblTituloMensajeError.Text = "Error!"
                ElseIf objUser.loguedErrorType = 1 Then
                    lblTituloMensajeError.Text = "Advertencia!"
                    classError = "warning"
                End If

            End If

        Catch ex As Exception
            Dim a = ex.Message
        End Try

        If redirectAgregar Then
            Response.Redirect("MisReservas.aspx")
        End If
    End Sub

    Protected Sub LoginCookie(ByVal strUser As String, ByVal strPass As String)
        Dim redirectAgregar As Boolean = False
        Dim str As String = ""
        Dim objUser As clsUser
        Try

            objUser = New clsUser(strUser, strPass)
            objUser.Login()

            If objUser.logued Then
                Session("user") = objUser

                redirectAgregar = True
            End If

        Catch ex As Exception
            clsLOG.generateError("Login - LoginCookie - Exception: " + ex.Message)
        End Try
    End Sub

    'Protected Sub btnAgregarUsuario_Click(sender As Object, e As EventArgs) Handles btnAgregarUsuario.Click
    '    Response.Redirect("NuevoUsuario.aspx?")
    'End Sub

End Class