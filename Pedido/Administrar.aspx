<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Administrar.aspx.vb" Inherits="CBA_PLACAS_BS.Administrar" theme="default"%>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             var display = false;
             $("[id*=zoom]").click(function () {
                 if (display) {
                     $(this).attr("src", "../images/zoom_in.png");
                     $(this).closest("tr").next().remove();
                     display = false;
                 } else {
                     $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>");
                     $(this).attr("src", "../images/cancel.png");
                     display=true
                 }
                 
             });
         });   
</script>
    <div class="page-header">
        <h1 class="text-center">Pedidos En Produccion</h1>
    </div>
    <asp:Panel ID="pnlPedidos" runat="server" CssClass="row">
        <div class="row">
            <div class="col-md-3 col-md-offset-3">
                <strong>ESTADOS:</strong>
                <asp:DropDownList ID="DPFiltroEstados" runat="server" DataSourceID="DSestados" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="DSestados" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [estados]"></asp:SqlDataSource>
            </div>
            <div class="col-md-3 text-right">
                <strong>CLIENTES:</strong>
                <asp:DropDownList ID="DPFiltroClientes" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="ID"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT [ID], [NOMBRE] FROM [CLIENTES]"></asp:SqlDataSource>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-1 col-md-offset-3">
                <asp:ImageButton ID="btnRefreshNv" runat="server" ImageUrl="~/images/refresh-button-icon.png" ImageAlign="Middle" ToolTip="Refrescar" CssClass="imageButtons img-circle" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <asp:GridView ID="grPedidos" runat="server" AutoGenerateColumns="False" DataSourceID="dsNvos" ToolTip="Pedidos en estado RECIBIDO" DataKeyNames="ID" CssClass="table-condensed"><Columns>
                    <asp:BoundField DataField="ID" HeaderText="NRO" SortExpression="ID" />
                    <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" >
                    <ItemStyle CssClass="numCol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ID_ESTADO" HeaderText="ID_ESTADO" SortExpression="ID_ESTADO" >
                    <ControlStyle CssClass="hiddencol" />
                    <FooterStyle CssClass="hiddencol" />
                    <HeaderStyle CssClass="hiddencol" />
                    <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                    <asp:BoundField DataField="FECHA_RECIBIDO" HeaderText="Recibido" SortExpression="FECHA_RECIBIDO" DataFormatString="{0:d}" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                    <ControlStyle CssClass="imageButtons" />
                    </asp:CommandField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsNvos" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [VW_PEDIDOS_EN_CURSO]"></asp:SqlDataSource>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlDetalle" CssClass="row" runat="server" Visible="false">
        <div class="row">
            <h4>Detalle Pedido</h4>    
        </div>
        <div class="row">
            <hr />
            <div class="btn-group" role="group" aria-label="...">
                <asp:Button ID="btnVolver" runat="server" Text="Volver" />
                <asp:Button ID="Button2" runat="server" Text="Button" />
                <asp:Button ID="Button3" runat="server" Text="Button" />
                <asp:Button ID="Button4" runat="server" Text="Button" />
            </div>
            <hr />
        </div>
        <div class="row">
            <asp:GridView ID="grDetalle" runat="server" AutoGenerateColumns="False" ToolTip="Detalle pedido" CssClass="table" DataKeyNames="ID_ITEM">
                <Columns>
                    <asp:BoundField DataField="ID_ITEM" HeaderText="ITEM">
                    <ControlStyle CssClass="hiddencol" />
                    <FooterStyle CssClass="hiddencol" />
                    <HeaderStyle CssClass="hiddencol" />
                    <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <img id="zoom" alt="" style="cursor: pointer" src="../images/zoom_in.png" class="imageButtons"/>
                                <asp:Panel ID="Panel1" Style="display: none" runat="server">
                                    <asp:GridView ID="grDatos" runat="server" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="STOCK" HeaderText="DEL STOCK" />
                                            <asp:BoundField DataField="STOCK_PROD" HeaderText="STOCK PRODUCTO" />
                                            <asp:BoundField DataField="ENSAMBLADAS" HeaderText="ENSAMBLADAS" />
                                            <asp:BoundField DataField="DEPOSITO" HeaderText="EN DEPOSITO" />
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                    <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                    <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                    <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                    <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                    <asp:BoundField DataField="MANO" HeaderText="MANO" />
                    <asp:BoundField DataField="CANT" HeaderText="CANT" >
                    <ControlStyle Font-Bold="True" />
                    <ItemStyle Font-Bold="True" CssClass="numCols" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </asp:Panel>
</asp:Content>
