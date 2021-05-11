Imports RE_Escritorio.clsLOG
Imports System.IO
Public Class SiteMaster
    Inherits MasterPage

    Public ImagenUser As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objSeguridad As New clsSeguridad
        Try
            Dim stResult As String
            Dim cookie = Request.Cookies.Get("session")
            If cookie Is Nothing Then
                Response.Redirect("Login.aspx")
            Else

                If (Not IsPostBack) Then

                    If objSeguridad.ConnGet(cookie("idPerfil")) <= 1 Then 'Habilita el divAdmin segun el perfil del usuario
                        divAdmin.Attributes.Remove("style")
                    End If

                    lblBienvenida.Text = objSeguridad.ConnGet(cookie("user"))
                    lblPerfil.Text = objSeguridad.ConnGet(cookie("perfil"))
                    imgFoto.Src = ".\dist\Img\Users\" & objSeguridad.ConnGet(cookie("id")) & ".png" 'trae foto

                    Dim myFilePath As String = Server.MapPath(".\dist\Img\Users\" & objSeguridad.ConnGet(cookie("id")) & ".png")
                    lblPErfilAlerta.Visible = False
                    If Not File.Exists(myFilePath) Then
                        imgFoto.Src = "./dist/img/Users/default.png"
                        lblPErfilAlerta.Visible = True
                    End If

                    'Dim ds As DataSet

                    'Dim TenisReservas As Integer
                    'Dim objDB As New clsDB
                    'Dim param As New Dictionary(Of String, String)
                    'param.Add("Vecino", objSeguridad.ConnGet(cookie("id")))


                    'ds = objDB.ExecuteSP("[SP_ARS_Usuario_Mensajes]", param, stResult)

                    'TenisReservas = ds.Tables(0).Rows(0).Item("TenisReservas")
                    'If ds.Tables(0).Rows(0).Item("Perfil") = "3" Then
                    '    HLTenisCanchas.visible = True
                    'End If
                    'If TenisReservas > 0 Then
                    '    lblReservasTenis.Text = TenisReservas
                    'Else
                    '    lblReservasTenis.Visible = False
                    'End If



                End If
            End If
        Catch ex As Exception
            Dim err = ex.Message
        End Try

    End Sub

    Public Shared Function cookieDestroy(ByVal sName As String, ByVal Context As HttpContext) As HttpCookie
        Try
            If Context.Request.Cookies(sName) IsNot Nothing Then
                Dim oCookie As New HttpCookie(sName)
                oCookie.Value = Context.Request.Cookies(sName).Value
                oCookie.Expires = DateTime.Now.AddDays(-10)
                Return oCookie
            Else
                Return Nothing
            End If
        Catch ex As Exception
            generateError("cookieDestroy ex = " + ex.Message)
            Return Nothing
        End Try
    End Function
    Protected Sub Cerrar_Sesion()
        Session.Abandon()
        Dim oCookie = cookieDestroy("session", HttpContext.Current)
        If oCookie IsNot Nothing Then
            Response.Cookies.Add(oCookie)
        End If
        Response.Redirect(ConfigurationManager.AppSettings("URL_CONTEXT_PREFIX") + "Login.aspx")
    End Sub
    Protected Sub btnCerrarSession_Click(sender As Object, e As EventArgs) Handles btnCerrarSesion.ServerClick
        Cerrar_Sesion()
    End Sub

End Class