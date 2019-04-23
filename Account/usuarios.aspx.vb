Imports System
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Owin
Public Class usuarios
    Inherits System.Web.UI.Page

    Dim sb As StatusBar

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sb = New StatusBar(HFMsg, lblMessage)
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim DB As New DB(ConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString)
        Dim userName As String = txtUsr.Text.Trim.ToLower
        Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
        Dim signInManager = Context.GetOwinContext().Get(Of ApplicationSignInManager)()
        Dim user = New ApplicationUser() With {.UserName = userName, .Email = userName}
        Dim result = manager.Create(user, txtPass.Text)
        If result.Succeeded Then

            Dim sql = String.Format("INSERT INTO AspNetUserRoles VALUES('{0}', '{1}')", user.Id, DPNvoRol.SelectedValue)
            Try
                DB.ejecutarNonQuery(sql)
                sb.write("Nuevo usuario registrado")
                grUsuarios.DataBind()
            Catch ex As Exception
                sb.writeError(ex.Message)
            End Try
        Else
            sb.writeError(result.Errors.FirstOrDefault())
        End If
    End Sub

    Protected Sub grUsuarios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grUsuarios.SelectedIndexChanged
        Dim idUsuario As String
        idUsuario = grUsuarios.SelectedDataKey.Value
        Response.Redirect("usuarioDetalle?idUsuario=" & idUsuario)
    End Sub
End Class