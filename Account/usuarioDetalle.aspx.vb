Imports System
Imports System.Linq
Imports System.Web
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Owin

Public Class usuarioDetalle
    Inherits System.Web.UI.Page
    Dim sb As StatusBar

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sb = New StatusBar(HFMsg, lblMessage)

        Dim idusuario = Request.QueryString("idUsuario")
        If Not IsNothing(idusuario) Then
            ViewState("idUsuario") = idusuario
        Else
            Response.Redirect("usuarios")
        End If

        Try
            llenarGrillas()
            sb.write("Datos Usuario - Cargados")
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Private Sub llenarGrillas()
        Dim idUsuario As String = ViewState("idUsuario")
        Dim usr = New Usuario(idUsuario)
        lblId.Text = usr.id
        lblMail.Text = usr.mail
        lblRol.Text = usr.rol
        lblNombreTitulo.Text = usr.mail
        txtModMail.Text = usr.mail

    End Sub

    Protected Sub dpRoles_DataBound(sender As Object, e As EventArgs) Handles dpRoles.DataBound
        Dim idUsuario As String = ViewState("idUsuario")
        Dim usr = New Usuario(idUsuario)
        dpRoles.SelectedValue = usr.rolid
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim idUsuario As String = ViewState("idUsuario")
        Dim usr = New Usuario(idUsuario)

        If usr.mail <> txtModMail.Text.Trim.ToLower() Then
            usr.mail = txtModMail.Text.Trim.ToLower()
        End If

        If usr.rolid <> dpRoles.SelectedValue Then
            usr.rolid = dpRoles.SelectedValue
        End If
        Try
            usr.actualizar()
            llenarGrillas()
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub


    Protected Sub btnCambiarClave_Click(sender As Object, e As EventArgs) Handles btnCambiarClave.Click
        Dim code As String = IdentityHelper.GetCodeFromRequest(Request)
        Dim idUsuario As String = ViewState("idUsuario")
        Dim usr = New Usuario(idUsuario)
        Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
        Dim user = manager.FindByName(usr.mail)

        If user Is Nothing Then
            sb.writeError("No se encontró ningún usuario")
        Else
            Dim token = manager.GeneratePasswordResetToken(user.Id)
            manager.ResetPassword(usr.id, token, txtPass.Text)
        End If
    End Sub
End Class