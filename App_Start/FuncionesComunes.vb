Imports Microsoft.VisualBasic
Imports System.Net
Imports System.Net.Mail
Imports System.Web
Public Class FuncionesComunes
    Implements IHttpModule

    Private WithEvents _context As HttpApplication

    ''' <summary>
    '''  Deberá configurar este módulo en el archivo web.config de su
    '''  web y registrarlo en IIS para poder usarlo. Para obtener más información
    '''  consulte el vínculo siguiente: https://go.microsoft.com/?linkid=8101007
    ''' </summary>
#Region "Miembros de IHttpModule"

    Public Sub Dispose() Implements IHttpModule.Dispose

        ' Ponga aquí el código de limpieza

    End Sub

    Public Sub Init(ByVal context As HttpApplication) Implements IHttpModule.Init
        _context = context
    End Sub

#End Region

    Public Sub OnLogRequest(ByVal source As Object, ByVal e As EventArgs) Handles _context.LogRequest

        ' Controla el evento LogRequest para proporcionar una implementación de 
        ' registro personalizado para él

    End Sub

    Shared Function enviaEmail(ByVal sfrom As String, ByVal sTo As String, ByVal sHost As String, ByVal smtpCredUser As String, ByVal smtpPass As String, ByVal sCodigo As String, ByVal sBody As String, ByVal sSubject As String, Optional ByVal strAttach As String = "") As Boolean
        'Llama relevamiento

        Dim sCuerpo As String = ""
        Dim email As New MailMessage()

        enviaEmail = True
        'sfrom = "pagos@musictalent.info"
        'sTo = "mjotero@hotmail.com,msalvia"
        'sHost = "smtp.musictalent.info"
        'smtpCredUser = "pagos@musictalent.info"
        'smtpPass = "pagomusic10"
        With email

            If Not ConfigurationManager.AppSettings("MailFrom") Is Nothing Then
          
                .From = New MailAddress("reservastenis@sarsy-srl.com", "Reserva Tenis Santa Guadalupe")
            End If


            
            .Bcc.Add(sTo)

           
            '.Bcc.Add("manuel.tablado@sarsy-srl.com")
 

            'If Not sSubject = "Contraseña" Then
            '    '.to.add("natalia.roji@vicentelopez.gov.ar")
            '    .bcc.add("mjotero@hotmail.com")
            '    .bcc.add("salvia.martin@gmail.com")
            'End If

            .Subject = sSubject
            .IsBodyHtml = True
            .Priority = MailPriority.High
            '.Body = "<img   Width='850'   src='http://www.musictalent.info/imgs/imgmail.jpg'><br>" & sBody
            .Body = "" & sBody
            'If strAttach <> "" Then .Attachments.Add(New System.Net.Mail.Attachment(strAttach))
        End With
        Dim smtp As New SmtpClient

        Dim strHost As String = "smtp.office365.com"
        Dim strPort = 587
        Dim strEmailPAssword As String = ""

        If Not ConfigurationManager.AppSettings("MailSMTP") Is Nothing Then
            strHost = ConfigurationManager.AppSettings("MailSMTP")
        End If

        If Not ConfigurationManager.AppSettings("MailSMTPPort") Is Nothing Then
            strPort = ConfigurationManager.AppSettings("MailSMTPPort")
        End If

        If Not ConfigurationManager.AppSettings("MailFromPWD") Is Nothing Then
            strEmailPAssword = ConfigurationManager.AppSettings("MailFromPWD")
        End If

        smtp.Host = strHost ' "mail.vicentelopez.gov.ar"
        smtp.Port = strPort
        smtp.EnableSsl = False

        Dim strMailUser As String
        strMailUser = email.From.Address
        If Not ConfigurationManager.AppSettings("MailUser") Is Nothing Then
            strMailUser = ConfigurationManager.AppSettings("MailUser")
        End If



        'smtp.Host = "smtp.office365.com"
        smtp.Port = strPort '587
        If Not strEmailPAssword = "" Then
            smtp.Credentials = New NetworkCredential(strMailUser, strEmailPAssword) ', "MicrosoftOffice365Domain.com")
        End If

        'smtp.UseDefaultCredentials = False
        'smtp.Timeout = 500000

        If ConfigurationManager.AppSettings("MailEnableSsl") = "Y" Then
            smtp.EnableSsl = True
        End If


        smtp.DeliveryMethod = SmtpDeliveryMethod.Network
        'smtp.TargetName = "STARTTLS/smtp.office365.com"
        'smtp.Credentials = New NetworkCredential("", "")

        Dim strMailAsync As String = "NO"
        If Not ConfigurationManager.AppSettings("MailASYNC") Is Nothing Then
            strMailAsync = ConfigurationManager.AppSettings("MailASYNC")
        End If

        Try
            If strMailAsync = "SI" Then
                ' GenerateLOG("Enviar Email ASYNC;" & email.From.Address & ";" & sBody, "")
                'AddHandler smtp.SendCompleted, AddressOf SendCompletedCallback
                Dim userState As String = "Mail1"
                smtp.SendAsync(email, userState)
                ' GenerateLOG("Enviar Email ASYNC OK;" & email.From.Address & ";" & sBody, "")
            Else
                ' GenerateLOG("Enviar Email SYNC;" & email.From.Address & ";" & sBody, "")
                smtp.Send(email)
                'GenerateLOG("Enviar Email SYNC OK;" & smtp.Port & ";" & smtp.EnableSsl & ";" & strEmailPAssword & ";" & smtp.Host & ";", "")
                'GenerateLOG("Enviar Email SYNC OK;" & email.From.Address & ";" & sBody, "")
            End If


            'GenerateLOG(email.From.Address & vbNewLine & sBody, "")
            'smtp.Send(email)
        Catch ex1 As System.Net.Mail.SmtpException
            enviaEmail = False
            sCuerpo = ex1.Message
            ' GenerateLOG("Enviar Email ERROR1;" & sCuerpo & ";" & sTo & ";" & sBody, "")
        Catch ex As Exception
            enviaEmail = False
            sCuerpo = ex.Message
            'GenerateLOG("Enviar Email ERROR2;" & sCuerpo & ";" & sTo & ";" & sBody, "")
        End Try

    End Function
End Class
