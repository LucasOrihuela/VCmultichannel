Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Data
Imports System.ComponentModel

' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
<System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class Search
    Inherits System.Web.Services.WebService

    <WebMethod(EnableSession:=True)> _
    Public Function buscar(data As String) As List(Of searchResponse)
        Try
            Dim _usr As clsUser = HttpContext.Current.Session("user")
            If Not _usr Is Nothing Then
                Dim constr As String = ConfigurationManager.ConnectionStrings("CSDBMDA").ConnectionString
                Dim results As New List(Of searchResponse)()
                Dim da As SqlDataAdapter
                Using con As New SqlConnection(constr)
                    Using cmd As New SqlCommand("SP_WBO_Menu_Obtener")
                        da = New SqlDataAdapter()
                        cmd.CommandType = CommandType.StoredProcedure
                        da.SelectCommand = cmd
                        cmd.Parameters.AddWithValue("@OP", "search")
                        cmd.Parameters.AddWithValue("@Profile", _usr.profile)
                        cmd.Parameters.AddWithValue("@Search", data)
                        cmd.Connection = con
                        con.Open()
                        Using sdr As SqlDataReader = cmd.ExecuteReader()
                            While sdr.Read()
                                results.Add(New searchResponse() With { _
                                 .Menu = clsDB.checkDBNullorNothing(sdr("Menu")).ToString(), _
                                 .Name = clsDB.checkDBNullorNothing(sdr("NAME")).ToString(), _
                                 .Page = clsDB.checkDBNullorNothing(sdr("Page")).ToString() _
                                })
                            End While
                        End Using
                        con.Close()
                        Return results
                    End Using
                End Using
            End If
        Catch ex As Exception
            clsLOG.generateError("Search ex: " + ex.Message)
        End Try
    End Function

End Class