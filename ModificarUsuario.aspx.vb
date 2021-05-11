Imports System.IO
Partial Class ModificarUsuario
    Inherits System.Web.UI.Page
    Dim stNombre As String
    Dim stPagina As String
    Dim stCampo As String
    Dim stRuta As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objSeguridad As New clsSeguridad
        Dim cookie = Request.Cookies.Get("session")
        If cookie Is Nothing Then
            Response.Redirect("Login.aspx")
        Else
            If (Not IsPostBack) Then
                If Not Me.IsPostBack Then
                    txtRuta.Text = ".\dist\img\Users\"
                    Dim rutaArchivo = txtRuta.Text + objSeguridad.ConnGet(cookie("id")) + ".png"

                    If IO.Directory.Exists(".\dist\img\Users\temp\") Then
                        If IO.File.Exists(rutaArchivo) Then
                            System.IO.File.Delete(Server.MapPath(rutaArchivo))
                        End If
                        System.IO.Directory.Delete(Server.MapPath(".\dist\img\Users\temp\"))
                    End If

                    MultiView1.ActiveViewIndex = 0

                    If IO.File.Exists(Server.MapPath(rutaArchivo)) Then
                        txtCampo.Text = Request("Campo")
                        txtArchivo.Text = objSeguridad.ConnGet(cookie("id")) & ".png"
                        imgFoto.Src = txtRuta.Text + txtArchivo.Text
                    Else
                        txtRuta.Text = ".\dist\img\Users\"
                        txtArchivo.Text = "default" & ".png"
                        imgFoto.Src = txtRuta.Text + txtArchivo.Text
                    End If

                Else
                    MultiView1.ActiveViewIndex = 1
                End If
                CargarDatos()
            End If

            If FileUpload1.HasFile Then
                MostrarImg()
            End If
        End If


    End Sub
    Protected Sub CargarDatos()
        Dim objDB As New clsDB
        Dim param As New Dictionary(Of String, String)

        Dim ds As DataSet
        Dim objSeguridad As New clsSeguridad

        Dim stResult As String
        stResult = ""
        Dim cookie = Request.Cookies.Get("session")
        Try

            param.Add("idUsuario", objSeguridad.ConnGet(cookie("id")))
            ds = objDB.ExecuteSP("[SP_RE_Usuario_Obtener]", param, stResult)

            txtNombre.Text = ds.Tables(0).Rows(0).Item("Nombre")
            txtEmail.Text = ds.Tables(0).Rows(0).Item("Mail")
            txtTelefono.Text = ds.Tables(0).Rows(0).Item("Telefono")
            txtClave.Text = ""

        Catch ex As Exception
            lblError.Text = Err.Description
        End Try
    End Sub

    Protected Sub btnGuardarCambios_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnGuardarCambios.Click
        Dim ds As DataSet
        Dim objDB As New clsDB
        Dim stResult As String
        Dim objSeguridad As New clsSeguridad
        Dim param As New Dictionary(Of String, String)
        stResult = ""
        Dim cookie = Request.Cookies.Get("session")
        Dim rutaTemporal = ".\dist\img\Users\temp\"
        Dim rutaArchivo = rutaTemporal + objSeguridad.ConnGet(cookie("id")) + ".png"
        Dim rutaOriginal = ".\dist\img\Users\"

        param.Add("idUsuario", objSeguridad.ConnGet(cookie("id")))
        param.Add("Nombre", txtNombre.Text)
        param.Add("Mail", txtEmail.Text)
        param.Add("Telefono", txtTelefono.Text)
        param.Add("Clave", txtClave.Text)

        Try
            ds = objDB.ExecuteSP("SP_RE_Usuario_Modificar", param, stResult)

            If ds.Tables(0).Rows(0).Item("Mensaje") = "OK" Then
                If IO.File.Exists(Server.MapPath(rutaArchivo)) Then
                    System.IO.File.Delete(Server.MapPath(rutaOriginal + objSeguridad.ConnGet(cookie("id")) + ".png"))
                    File.Move(Server.MapPath(rutaArchivo), Server.MapPath(rutaOriginal + objSeguridad.ConnGet(cookie("id")) + ".png"))
                Else
                    CargarArchivo()
                End If

            Else
                lblError.Text = stResult
            End If
        Catch ex As Exception
            Dim mensajeErr = ex.Message
            lblError.Text = Err.Description
        End Try

        If IO.Directory.Exists(".\dist\img\Users\temp\") Then
            System.IO.File.Delete(Server.MapPath(rutaArchivo))
            System.IO.Directory.Delete(Server.MapPath(".\dist\img\Users\temp\"))
        End If

        Response.Redirect("MisReservas.aspx")
    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnCancelar.Click
        Dim objSeguridad As New clsSeguridad
        Dim cookie = Request.Cookies.Get("session")
        Dim rutaArchivo = ".\dist\img\Users\temp\" + objSeguridad.ConnGet(cookie("id")) + ".png"

        If IO.Directory.Exists(".\dist\img\Users\temp\") Then
            System.IO.File.Delete(Server.MapPath(rutaArchivo))
            System.IO.Directory.Delete(Server.MapPath(".\dist\img\Users\temp\"))
        End If

        Response.Redirect("MisReservas.aspx")
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        CargarArchivo()
    End Sub

    Function CargarArchivo(Optional temp As String = "") As Boolean
        Dim stRuta As String
        If temp = "" Then
            stRuta = ".\dist\img\Users\"
        Else
            stRuta = temp
        End If
        Dim CTE_MAX As String = 10000000 ' WebConfigurationManager.AppSettings("MT.CTE_MAX_FOTO")

        Dim objSeguridad As New clsSeguridad
        Dim cookie = Request.Cookies.Get("session")


        CargarArchivo = True

        Dim f As FileUpload = CType(Me.FindControl("FileUpload1"), FileUpload)
        If f.HasFile Then
            If f.FileBytes.Length < CLng(CTE_MAX) Then
                If Not txtArchivo.Text = "" Then
                    stNombre = txtArchivo.Text
                Else
                    stNombre = f.FileName
                End If

                f.SaveAs(Server.MapPath(stRuta) & "\" & objSeguridad.ConnGet(cookie("id")) & ".png")
                Label1.Text = stNombre
                Response.Write("<script language=javascript>")
                Response.Write("window.close();</script>")

            Else
                CargarArchivo = False
                ErrorMessage.Text = "La foto es demasiado grande. Intente recortarla "
            End If
        End If

    End Function

    Protected Sub MostrarImg()
        Dim objSeguridad As New clsSeguridad
        Dim cookie = Request.Cookies.Get("session")
        Dim rutaArchivo = ".\dist\img\Users\temp\" + objSeguridad.ConnGet(cookie("id")) + ".png"

        If IO.File.Exists(rutaArchivo) Then
        Else
            System.IO.Directory.CreateDirectory(Server.MapPath(".\dist\img\Users\temp\"))
        End If
        CargarArchivo(".\dist\img\Users\temp\")
        imgFoto.Src = rutaArchivo

    End Sub

End Class