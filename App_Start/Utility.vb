Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Runtime.CompilerServices


    Public Class Utility
        Public Shared rnd As Random = New Random()

        Public Shared Function ColorRandom() As String
            Return "rgba(" & NumeroRandom() & "," & NumeroRandom() & "," & NumeroRandom() & ",1)"
        End Function

        Public Shared Function NumeroRandom() As String
            Return rnd.[Next](1, 255).ToString()
        End Function
    End Class

