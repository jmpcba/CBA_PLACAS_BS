Imports System.Net.Mail
Imports System.Net
Imports System.IO

Public Class mailV2
    Dim pedido As Pedido
    Dim client As SmtpClient = New SmtpClient()
    Dim NetworkCred As NetworkCredential

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
End Class
