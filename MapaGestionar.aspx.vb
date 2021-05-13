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
                Sql = "update tblRE_Lugares set idEstado=" + DropDownList2.SelectedValue.ToString() + " , CoordenadaX=" + txtX.Text + ", CoordenadaY=" + txtY.Text + " where id=" + DropDownList1.Text + "; select 1"
                'Else
                '    Sql = "update tblRE_LugaresGrupos set    CoordenadaX=" + txtX.Text + ", CoordenadaY=" + txtY.Text + " where id=" + DropDownList3.Text + "; select 1"
                Using command As New SqlCommand(Sql, connection)
                    connection.Open()
                    Using reader As SqlDataReader = command.ExecuteReader()

                        If (reader.Read()) Then
                            Response.Redirect("MapaGestionar.aspx")
                        End If
                    End Using

                End Using

            End If
        End Using

    End Sub



    Function fnCargar() As Boolean

        Dim lista As New List(Of String)
        Dim myFilePath As String = Server.MapPath(".\dist\img\Lugares\")
        Dim files() As String = IO.Directory.GetFiles(myFilePath)

        For Each file As String In files

            ddlFoto.Items.Add(Dir(file))

        Next


        ddlFoto.DataSource = lista

        Return 1

    End Function


End Class