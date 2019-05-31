<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="recepcionQRRecibida.aspx.vb" Inherits="CBA_PLACAS_BS.recepcionQRRecibida" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Confirmado</h1>
        <p>Se confirmo la recepcion por parte del cliente del pedido: <asp:Label ID="lblPedido" runat="server" Text="Label"></asp:Label></p>
        <p><a class="btn btn-primary btn-lg" href="../default.aspx" role="button">Volver a Inicio</a></p>
    </div>
</asp:Content>
