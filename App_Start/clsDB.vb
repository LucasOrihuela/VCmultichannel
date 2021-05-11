Imports System.Data.SqlClient
Imports System.Data

Public Class clsDB

  

    Private ConnString As String
    Private SqlConn As SqlConnection

    Public Sub New()
        Me.ConnString = ConfigurationManager.ConnectionStrings("CSDBMDA").ConnectionString.ToString()        
    End Sub

    Public Function ExecuteSP(ByVal strSP As String, Optional ByVal paramList As Dictionary(Of String, String) = Nothing, Optional ByRef strRes As String = "", Optional ByVal user As clsUser = Nothing) As DataSet
        Dim ds As New DataSet
        Dim da As New SqlDataAdapter
        Try
            Me.SqlConn = New SqlConnection(Me.ConnString)
            Using Me.SqlConn
                ds = New DataSet()
                da = New SqlDataAdapter()

                Dim cmd As New SqlCommand(strSP)
                cmd.Connection = Me.SqlConn
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                If Not paramList Is Nothing Then
                    For Each item In paramList
                        cmd.Parameters.AddWithValue("@" + item.Key, item.Value)
                    Next
                End If
                If Not user Is Nothing Then
                    cmd.Parameters.AddWithValue("@User", user.email)
                End If

                da.Fill(ds)
                Me.SqlConn.Close()

            End Using

            Dim tableNumber As Integer
            If ds.Tables.Count = 0 Then
                tableNumber = 0
                'strRes = "OK"
            Else
                tableNumber = ds.Tables.Count - 1
                'strRes = "OK"
            End If
            If (ds.Tables(tableNumber).Rows.Count > 0) AndAlso (IsNumeric(ds.Tables(tableNumber).Rows(0).Item(0)) OrElse ds.Tables(tableNumber).Rows(0).Item(0).ToString <> "ERROR") Then
                strRes = "OK"
                Return ds
            Else
                Dim nds As New DataSet()
                nds.Tables.Add(New DataTable())
                strRes = "ERROR"
                Return nds
            End If
        Catch ex As Exception
            clsLOG.generateError("clsDB - ExecuteSP - Exception: " + ex.Message)

            strRes = "ERROR"
        End Try
    End Function

    Public Function Execute_QUERY(ByVal stConn As String, ByVal strSP As String, Optional ByVal paramList As Dictionary(Of String, String) = Nothing, Optional ByVal user As clsUser = Nothing, Optional ByRef strRes As String = "") As DataSet
        Dim ds As New DataSet
        Dim da As New SqlDataAdapter
        Try
          
            Me.SqlConn = New SqlConnection(stConn)
            Using Me.SqlConn
                ds = New DataSet()
                da = New SqlDataAdapter()

                Dim cmd As New SqlCommand(strSP)
                cmd.Connection = Me.SqlConn
                cmd.CommandType = CommandType.text
                da.SelectCommand = cmd
                If Not paramList Is Nothing Then
                    For Each item In paramList
                        cmd.Parameters.AddWithValue("@" + item.Key, item.Value)
                    Next
                End If
                If Not user Is Nothing Then
                    cmd.Parameters.AddWithValue("@User", user.email)
                End If
                da.Fill(ds)
                Me.SqlConn.Close()

            End Using

            Dim tableNumber As Integer
            If ds.Tables.Count = 0 Then
                tableNumber = 0
                'strRes = "OK"
            Else
                tableNumber = ds.Tables.Count - 1
                'strRes = "OK"
            End If

              
                strRes = "OK"
                Return ds
            
        Catch ex As Exception
            clsLOG.generateError("clsDB - QUERY - Exception: " + ex.Message)
            strRes = "ERROR"
        End Try
    End Function

    Public Function convertConnection(ByVal connString As String) As String
        Dim aux2 As String()
        Dim aux As String()
        Dim secciones As ArrayList = New ArrayList()
        aux = connString.Split(New Char() {";"c})
        For Each seccion In aux
            aux2 = seccion.Split(New Char() {"="c})
            secciones.Add(aux2(1))
        Next
        Return "Data Source=" + secciones(1) + ";Initial Catalog=" + secciones(2) + ";Persist Security Info=True;User ID=" + secciones(3) + ";Password=" + secciones(4) + ";Language=Spanish;"
    End Function

    Public Function ExecuteQuery(ByVal strQuery As String, ByRef strResult As String) As DataSet

        Dim ds As Data.DataSet
        Dim da As SqlDataAdapter
        Try
            Me.SqlConn = New SqlConnection(Me.ConnString)
            Using Me.SqlConn
                ds = New DataSet
                da = New SqlDataAdapter

                Dim cmd As New SqlCommand(strQuery)
                cmd.Connection = Me.SqlConn
                cmd.CommandType = CommandType.Text
                da.SelectCommand = cmd


                da.Fill(ds)

                strResult = "OK"

                da.Dispose()
                cmd.Dispose()
                Me.SqlConn.Close()
                Me.SqlConn.Dispose()
            End Using

        Catch ex As Exception
            strResult = ex.Message
        End Try

        Return ds
    End Function


    Public Function isValidDS(ByRef ds As DataSet) As Boolean
        If (Not ds Is Nothing) AndAlso (ds.Tables.Count > 0) AndAlso (ds.Tables(0).Rows.Count > 0) Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Shared Function checkDBNullorNothing(ByRef obj As Object, Optional ByVal defaultValue As Object = Nothing) As Object
        If (obj Is Nothing) Or (obj Is DBNull.Value) Then
            If Not defaultValue Is Nothing Then
                Return defaultValue
            Else
                Return ""
            End If
        Else
            Return obj
        End If
    End Function
End Class
