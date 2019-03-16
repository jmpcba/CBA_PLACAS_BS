﻿Public Class panelPedidos
    Inherits System.Web.UI.Page
    Dim gd As New GestorDatos
    Dim sb As StatusBar


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sb = New StatusBar(HFMsg, lblMessage)
        llenarGrillas()
    End Sub

    Private Enum redireccion
        produccion
        modificar
    End Enum

    Private Sub llenarGrillas()
        Try
            Dim dt As New DataTable
            dt = gd.getPedidos()
            Dim dvNuevos As New DataView
            dvNuevos = dt.DefaultView

            dvNuevos.RowFilter = "ID_ESTADO=0"
            grNuevos.DataSource = dvNuevos
            grNuevos.DataBind()

            dvNuevos.RowFilter = "ID_ESTADO IN (1,2)"
            grEnCurso.DataSource = dvNuevos
            grEnCurso.DataBind()

            dvNuevos.RowFilter = "ID_ESTADO >=3"
            grDeposito.DataSource = dvNuevos
            grDeposito.DataBind()

            lblNuevos.Text = grNuevos.Rows.Count
            lblEnCurso.Text = grEnCurso.Rows.Count
            lblDeposito.Text = grDeposito.Rows.Count

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Private Sub redirigir(_idPedido As Integer, _tipo As redireccion)

        If _tipo = redireccion.modificar Then

            Response.Redirect("modificarDetalle.aspx?idPedido=" & _idPedido)
        ElseIf _tipo = redireccion.produccion Then
            Response.Redirect("administrar.aspx?idPedido=" & _idPedido)
        End If

    End Sub

    Protected Sub grNuevos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grNuevos.SelectedIndexChanged
        Dim row = grNuevos.SelectedRow
        Dim idPedido = Convert.ToInt32(grNuevos.SelectedDataKey.Value)
        redirigir(idPedido, redireccion.produccion)
    End Sub

    Protected Sub grNuevos_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles grNuevos.RowEditing
        Dim idPedido As Integer
        idPedido = Convert.ToInt32(grNuevos.DataKeys(e.NewEditIndex).Value)
        redirigir(idPedido, redireccion.modificar)
    End Sub

    Protected Sub grDeposito_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles grDeposito.RowEditing
        Dim idPedido As Integer
        idPedido = Convert.ToInt32(grDeposito.DataKeys(e.NewEditIndex).Value)
        redirigir(idPedido, redireccion.modificar)
    End Sub

    Protected Sub grDeposito_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grDeposito.SelectedIndexChanged
        Dim row = grDeposito.SelectedRow
        Dim idPedido = Convert.ToInt32(grDeposito.SelectedDataKey.Value)
        redirigir(idPedido, redireccion.produccion)
    End Sub

    Protected Sub grEnCurso_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles grEnCurso.RowEditing
        Dim idPedido As Integer
        idPedido = Convert.ToInt32(grEnCurso.DataKeys(e.NewEditIndex).Value)
        redirigir(idPedido, redireccion.modificar)
    End Sub

    Protected Sub grEnCurso_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grEnCurso.SelectedIndexChanged

        Dim idPedido = Convert.ToInt32(grEnCurso.SelectedDataKey.Value)
        redirigir(idPedido, redireccion.produccion)
    End Sub
End Class