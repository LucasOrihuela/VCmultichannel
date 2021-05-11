Imports RE_Escritorio.clsUtility
Imports System.Data


Public Class clsReporte
    Public Structure graficoBarras
        Dim Columnas As String
        Dim Data As String
        Dim Color As String
        Dim Labels As String
    End Structure
    Public Structure graficoTorta
        Dim Columnas As String
        Dim Data As String
        Dim Color As String
        Dim Labels As String
    End Structure
    Public Shared Sub reemplazo(ByRef script As Literal, ByRef html As Literal, ByVal _pie As clsReporte.graficoTorta, ByVal _chart As clsReporte.graficoBarras, ByVal Title As String, ByVal I As Integer, ByVal Type As String, ByVal DatosTorta As String, ByVal Datos As String, ByVal Url As String, Optional ByVal Remove As Boolean = False, Optional ByVal user As clsUser = Nothing)
        Try
            Select Case Type
                Case "TORTA"
                    'Edicion de HTML
                    html.Text = openTextFile("torta.txt")
                    html.Text = html.Text.Replace("#GRAPH_00", I)
                    html.Text = html.Text.Replace("TITLE" & I, Title)
                    html.Text = html.Text.Replace("TYPE" & I, "pieChart" & I)
                    'Edicion de JS
                    script.Text = openTextFile("tortaJS.txt")
                    script.Text = script.Text.Replace("#GRAPH_00", I)
                    script.Text = script.Text.Replace("@ModuloString" & I, _pie.Labels)
                    script.Text = script.Text.Replace("@ModuloColorString" & I, _pie.Color)
                    script.Text = script.Text.Replace("@ModuloDataString" & I, _pie.Data)
                    script.Text = script.Text.Replace("@ModuloColumnasString" & I, _pie.Columnas)
                    script.Text = script.Text.Replace("xx" & I, DatosTorta)
                    script.Text = script.Text.Replace("zz" & I, I)
                    script.Text = script.Text.Replace("LINK" & I, Url)
                    If Remove Then
                        script.Text = script.Text.Replace("//" & I, "")
                    End If
                Case "BARRAS"
                    'Edicion de HTML
                    html.Text = openTextFile("barras.txt")
                    html.Text = html.Text.Replace("#GRAPH_00", I)
                    html.Text = html.Text.Replace("TITLE" & I, Title)
                    html.Text = html.Text.Replace("TYPE" & I, "barChart" & I)
                    'Edicion de JS
                    script.Text = openTextFile("barrasJS.txt")
                    script.Text = script.Text.Replace("#GRAPH_00", I)
                    script.Text = script.Text.Replace("@ColorString" & I, _chart.Color)
                    script.Text = script.Text.Replace("@DataString" & I, _chart.Data)
                    script.Text = script.Text.Replace("@LabelsString" & I, _chart.Labels)
                    script.Text = script.Text.Replace("@ColumnasString" & I, _chart.Columnas)
                    script.Text = script.Text.Replace("xx" & I, Datos)
                    script.Text = script.Text.Replace("zz" & I, I)
                    script.Text = script.Text.Replace("LINK" & I, Url)
                    If Remove Then
                        script.Text = script.Text.Replace("//" & I, "")
                    End If
                Case "MAPA"
                    'Edicion de HTML
                    html.Text = openTextFile("mapa.txt")
                    html.Text = html.Text.Replace("#GRAPH_00", I)
                    html.Text = html.Text.Replace("TITLE" & I, Title)
                    html.Text = html.Text.Replace("TYPE" & I, "map" & I)
                    'Edicion de JS
                    script.Text = openTextFile("mapaJS.txt")
                    script.Text = script.Text.Replace("#GRAPH_00", I)
                    script.Text = script.Text.Replace("TYPE" & I, "map" & I)
                    Dim json As String = getCoordinates(user)
                    script.Text = script.Text.Replace("zz" & I, json.Replace(Chr(34), "&quot;"))
                    script.Text = script.Text.Replace("LINK" & I, Url)
                    If Remove Then
                        script.Text = script.Text.Replace("//" & I, "")
                    End If
            End Select
        Catch ex As Exception
            clsLOG.generateError("clsReporte.reemplazo ex: " + ex.Message)
        End Try
    End Sub
    Public Shared Sub loadChart(ByRef ds As DataSet, ByRef _chart As graficoBarras, ByRef _pie As graficoTorta, ByRef hfDatos As HiddenField)
        Try
            Dim Columna As List(Of String) = New List(Of String)
            Dim Label As List(Of String) = New List(Of String)
            Dim Data As List(Of String) = New List(Of String)
            Dim Color As List(Of String) = New List(Of String)
            For i = 0 To ds.Tables(0).Rows.Count - 1
                Color.Add(rColor(Color))
                Columna.Add("'" + ds.Tables(0).Rows(i).Item(0).ToString + "'")
                Data.Add(ds.Tables(0).Rows(i).Item(1))
            Next
            If Label.Count = 0 Then
                _chart.Labels = ""
            Else
                _chart.Labels = String.Join(",", Label.ToArray())
            End If
            _chart.Columnas = String.Join(",", Columna.ToArray())
            _chart.Data = String.Join("|", Data.ToArray())
            _chart.Color = String.Join("|", Color.ToArray())
            hfDatos.Value = ds.Tables.Count()
        Catch ex As Exception
            clsLOG.generateError("clsReporte.loadChart ex: " + ex.Message)
        End Try
    End Sub
    Public Shared Sub loadPie(ByRef ds As DataSet, ByRef _chart As graficoBarras, ByRef _pie As graficoTorta, ByRef hfDatosTorta As HiddenField)
        Try
            Dim ModuloData As List(Of String) = New List(Of String)
            Dim ModuloColor As List(Of String) = New List(Of String)
            Dim ModuloColumna As List(Of String) = New List(Of String)
            Dim Modulo As List(Of String) = New List(Of String)
            For i = 0 To ds.Tables(0).Rows.Count - 1
                ModuloColor.Add(rColor(ModuloColor))
                Modulo.Add(ds.Tables(0).Rows(i).Item(0))
                ModuloColumna.Add("'" + ds.Tables(0).Rows(i).Item(0).ToString + "'")
                ModuloData.Add(ds.Tables(0).Rows(i).Item(1))
            Next
            _pie.Labels = String.Join(",", Modulo.ToArray())
            _pie.Data = String.Join("|", ModuloData.ToArray())
            _pie.Color = String.Join("|", ModuloColor.ToArray())
            _pie.Columnas = String.Join(",", ModuloColumna.ToArray)
            hfDatosTorta.Value = ds.Tables.Count()
        Catch ex As Exception
            clsLOG.generateError("clsReporte.loadPie ex: " + ex.Message)
        End Try
    End Sub
    Public Class clsMapaParent
        Public map() As clsMapaChild
    End Class
    Public Class clsMapaChild
        Public HTML As String
        Public latitude As String
        Public longitude As String
    End Class
    Public Shared Function getCoordinates(ByVal user As clsUser)
        Try
            Dim objDB As New clsDB()
            Dim ds = objDB.ExecuteSP("[SP_MDA_RPT_Coordenadas_Obtener]", user:=user)
            If ds.Tables(0).Rows.Count > 0 Then
                Dim parent As New clsMapaParent
                For i = 0 To ds.Tables(0).Rows.Count - 1
                    Dim child As New clsMapaChild
                    child.HTML = ds.Tables(0).Rows(i).Item("HTML")
                    child.latitude = ds.Tables(0).Rows(i).Item("latitud")
                    child.longitude = ds.Tables(0).Rows(i).Item("longitud")
                    ReDim Preserve parent.map(i)
                    parent.map(i) = child
                Next
                Dim output As String = Newtonsoft.Json.JsonConvert.SerializeObject(parent)
                Return output
            End If
        Catch ex As Exception
            clsLOG.generateError("clsReporte.getCoordinates ex: " + ex.Message)
        End Try
    End Function
End Class
