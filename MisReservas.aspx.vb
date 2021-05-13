Imports System.Data
Partial Class MisReservas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objSeguridad As New clsSeguridad
        Try
            Dim cookie = Request.Cookies.Get("session")
            If cookie Is Nothing Then
                Response.Redirect("Login.aspx")
            Else

                If (Not IsPostBack) Then
                    cargarReservas()
                End If
            End If
        Catch ex As Exception
            Dim varEx = ex.Message.ToString()
        End Try

    End Sub
    Protected Sub projects_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles Escritorios.ItemCommand
        Dim projectName = e.CommandName.ToString()
        Dim objSeguridad As New clsSeguridad
        Dim ds As DataSet
        Dim objDB As New clsDB
        Dim param As New Dictionary(Of String, String)

        If e.CommandName = "Delete" Then
            confirmarCancelarReserva(e.CommandArgument)
        End If

        cargarReservas()
    End Sub

    Protected Sub cargarReservas()
        Dim cookie = Request.Cookies.Get("session")
        Dim objSeguridad As New clsSeguridad
        Dim ds As DataSet
        Dim objDB As New clsDB
        Dim param As New Dictionary(Of String, String)

        param.Add("User", objSeguridad.ConnGet(cookie("user")))
        param.Add("id", objSeguridad.ConnGet(cookie("id")))

        ds = objDB.ExecuteSP("SP_RE_Mis_Reservas", param)
        Escritorios.DataSource = ds
        Escritorios.DataBind()
    End Sub

    Protected Function confirmarCancelarReserva(idReserva As Integer) As Boolean
        Dim ds As DataSet
        Dim objDB As New clsDB
        Dim param As New Dictionary(Of String, String)

        param.Add("idReserva", idReserva)

        ds = objDB.ExecuteSP("SP_RE_Reserva_Obtener", param)

        If ds.Tables(0).Rows(0).Item(0) = "OK" Then

            Dim escritorio As String = ds.Tables(0).Rows(0).Item(2)
            Dim fecha As String = ds.Tables(0).Rows(0).Item(3)

            lblDato.Text = idReserva.ToString()
            lblPregunta.Text = "¿Quiere eliminar la reserva del lugar N° " + escritorio + " en la fecha"
            lblFecha.Text = fecha + " ?"
            divEmergente(1)
            mostrar(btnYES, True)
            mostrar(btnNO, True)
            mostrar(btnAceptar, False)
        End If

    End Function

    Protected Sub eliminarReserva()
        Dim objSeguridad As New clsSeguridad
        Dim ds As DataSet
        Dim objDB As New clsDB
        Dim param As New Dictionary(Of String, String)
        Dim cookie = Request.Cookies.Get("session")

        param.Add("idReserva", lblDato.Text)
        param.Add("Usuario", objSeguridad.ConnGet(cookie("id")))
        ds = objDB.ExecuteSP("SP_RE_Reserva_Eliminar", param)

        lblMensaje.Font.Size = 15

        If ds.Tables(0).Rows(0).Item(0) = "OK" Then
            plMensaje.Visible = True
            iconoError.Visible = False
            divMensaje.Style("background-color") = "#83F915"
            lblTituloMensaje.Text = "Exito"
            lblMensaje.Text = "✓ Reserva cancelada satisfactoriamente"
        ElseIf ds.Tables(0).Rows(0).Item(0) = "ERROR_RESERVA" Then
            divMensaje.Style("background-color") = "#FA3718"
            plMensaje.Visible = True
            iconoError.Visible = True
            lblTituloMensaje.Text = "Error"
            lblMensaje.Text = "X La reserva no esta registrada"
        Else
            divMensaje.Style("background-color") = "#FA3718"
            plMensaje.Visible = True
            iconoError.Visible = True
            lblTituloMensaje.Text = "Error"
            lblMensaje.Text = "X ERROR! Hubo un error inesperado"
        End If

        divMensaje.Style("background-color") = "#D0CDCC"
        lblTituloMensaje.Style("color") = "#3390EE"
        lblMensaje.Style("color") = "#3390EE"
        cargarReservas()
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

    Protected Sub mostrar(nombre As Object, bool As Boolean)
        If bool = True Then
            nombre.Attributes.Remove("style")
        Else
            nombre.Attributes.Add("style", "display:none")
        End If
    End Sub

    Protected Sub redirectHere()

        divEmergente(0)
        cargarReservas()
    End Sub

End Class