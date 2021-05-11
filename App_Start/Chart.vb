Imports System.Collections.Generic
Imports System.Drawing
Imports System.Runtime.CompilerServices



    Public Class Chart
        Public Property labels As List(Of String)
        Public Property datasets As List(Of datset)
    End Class

    Public Class datset
        Public Property label As String
        Public Property backgroundColor As List(Of String)
        Public Property borderColor As List(Of String)
        Public Property borderWidth As Integer
        Public Property data As List(Of Integer)
    End Class

