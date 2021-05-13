Public Class Pedidos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cargarddl()
        End If
        Try
            Dim cookie = Request.Cookies.Get("session")
            If cookie Is Nothing Then
                Response.Redirect("Login.aspx")
            Else

            End If


        Catch ex As Exception
            Dim msg = ex.Message
        End Try
    End Sub

    Protected Function cargarddl()
        Dim num As Integer
        For num = 1 To 33
            ddlAreas.Items.Add(num)
        Next
    End Function

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("MisReservas.aspx")
    End Sub

    Protected Sub btnGuardarReserva_Click(sender As Object, e As EventArgs) Handles btnGuardarReserva.Click
        generarReserva()
    End Sub

    Protected Sub generarReserva()
        Dim cookie = Request.Cookies.Get("session")
        Dim objSeguridad As New clsSeguridad
        Dim ds As DataSet
        Dim objDB As New clsDB
        Dim param As New Dictionary(Of String, String)
        Dim fechaDesde As DateTime
        fechaDesde = Convert.ToDateTime(CalendarioFechas.SelectedDate.ToString("dd/MM/yyyy") + " " + DropDownList0.SelectedValue.ToString() + ":00")
        Dim fechaDesde1 = fechaDesde.AddDays(1)

        param.Add("Lugar", ddlAreas.SelectedValue.ToString)
        param.Add("User", objSeguridad.ConnGet(cookie("user")))
        param.Add("FechaDesde", fechaDesde.ToString)
        param.Add("FechaHasta", fechaDesde1.ToString)

        ds = objDB.ExecuteSP("SP_RE_Reserva_Generar", param)

        If ds.Tables(0).Rows(0).Item(0) = "OK" Then
            lblPregunta.Text = "Escritorio N° " + ddlAreas.SelectedValue.ToString() + " reservado para la fecha " + fechaDesde.ToString().Remove(9) + " a las " + DropDownList0.SelectedValue.ToString()
        ElseIf ds.Tables(0).Rows(0).Item(0) = "EROR_RESERVA" Then
            lblPregunta.Text = "Error al generar la reserva"
        Else
            lblPregunta.Text = "ERROR"
        End If

        imgLugar.Src = imgURL.Text

        mostrar(btnAceptar, True)
        mostrar(btnYES, False)
        mostrar(btnNO, False)
        divEmergente(1)

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
        Response.Redirect("MisReservas.aspx")
    End Sub


End Class