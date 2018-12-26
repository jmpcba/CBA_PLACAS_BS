<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="modificar.aspx.vb" Inherits="CBA_PLACAS_BS.modificar"  Theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="../scripts/funcionesComunes.js">
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))
        })
    </script>
    <div class="page-header">
        <h1 class="text-center">Modificar Pedidos <br /><small>
        <asp:Label ID="lblSubtitulo" runat="server" Text=""></asp:Label></small></h1>
    </div>
    <div class="row">
        <div id="msg" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HFMsg" runat="server" Value="success" />
        </div>
    </div>
    <asp:Panel ID="pnlPedidos" runat="server">
        <div class="table-responsive">
            <asp:GridView ID="grPedidos" 
            runat="server" 
            AutoGenerateColumns="False" 
            ToolTip="Pedidos en Curso" 
            DataKeyNames="Nro Pedido">
            <Columns>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                <ControlStyle Height="20px" Width="20px" />
                </asp:CommandField>
                <asp:BoundField DataField="Nro Pedido" HeaderText="Nro Pedido" ReadOnly="True" SortExpression="Nro Pedido" />
                <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                <asp:BoundField DataField="Fecha Recibido" HeaderText="Fecha Recibido" SortExpression="Fecha Recibido" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Ultima Modificacion" HeaderText="Ultima Modificacion" SortExpression="Ultima Modificacion" DataFormatString="{0:d}" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton6" runat="server" CommandName="delete" ImageUrl="~/images/delete.png" CssClass="imageButtons" />
                    </ItemTemplate>
                    <ControlStyle Height="20px" Width="20px" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT [Nro Pedido], Cliente, Cantidad, Estado, [Fecha Recibido], [Ultima Modificacion] FROM VW_PEDIDOS_MODIFICAR ORDER BY 'FECHA RECIBIDO'"></asp:SqlDataSource>
        </div>
    </asp:Panel>
</asp:Content>
