Imports System.Net.Mail
Imports System.Net
Imports System.IO
Imports HttpServerUtility

Public Class mail
    Dim client As SmtpClient = New SmtpClient()
    Dim NetworkCred As NetworkCredential = New System.Net.NetworkCredential()
    Dim pedido As Pedido

    Public Sub New(_p As Pedido)
        client.EnableSsl = True
        client.Host = "smtp.gmail.com"
        client.Port = 587
        NetworkCred.UserName = "jmpcba@gmail.com"
        NetworkCred.Password = "Newuser1!"
        client.UseDefaultCredentials = True
        client.Credentials = NetworkCred
        pedido = _p
    End Sub

    Public Sub send(_body As String)

        Try

            Dim mail As String = File.ReadAllText(HttpContext.Current.Server.MapPath("../Resources/mailPedidoNuevo.txt"))
            Dim mm As MailMessage = New MailMessage()
            Dim logo As Attachment
            Dim puerta As Attachment
            mail = mail.Replace("[MENSAJE]", _body)

            mm.From = New MailAddress(NetworkCred.UserName)
            mm.Subject = "MG PLACAS - PEDIDO: " & pedido.id
            mm.IsBodyHtml = True
            mm.Body = mail
            mm.To.Add(New MailAddress(pedido.cliente.mail))
            puerta = New Attachment(HttpContext.Current.Server.MapPath("../images/puerta_mail.png"))
            puerta.ContentId = "puerta.png"

            logo = New Attachment(HttpContext.Current.Server.MapPath("../images/logo_mail.png"))
            logo.ContentId = "logo.png"

            mm.Attachments.Add(logo)
            mm.Attachments.Add(puerta)
            client.Send(mm)

            Catch ex As Exception
                Throw New Exception("Error enviando mail: " & ex.Message)
            End Try
    End Sub

End Class
