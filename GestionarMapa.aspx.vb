Imports System.Data.SqlClient
Partial Class MapaGestionar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim cookie = Request.Cookies.Get("session")
            If cookie Is Nothing Then
                Response.Redirect("Login.aspx")
            Else
                If (Not IsPostBack) Then
                    fnCargar()
                End If
            End If
        Catch ex As Exception
            Dim msg = ex.Message

        End Try

    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)
        Using connection As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings(“RE”).ConnectionString)

            Dim Sql As String
            If (DropDownList1.SelectedValue.ToString() <> "0") Then
                Sql = "update tblRE_Escritorios set idEstado=" + DropDownList2.SelectedValue.ToString() + " , CoordenadaX=" + txtX.Text + ", CoordenadaY=" + txtY.Text + " where id=" + DropDownList1.Text + "; select 1"
            Else
                Sql = "update tblRE_EscritoriosGrupos set    CoordenadaX=" + txtX.Text + ", CoordenadaY=" + txtY.Text + " where id=" + DropDownList3.Text + "; select 1"
            End If
            Using command As New SqlCommand(Sql, connection)
                connection.Open()
                Using reader As SqlDataReader = command.ExecuteReader()

                    If (reader.Read()) Then
                        Response.Redirect("MapaGestionar.aspx")
                    End If
                End Using

            End Using

        End Using

    End Sub

    Protected Sub generarCambio()

        mostrar(btnAceptar, True)
        mostrar(btnYES, False)
        mostrar(btnNO, True)
        mostrar(DropDownList3, False)
        mostrar(DropDownList1, True)
        mostrar(DropDownList2, True)
        mostrar(lblEstado, True)
        divEmergente(1)
        lblPregunta.Text = "Elija el escritorio a cambiar"
        lblCambiar.Text = "Escritorio n°"
    End Sub

    Protected Sub generarCambioGrupo()

        mostrar(btnAceptar, True)
        mostrar(btnYES, False)
        mostrar(btnNO, True)
        mostrar(DropDownList1, False)
        mostrar(DropDownList2, False)
        mostrar(lblEstado, False)
        mostrar(DropDownList3, True)
        divEmergente(1)
        lblPregunta.Text = "Elija el grupo a cambiar"
        lblCambiar.Text = "Grupo n°"
    End Sub

    Function fnCargar() As Boolean

        'Dim lista As New List(Of String)
        'Dim myFilePath As String = Server.MapPath(".\dist\img\escritorio\")
        'Dim files() As String = IO.Directory.GetFiles(myFilePath)

        'For Each file As String In files
        '    'lista.Add(".\dist\img\escritorio\" & ddlFoto.SelectedValue & "\" + Dir(file))
        '    ddlFoto.Items.Add(Dir(file))

        'Next


        'ddlFoto.DataSource = lista

        Return 1

    End Function

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

    Protected Sub cerrarDiv()
        If btnAceptar.Enabled Then
            mostrar(btnYES, True)
            mostrar(btnNO, True)
            mostrar(btnAceptar, False)
        End If

        divEmergente(0)
    End Sub

    Protected Sub cerrarDivSinCambio()
        If btnAceptar.Enabled Then
            mostrar(btnYES, True)
            mostrar(btnNO, True)
            mostrar(btnAceptar, False)
        End If
        DropDownList1.SelectedValue = 0
        divEmergente(0)
    End Sub

End Class