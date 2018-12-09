Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.Threading

Public Class impresion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim rptType As GestorDatos.reportes
        Dim rpt = Request.QueryString("rpt")
        Dim idPedido = Request.QueryString("idPedido")
        Dim idsItems As String()

        If rpt = "etiquetaSimple" Then
            idsItems = idPedido.Split("-")
        End If

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
        ElseIf rpt = "etiquetaSimple" Then
            rptType = GestorDatos.reportes.etiquetaDepositoUnica
        End If

        If rptType = GestorDatos.reportes.etiquetaDepositoUnica Then
            crystalReport(idsItems)
        Else
            crystalReport(rptType, idPedido)
        End If

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

    Private Sub crystalReport(idsItems As String())
        Dim rptPath As String
        Dim dt = New DataTable()
        Dim rd = New ReportDocument()
        Dim gd = New GestorDatos
        Dim exFormat As ExportFormatType

        exFormat = ExportFormatType.PortableDocFormat
        rptPath = "etiquetas.rpt"

        Try
            dt = gd.getReporte(idsItems)
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