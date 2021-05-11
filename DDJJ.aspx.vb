Imports System.Data
Imports System.Data.SqlClient

Partial Class DDJJ
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cookie = Request.Cookies.Get("session")
        If cookie Is Nothing Then
            Response.Redirect("Login.aspx")
        End If
    End Sub

    Protected Sub btnContinuarPanel1_Click(sender As Object, e As EventArgs) Handles btnContinuarPanel1.Click
        Panel1.Visible = False
        Panel2.Visible = True
    End Sub

    Protected Sub btnContinuarPanel2_Click(sender As Object, e As EventArgs) Handles btnContinuarPanel2.Click
        Panel2.Visible = False
        Panel3.Visible = True

    End Sub

    Protected Sub btnContinuarPanel3_Click(sender As Object, e As EventArgs) Handles btnContinuarPanel3.Click
        Panel3.Visible = False
        Panel4.Visible = True
    End Sub

    Protected Sub btnContinuarPanel4_Click(sender As Object, e As EventArgs) Handles btnContinuarPanel4.Click
        Panel4.Visible = False
        Panel5.Visible = True
    End Sub

    Protected Sub btnContinuarPanel6_Click(sender As Object, e As EventArgs) Handles btnContinuarPanel6.Click
        Panel6.Visible = False
        Panel7.Visible = True
    End Sub

    Protected Sub btnContinuarPanel5_Click(sender As Object, e As EventArgs) Handles btnContinuarPanel5.Click
        Panel5.Visible = False
        Panel6.Visible = True
    End Sub

    Protected Sub BtnContinuarPanel7_Click(sender As Object, e As EventArgs) Handles BtnContinuarPanel7.Click
        Dim lit As New Literal


        Dim vec() As String
        Dim sSql As String
        Dim da As New SqlDataAdapter
        Dim cmd As New SqlCommand()
        Dim dsResult As New DataSet
        Try


            Using RRHHConn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings(“RE”).ConnectionString)

                RRHHConn.Open()
                sSql = "exec [SP_RE_DeclaracionJurada_Guardar]  @Usuario ,@Temperatura, @Fecha ,@Dolor_De_Garganta ,@Dificultad_Respiratoria ,@Dolor_De_Cabeza ,@Diarrea ,@Vomitos ,@Dolor_Muscular ,@Perdida_De_Olfato ,@Perdida_De_Gusto ,@Tos ,@Contacto_Estrecho, @Contacto_Cercano ,@Cancer ,@Diabetes ,@Enfermedad_Hepatica ,@Enfermedad_Renal ,@Enfermedad_Respiratoria ,@Enfermedad_Cardiologica      "
                cmd.CommandText = sSql
                cmd.CommandType = CommandType.Text
                cmd.Connection = RRHHConn
                cmd.Parameters.AddWithValue("@Usuario", SqlDbType.Int)
                cmd.Parameters("@Usuario").Value = 1 'Session("stUser")


                cmd.Parameters.AddWithValue("@Temperatura", SqlDbType.Int) 'cambiar tipo de valor, si es int no puede tener valor con ,
                cmd.Parameters("@Temperatura").Value = txtTemperatura.Value

                cmd.Parameters.AddWithValue("@Fecha", SqlDbType.DateTime)
                cmd.Parameters("@Fecha").Value = DateTime.Now() 'DateAndTime.Today

                cmd.Parameters.AddWithValue("@Dolor_De_Garganta", SqlDbType.VarChar)
                If gargantaNO.Checked Then
                    cmd.Parameters("@Dolor_De_Garganta").Value = gargantaNO.Value
                Else
                    cmd.Parameters("@Dolor_De_Garganta").Value = gargantaSI.Value
                End If

                cmd.Parameters.AddWithValue("@Dificultad_Respiratoria", SqlDbType.VarChar)
                If respiratorioNO.Checked Then
                    cmd.Parameters("@Dificultad_Respiratoria").Value = respiratorioNO.Value
                Else
                    cmd.Parameters("@Dificultad_Respiratoria").Value = respiratorioSI.Value
                End If

                cmd.Parameters.AddWithValue("@Dolor_De_Cabeza", SqlDbType.VarChar)
                If cabezaNO.Checked Then
                    cmd.Parameters("@Dolor_De_Cabeza").Value = cabezaNO.Value
                Else
                    cmd.Parameters("@Dolor_De_Cabeza").Value = cabezaSI.Value
                End If

                cmd.Parameters.AddWithValue("@Diarrea", SqlDbType.VarChar)
                If diarreaNO.Checked Then
                    cmd.Parameters("@Diarrea").Value = diarreaNO.Value
                Else
                    cmd.Parameters("@Diarrea").Value = diarreaSI.Value
                End If

                cmd.Parameters.AddWithValue("@Vomitos", SqlDbType.VarChar)
                If vomitoNO.Checked Then
                    cmd.Parameters("@Vomitos").Value = vomitoNO.Value
                Else
                    cmd.Parameters("@Vomitos").Value = vomitoSI.Value
                End If

                cmd.Parameters.AddWithValue("@Dolor_Muscular", SqlDbType.VarChar)
                If muscularNO.Checked Then
                    cmd.Parameters("@Dolor_Muscular").Value = muscularNO.Value
                Else
                    cmd.Parameters("@Dolor_Muscular").Value = muscularSI.Value
                End If

                cmd.Parameters.AddWithValue("@Perdida_De_Olfato", SqlDbType.VarChar)
                If olfatoNO.Checked Then
                    cmd.Parameters("@Perdida_De_Olfato").Value = olfatoNO.Value
                Else
                    cmd.Parameters("@Perdida_De_Olfato").Value = olfatoSI.Value
                End If

                cmd.Parameters.AddWithValue("@Perdida_De_Gusto", SqlDbType.VarChar)
                If gustoNO.Checked Then
                    cmd.Parameters("@Perdida_De_Gusto").Value = gustoNO.Value
                Else
                    cmd.Parameters("@Perdida_De_Gusto").Value = gustoSI.Value
                End If

                cmd.Parameters.AddWithValue("@Tos", SqlDbType.VarChar)
                If tosNO.Checked Then
                    cmd.Parameters("@Tos").Value = tosNO.Value
                Else
                    cmd.Parameters("@Tos").Value = tosSI.Value
                End If

                cmd.Parameters.AddWithValue("@Contacto_Estrecho", SqlDbType.Bit)
                cmd.Parameters("@Contacto_Estrecho").Value = ContactoEstrecho.Checked

                cmd.Parameters.AddWithValue("@Contacto_Cercano", SqlDbType.Bit)
                cmd.Parameters("@Contacto_Cercano").Value = ContactoCercano.Checked

                cmd.Parameters.AddWithValue("@Cancer", SqlDbType.Bit)
                cmd.Parameters("@Cancer").Value = Cancer.Checked

                cmd.Parameters.AddWithValue("@Diabetes", SqlDbType.Bit)
                cmd.Parameters("@Diabetes").Value = Diabetes.Checked

                cmd.Parameters.AddWithValue("@Enfermedad_Hepatica", SqlDbType.Bit)
                cmd.Parameters("@Enfermedad_Hepatica").Value = Hepatica.Checked

                cmd.Parameters.AddWithValue("@Enfermedad_Renal", SqlDbType.Bit)
                cmd.Parameters("@Enfermedad_Renal").Value = Renal.Checked

                cmd.Parameters.AddWithValue("@Enfermedad_Respiratoria", SqlDbType.Bit)
                cmd.Parameters("@Enfermedad_Respiratoria").Value = EnfermedadRespiratoria.Checked

                cmd.Parameters.AddWithValue("@Enfermedad_Cardiologica", SqlDbType.Bit)
                cmd.Parameters("@Enfermedad_Cardiologica").Value = Cardiologica.Checked

                da.SelectCommand = cmd
                da.Fill(dsResult)

                If dsResult.Tables(0).Rows(0).Item(0) = "OK" Then
                    Response.Redirect("Home.aspx")
                Else
                    lblMensaje.Text = dsResult.Tables(0).Rows(0).Item(1)
                End If

            End Using

        Catch ex As Exception
            lblMensaje.Text = Err.Description
        End Try

    End Sub

End Class