<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="modificar.aspx.vb" Inherits="CBA_PLACAS_BS.modificar"  Theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var dropdowns = [$("#" + '<%= DPFiltroEstados.ClientID %>'), $("#" + '<%= DPFiltroClientes.ClientID %>')]
            iniciarDropDowns(dropdowns)
            
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))
            
            $("#" + '<%= DPFiltroEstados.ClientID %>').change(function () {
                var estado, table
                estado = this.value;
                table = document.getElementById('<%= grPedidos.ClientID %>');
                filtro(table, estado, 3)
            })


            $("#" + '<%= DPFiltroClientes.ClientID %>').change(function () {
                var cliente, table
                cliente = this.value;
                table = document.getElementById('<%= grPedidos.ClientID %>');
                filtro(table, cliente, 1)
            })

            $("#btnLimpiarFiltro").click(function () {
                table = document.getElementById('<%= grPedidos.ClientID %>');
                limpiarFiltro(table)

                iniciarDropDowns(dropdowns)
            })
        })
    </script>
    <!--HIDDEN FIELDS-->
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
    <asp:Panel ID="pnlPedidos" runat="server" CssClass="row">
        <div class="form-group">
            <div class="row">
                <div class="col-md-3">
                    <strong>ESTADOS:</strong>
                </div>
                <div class="col-md-3">
                    <strong>CLIENTES:</strong>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <asp:DropDownList ID="DPFiltroEstados" runat="server" DataSourceID="DSestados" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource ID="DSestados" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [estados]"></asp:SqlDataSource>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="DPFiltroClientes" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="NOMBRE"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT [ID], [NOMBRE] FROM [CLIENTES]"></asp:SqlDataSource>
                </div>
                <div class="col-md-3">
                    <div class="btn-group" role="group" aria-label="...">
                        <button id="btnLimpiarFiltro" type="button" class="btn btn-primary" data-dismiss="modal">Limpiar Filtro</button>
                        <asp:Button ID="Button1" runat="server" Text="Refrescar" />
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
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
                    <asp:SqlDataSource ID="dsNvos" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT DISTINCT * FROM [VW_PEDIDOS_EN_CURSO]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>
    </asp:Content>
