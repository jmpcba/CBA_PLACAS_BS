<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="productos.aspx.vb" Inherits="CBA_PLACAS_BS.productos1" %>

<%@ Register Src="~/producto/panelLinea.ascx" TagPrefix="pl" TagName="panelLinea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h1 class="text-center">PRODUCTOS<br /><small>
        Lista de Precios</small></h1>
    </div>
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        <asp:Panel ID="pnlAcordeon" runat="server">
        </asp:Panel>
    </div>
</asp:Content>
