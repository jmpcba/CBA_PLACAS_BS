<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="pedidosCliente.aspx.vb" Inherits="CBA_PLACAS_BS.pedidosCliente" Theme="default" %>

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
        <h1 class="text-center">Ventas Por Cliente<br /><small>
        Seleccione un rango de fechas</small></h1>
    </div>
    <div class="row table-responsive  form-group">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" ProcessingMode="Remote" BackColor="#99CCFF" CssClass="reportViewer" Font-Names="Verdana" Font-Size="8pt" Height="100%" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" ShowDocumentMapButton="False" ShowFindControls="False" ShowPageNavigationControls="False" ShowZoomControl="False">
        <ServerReport ReportPath="/reportesCBA_Placas/pedidosCliente" ReportServerUrl="http://localhost/reportserver_SSRS" />
    </rsweb:ReportViewer>
    </div>
</asp:Content>
