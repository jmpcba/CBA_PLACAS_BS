<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="recepcionQR.aspx.vb" Inherits="CBA_PLACAS_BS.recepcionQR" theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))
        })
    </script>
    <div class="row">
        <div id="msg" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HFMsg" runat="server" />
        </div>
    </div>
    <div class="jumbotron">
        <p>El pedido <asp:Label ID="lblPedido" runat="server" Text="Label"></asp:Label> fue recibido por el cliente?</p>
        <p><asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" CssClass="btn-block" /></p>
    </div>
</asp:Content>
