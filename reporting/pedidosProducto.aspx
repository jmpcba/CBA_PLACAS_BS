﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="pedidosProducto.aspx.vb" Inherits="CBA_PLACAS_BS.pedidosProducto" Theme="default" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(":submit").addClass("btn")
            $(":submit").addClass("btn-primary")
            $(":submit").removeAttr("style");
            $(":text").addClass("form-control")
            $(":text").removeClass("null")
            $(":text").removeAttr("style");
            $("select").addClass("form-control")
        })

        var prm = Sys.WebForms.PageRequestManager.getInstance()

        prm.add_endRequest(function () {
            $(":submit").addClass("btn")
            $(":submit").addClass("btn-primary")
            $(":submit").removeAttr("style");
            $(":text").addClass("form-control")
            $(":text").removeClass("null")
            $(":text").removeAttr("style")
            $("#contenedor").addClass("form-group")
            $("select").addClass("form-control")
        })

    </script>
    <div class="page-header">
        <h1 class="text-center">Ventas Por Producto<br /><small>
        Seleccione un rango de fechas</small></h1>
    </div>
    <div id="contenedor" class="row table-responsive  form-group">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="#99CCFF" CssClass="reportViewer" ProcessingMode="Remote" Height="100%" ShowFindControls="False" ShowPageNavigationControls="False" ShowZoomControl="False" Width="100%">
            <ServerReport ReportPath="/reportesCBA_Placas/VENTAS_POR_PRODUCTO" ReportServerUrl="http://localhost/reportserver_SSRS" />
        </rsweb:ReportViewer>
    </div>
</asp:Content>