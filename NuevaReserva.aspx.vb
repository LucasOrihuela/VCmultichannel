Public Class NuevaReserva
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim cookie = Request.Cookies.Get("session")
            If cookie Is Nothing Then
                Response.Redirect("Login.aspx")
            Else
                If (Not IsPostBack) Then

                    If Session("fechaReserva") IsNot Nothing Then
                        txtFecha.Text = Session("fechaReserva")
                        Dim Daux As DateTime
                        Daux = Convert.ToDateTime(txtFecha.Text)
                        txtFechaDB.Text = Daux.ToString(("yyyyMMdd"))
                    End If

                    If IsDate(Request("Fecha")) And Not Request("Fecha") = "" Then
                        txtFecha.Text = Request("FEcha")
                        Dim Daux As DateTime

                        Daux = Convert.ToDateTime(txtFecha.Text)
                        txtFechaDB.Text = Daux.ToString(("yyyyMMdd"))
                    ElseIf Session("fechaReserva") Is Nothing Then
                        txtFecha.Text = DateTime.Now.ToString(("MMMM dd, yyyy"))
                        txtFechaDB.Text = DateTime.Now.ToString(("yyyyMMdd"))
                    End If

                    CargarFunciones()


                    Session.Remove("fechaReserva")
                    CargarMapa()
                End If
            End If

        Catch ex As Exception
            Dim msg = ex.Message
        End Try
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.ServerClick
        Dim Daux As DateTime
        Daux = Convert.ToDateTime(txtFecha.Text)
        txtFecha.Text = Daux.AddDays(1).ToString(("MMMM dd, yyyy"))
        txtFechaDB.Text = Daux.AddDays(1).ToString(("yyyyMMdd"))

        CargarMapa()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.ServerClick
        Dim Daux As DateTime
        Daux = Convert.ToDateTime(txtFecha.Text)
        txtFecha.Text = Daux.AddDays(-1).ToString(("MMMM dd, yyyy"))
        txtFechaDB.Text = Daux.AddDays(-1).ToString(("yyyyMMdd"))

        CargarMapa()
    End Sub







    Protected Sub CargarMapa()
        Dim cookie = Request.Cookies.Get("session")
        Dim objSeguridad As New clsSeguridad
        Dim ds As DataSet
        Dim objDB As New clsDB
        Dim param As New Dictionary(Of String, String)

        param.Add("Usuario", objSeguridad.ConnGet(cookie("id")))
        param.Add("Fecha", txtFechaDB.Text + " " + ddlTurno.SelectedValue.ToString() + ":00")

        ds = objDB.ExecuteSP("SP_RE_Lugares", param)

        Repeater2.DataSource = ds
        Repeater2.DataBind()
    End Sub


    Protected Sub CargarFunciones()
        Dim cookie = Request.Cookies.Get("session")
        Dim objSeguridad As New clsSeguridad
        Dim ds As DataSet
        Dim objDB As New clsDB
        Dim param As New Dictionary(Of String, String)

        param.Add("Usuario", objSeguridad.ConnGet(cookie("id")))
        param.Add("Fecha", txtFechaDB.Text)

        ds = objDB.ExecuteSP("SP_RE_Reserva_Listar", param)

        ddlTurno.DataSource = ds
        ddlTurno.DataBind()
    End Sub
    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)


    End Sub

    Protected Sub generarReserva()

        Try



            Dim cookie = Request.Cookies.Get("session")
            Dim objSeguridad As New clsSeguridad
            Dim ds As DataSet
            Dim objDB As New clsDB
            Dim param As New Dictionary(Of String, String)
            Dim fechaDesde As DateTime
            fechaDesde = Convert.ToDateTime(txtFecha.Text + " " + ddlTurno.SelectedValue.ToString() + ":00")
            Dim fechaDesde1 = fechaDesde.AddDays(1)

            param.Add("Lugar", btnValor.Text)
            param.Add("User", objSeguridad.ConnGet(cookie("user")))
            param.Add("FechaDesde", fechaDesde.ToString)
            param.Add("FechaHasta", fechaDesde1.ToString)

            ds = objDB.ExecuteSP("SP_RE_Reserva_Generar", param)

            If ds.Tables(0).Rows(0).Item(0) = "OK" Then
                lblPregunta.Text = ds.Tables(0).Rows(0).Item(1)
                lblError.Text = ""

            Else
                lblPregunta.Text = ds.Tables(0).Rows(0).Item(1)
            End If

            imgLugar.Src = imgURL.Text

            mostrar(btnAceptar, True)
            mostrar(btnYES, False)
            mostrar(btnNO, False)
            divEmergente(1)
        Catch ex As Exception
            lblPregunta.Text = Err.Description
            mostrar(btnAceptar, True)
            mostrar(btnYES, False)
            mostrar(btnNO, False)
            divEmergente(1)
        End Try

    End Sub

    Protected Sub mostrar(nombre As Object, bool As Boolean)
        If bool = True Then
            nombre.Attributes.Remove("style")
        Else
            nombre.Attributes.Add("style", "display:none")
        End If
    End Sub

    Protected Sub divEmergente(val As Integer)
        If val = 0 Then
            divOverlay.Attributes.Add("style", "display:none")
            divPopUP.Attributes.Add("style", "display:none")
        ElseIf val = 1 Then
            divOverlay.Attributes.Remove("style")
            divPopUP.Attributes.Remove("style")
        Else
        End If
    End Sub

    Protected Sub cerrrarDiv()
        If btnAceptar.Enabled Then
            mostrar(btnYES, True)
            mostrar(btnNO, True)
            mostrar(btnAceptar, False)
        End If

        divEmergente(0)
    End Sub

    Protected Sub redirectMisReservas(sender As Object, e As EventArgs)
        If lblError.Text = "" Then Response.Redirect("MisReservas.aspx")
    End Sub

    Private Sub ddlTurno_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlTurno.SelectedIndexChanged
        CargarMapa()
    End Sub
End Class