<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="tiempoEntrega.aspx.vb" Inherits="CBA_PLACAS_BS.tiempoEntrega" %>
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
        })

        prm.add_endRequest(function () {
            $(":submit").addClass("btn")
            $(":submit").addClass("btn-primary")
            $(":submit").removeAttr("style");
            $(":text").addClass("form-control")
            $(":text").removeClass("null")
            $(":text").removeAttr("style");
        })

    </script>
    <div class="page-header">
        <h1 class="text-center">Ventas Por Producto<br /><small>
        Seleccione un rango de fechas</small></h1>
    </div>
    <div class="row table-responsive  form-group">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="#99CCFF" CssClass="reportViewer" ProcessingMode="Remote" Height="100%" ShowFindControls="False" ShowPageNavigationControls="False" ShowZoomControl="False" Width="100%">
            <ServerReport ReportPath="/reportesCBA_Placas/TIEMPO_ENTREGA_PRODUCTOS" ReportServerUrl="http://localhost/reportserver_SSRS" />
        </rsweb:ReportViewer>
    </div>
</asp:Content>
