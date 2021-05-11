Imports System.Data
Partial Class Reservar
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

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)

        'Using (SqlConnection connection = New SqlConnection(ConfigurationManager.ConnectionStrings["MudadoraConnectionString"].ConnectionString.ToString()))

        '        String Sql;
        '        If (DropDownList1.SelectedValue.ToString()!= "0") Then
        '        Sql = "update tblROEscritorios set idEstado=" + DropDownList2.SelectedValue.ToString() + " , CoordenadaX=" + txtX.Text + ", CoordenadaY=" + txtY.Text + " where id=" + DropDownList1.Text + "; select 1";  
        '        Else
        '        Sql = "update tblROEscritoriosGrupos set    CoordenadaX=" + txtX.Text + ", CoordenadaY=" + txtY.Text + " where id=" + DropDownList3.Text + "; select 1";

        '        Using (SqlCommand command = New SqlCommand(sql, connection))

        '            connection.Open();
        '            Using (SqlDataReader reader = command.ExecuteReader())

        '                While (reader.Read())
        '                {
        '                    Response.Redirect("WebForm1.aspx");
        '                }
        '            End Using

        '        End Using

        'End Using

    End Sub

    Protected Sub CargarMapa()
        Dim cookie = Request.Cookies.Get("session")
        Dim objSeguridad As New clsSeguridad
        Dim ds As DataSet
        Dim objDB As New clsDB
        Dim param As New Dictionary(Of String, String)

        param.Add("Usuario", objSeguridad.ConnGet(cookie("id")))
        param.Add("Fecha", txtFechaDB.Text)

        ds = objDB.ExecuteSP("SP_RE_Escritorios", param)

        Repeater2.DataSource = ds
        Repeater2.DataBind()
    End Sub

    Protected Sub generarReserva()
        Dim cookie = Request.Cookies.Get("session")
        Dim objSeguridad As New clsSeguridad
        Dim ds As DataSet
        Dim objDB As New clsDB
        Dim param As New Dictionary(Of String, String)
        Dim fechaDesde As DateTime
        fechaDesde = Convert.ToDateTime(txtFecha.Text)
        Dim fechaDesde1 = fechaDesde.AddDays(1)

        param.Add("Escritorio", btnValor.Text)
        param.Add("User", objSeguridad.ConnGet(cookie("user")))
        param.Add("FechaDesde", fechaDesde.ToString)
        'param.Add("FechaHasta", (fechaDesde1.ToString  DropDownList0.SelectedValue.ToString))

        ds = objDB.ExecuteSP("SP_RE_Reserva_Generar", param)

        If ds.Tables(0).Rows(0).Item(0) = "OK" Then
            lblPregunta.Text = "Escritorio N° " + btnValor.Text + " reservado para la fecha " + fechaDesde.ToString().Remove(9)
        ElseIf ds.Tables(0).Rows(0).Item(0) = "EROR_RESERVA" Then
            lblPregunta.Text = "Error al generar la reserva"
        Else
            lblPregunta.Text = "ERROR"
        End If

        imgEscritorio.Src = imgURL.Text

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