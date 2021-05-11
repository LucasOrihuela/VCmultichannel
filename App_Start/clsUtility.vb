Imports System.IO
Imports System.Data
Public Class clsUtility

    Public Shared Sub CargarCombo(ByVal Combo As DropDownList, ByVal sQuery As String, ByVal Campo1 As String, ByVal Campo2 As String, ByVal Valor As String)
        Dim stStatus As String = ""
        Dim i As Integer

        Try
            Dim ds As New DataSet

            Dim objDB As New clsDB()
            ds = objDB.ExecuteQuery(sQuery, stStatus)
            Combo.Items.Clear()

            For i = 0 To ds.Tables(0).Rows.Count - 1
                Dim wcItem As New ListItem
                If CStr(ds.Tables(0).Rows(i).Item(Campo1)) = Valor Then
                    wcItem.Selected = True
                End If
                wcItem.Text = "" & ds.Tables(0).Rows(i).Item(Campo2)
                wcItem.Value = "" & ds.Tables(0).Rows(i).Item(Campo1)
                Combo.Items.Add(wcItem)
            Next

        Catch ex As Exception

        End Try
    End Sub

    Public Shared Sub CargarComboQuery(ByVal Procedure As String, ByVal param As Dictionary(Of String, String), ByVal Combo As DropDownList, ByVal Campo1 As String, ByVal Campo2 As String, ByVal Valor As String)
        Dim stStatus As String = ""
        Dim i As Integer

        Try
            Dim ds As New DataSet

            Dim objDB As New clsDB()

            ds = objDB.ExecuteSP(Procedure, param)
            Combo.Items.Clear()
            Combo.Items.Add(New ListItem("", "0"))
            For i = 0 To ds.Tables(0).Rows.Count - 1
                Dim wcItem As New ListItem
                If CStr(ds.Tables(0).Rows(i).Item(Campo1)) = Valor Then
                    wcItem.Selected = True
                End If
                wcItem.Text = "" & ds.Tables(0).Rows(i).Item(Campo2)
                wcItem.Value = "" & ds.Tables(0).Rows(i).Item(Campo1)
                Combo.Items.Add(wcItem)
            Next
        Catch ex As Exception

        End Try
    End Sub

    Public Shared Function htmlEscapeUndo(ByRef strText As String)

        Return strText.Replace("&amp;", "&").Replace("&quot;", """").Replace("&#39;", "'").Replace("&lt;", "<").Replace("&gt;", ">")

    End Function

    Public Shared Function setCssClass(ByVal item As String) As String
        Select Case item.ToLower
            Case "iniciado"
                Return "label label-info"
            Case "sin resolver"
                Return "label label-danger"
            Case "resuelto"
                Return "label label-success"
            Case Else
                Return "label label-default"
        End Select
    End Function

    Public Shared Function rColor(ByRef list As List(Of String))
        While (True)
            Dim random = New Random()
            Dim color = [String].Format("#{0:X6}", random.[Next](&H1000000))
            If Not list.Contains(color) Then
                Return color
            End If
        End While
    End Function

    Public Shared Function openTextFile(ByVal File As String)
        Try
            Dim path = HttpContext.Current.Server.MapPath("~")
            Using sr As New StreamReader(path + "\templates\graficos\" + File)
                Dim line As String
                line = sr.ReadToEnd()
                Return line
            End Using
        Catch e As Exception
            Return ""
        End Try
    End Function

End Class
