﻿Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.Threading

Public Class impresion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim rptType As GestorDatos.reportes
        Dim rpt = Request.QueryString("rpt")

        If rpt = "etiquetaSimple" Then
            Dim ids As New List(Of String)
            Dim i As Integer = 0

            For Each k In Request.QueryString.Keys
                If i = 0 Then
                    Continue For
                Else
                    ids.Add(k)
                End If
            Next
        End If

        Dim idPedido = Request.QueryString("idPedido")

        If rpt = "orden" Then
            rptType = GestorDatos.reportes.ordenTrabajo
        ElseIf rpt = "compra" Then
            rptType = GestorDatos.reportes.compras
        ElseIf rpt = "almc" Then
            rptType = GestorDatos.reportes.etiquetaDeposito
        ElseIf rpt = "stock" Then
            rptType = GestorDatos.reportes.etiquetaDepositoStock
        ElseIf rpt = "remito" Then
            rptType = GestorDatos.reportes.remito
        End If

        crystalReport(rptType, idPedido)
    End Sub

    Private Sub crystalReport(_rpt As GestorDatos.reportes, _idPedido As Integer)
        Dim rptPath As String
        Dim dt = New DataTable()
        Dim rd = New ReportDocument()
        Dim gp = New GestorPedidos(_idPedido)
        Dim gd = New GestorDatos
        Dim exFormat As ExportFormatType
        Dim ped = New Pedido(_idPedido)

        exFormat = ExportFormatType.PortableDocFormat

        If _rpt = GestorDatos.reportes.etiquetaDeposito Or _rpt = GestorDatos.reportes.etiquetaDepositoUnica Or
            _rpt = GestorDatos.reportes.etiquetaDepositoStock Then

            rptPath = "etiquetas.rpt"
        ElseIf _rpt = GestorDatos.reportes.ordenTrabajo Then
            rptPath = "OrdenDeTrabajo.rpt"
        ElseIf _rpt = GestorDatos.reportes.remito Then
            rptPath = "remito_filtrado.rpt"
        ElseIf _rpt = GestorDatos.reportes.etiquetaDepositoInterna Then
            rptPath = "etiquetasInternas.rpt"
        ElseIf _rpt = GestorDatos.reportes.compras Then
            rptPath = "compras.rpt"
        End If

        Try
            If _rpt = GestorDatos.reportes.compras Then
                Dim rowsToDelete = New List(Of DataRow)
                gp = Session("gp")

                dt = gp.pedido.despiece

                For Each r As DataRow In dt.Rows
                    If IsDBNull(r("FALTANTE")) Then
                        rowsToDelete.Add(r)
                    End If
                Next

                For Each r In rowsToDelete
                    dt.Rows.Remove(r)
                Next
            Else
                dt = gd.getReporte(ped, _rpt)
            End If

            rd.Load(Server.MapPath(rptPath))
            rd.SetDataSource(dt)

            Try
                rd.ExportToHttpResponse(exFormat, Response, False, "deposito.pdf")
            Catch ex As ThreadAbortException
                Thread.ResetAbort()
            End Try
        Catch ex As Exception
            Throw
        End Try
    End Sub

End Class