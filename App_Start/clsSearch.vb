Public Class searchResponse
    Private _Menu As String
    Property Menu As String
        Get
            Return _Menu
        End Get
        Set(value As String)
            _Menu = value
        End Set
    End Property
    Private _Name As String
    Property Name As String
        Get
            Return _Name
        End Get
        Set(value As String)
            _Name = value
        End Set
    End Property
    Private _Page As String
    Property Page As String
        Get
            Return _Page
        End Get
        Set(value As String)
            _Page = value
        End Set
    End Property
End Class