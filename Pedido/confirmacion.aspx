<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="confirmacion.aspx.vb" Inherits="CBA_PLACAS_BS.confirmacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Pedido Enviado!!!</h1>
        <p>Numero de pedido: <asp:Label ID="lblPedido" runat="server" Text="Label"></asp:Label></p>
        <p><a class="btn btn-primary btn-lg" href="nuevoPedido.aspx" role="button">Nuevo Pedido</a></p>
</div>
</asp:Content>
