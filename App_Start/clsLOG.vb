Imports System.IO

Public Class clsLOG
    Public Enum LogType
        ERROR_TYPE
        ACTIVITY
        DEBUG
    End Enum
    Public Shared Sub generateError(ByVal stMensaje As String)
        Dim swFile As StreamWriter
        Dim stFile As String
        Dim stPathError As String = "\log\log_error.txt"

        Try
            If (stPathError.Length > 0) Then
                stFile = System.Web.HttpContext.Current.Server.MapPath(".") + stPathError
                swFile = New StreamWriter(stFile, True)
                swFile.Write(CStr(Now) & "-" & stMensaje & vbCrLf)
                swFile.Close()
            End If
        Catch

        End Try
    End Sub
End Class
