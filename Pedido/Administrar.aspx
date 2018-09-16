<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Administrar.aspx.vb" Inherits="CBA_PLACAS_BS.Administrar" Theme="default"%>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            console.log(err)
            if (err == "error") {
                $("#msg").removeClass("alert-success");
                $("#msg").addClass("alert-danger");
                $("#msg").show()
                console.log("error");
            } else if (err == "success") {
                $("#msg").addClass("alert-success");
                $("#msg").removeClass("alert-danger");
                $("#msg").show()
                console.log("exito");
            } else {
                console.log("escondiendo");
                $("#msg").hide();
            }

            //MATERIALES
            var mat = $("#" + '<%= HFMat.ClientID %>').val();
            if (mat=="False") {
                console.log("no hay materiales");
                $("#pnlMat").removeClass("panel-primary")
                $("#pnlMat").addClass("panel-warning")
            } else if (mat == "True") {
                $("#pnlMat").removeClass("panel-warning")
                $("#pnlMat").addClass("panel-primary")
                console.log("hay materiales");
            }

            //IMPRIMIR ORDENES
        })
    </script>
    <div class="page-header">
        <h1 class="text-center">Administracion de Pedidos <br /><small>
        <asp:Label ID="lblSubtitulo" runat="server" Text=""></asp:Label></small></h1>
    </div>
    <div class="row">
        <div id="msg" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HFMsg" runat="server" />
        </div>
    </div>
    <asp:Panel ID="pnlPedidos" runat="server" CssClass="row">
        <div class="form-group">
            <div class="row">
                <div class="col-md-3 col-md-offset-2">
                    <strong>ESTADOS:</strong>
                    <asp:DropDownList ID="DPFiltroEstados" runat="server" DataSourceID="DSestados" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource ID="DSestados" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [estados]"></asp:SqlDataSource>
                </div>
                <div class="col-md-3">
                    <strong>CLIENTES:</strong>
                    <asp:DropDownList ID="DPFiltroClientes" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT [ID], [NOMBRE] FROM [CLIENTES]"></asp:SqlDataSource>
                </div>
                <div class="col-md-2 text-right">
                    <asp:ImageButton ID="btnRefreshNv" runat="server" ImageUrl="~/images/refresh-button-icon.png" ImageAlign="Middle" ToolTip="Refrescar" CssClass="imageButtons img-circle" />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
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
    <asp:Panel ID="pnlDetalle" CssClass="row" runat="server" Visible="false">
        <div class="row">
            <div class="btn-group" role="group" aria-label="...">
                <asp:Button ID="btnVolver" runat="server" Text="Volver" />
                <input id="btnEnviarPRod" class="btn btn-primary" type="button" value="Ordenes De Trabajo" data-toggle="modal" data-target="#enviarProd" />
                <asp:Button ID="Button3" runat="server" Text="Produccion" />
                <asp:Button ID="Button4" runat="server" Text="Deposito" />
            </div>
        </div>
        <div class="row">
            <br />
            <div class="table-responsive">
                <asp:GridView ID="grDetalle" runat="server" AutoGenerateColumns="False" ToolTip="Detalle pedido" CssClass="table">
                    <Columns>
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
                        <ItemStyle Font-Bold="True" CssClass="numCol" />
                        </asp:BoundField>
                        <asp:BoundField DataField="STOCK" HeaderText="DE STOCK" >
                        <ControlStyle Font-Bold="True" />
                        <ItemStyle Font-Bold="True" CssClass="numCol" />
                        </asp:BoundField>
                        <asp:BoundField DataField="P_FAB" HeaderText="PARA FABRICAR" >
                        <ControlStyle Font-Bold="True" />
                        <ItemStyle Font-Bold="True" CssClass="numCol" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="panel-group" id="accordion">
            <div class="panel panel-default panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#stock">
                Stock Disponible</a>
                </h4>
            </div>
            <div id="stock" class="panel-collapse collapse">
                <div class="panel-body">
                    <div class="table-responsive">
                        <asp:GridView ID="grStock" runat="server" AutoGenerateColumns="False" ToolTip="Detalle pedido" CssClass="table-bordered">
                        <Columns>
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
                            <ItemStyle Font-Bold="True" CssClass="numCol" />
                            </asp:BoundField>
                            <asp:BoundField DataField="STOCK_PROD" HeaderText="STOCK DISPONIBLE" >
                            <ControlStyle Font-Bold="True" />
                            <ItemStyle Font-Bold="True" CssClass="numCol" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
                </div>
            </div>
            </div>
            <div id="pnlMat" class="panel panel-default panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#materiales">
                Materiales</a>
                </h4>
            </div>
            <div id="materiales" class="panel-collapse collapse">
                <div class="panel-body">
                    <asp:HiddenField ID="HFMat" runat="server" />
                    <asp:GridView ID="grMateriales" runat="server" ToolTip="Despiece" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="ID_PIEZA" HeaderText="CODIGO" />
                            <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" />
                            <asp:BoundField DataField="CONSUMO" HeaderText="CONSUMO">
                            <ItemStyle CssClass="numCols" />
                            </asp:BoundField>
                            <asp:BoundField DataField="STOCK_DISPONIBLE" HeaderText="DISPONIBLE">
                            <ItemStyle CssClass="numCols" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FALTANTE" HeaderText="FALTANTE">
                            <ItemStyle CssClass="numCols" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            </div>
            <div class="panel panel-default panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#deposito">
                Deposito</a>
                </h4>
            </div>
            <div id="deposito" class="panel-collapse collapse">
                <div class="panel-body">
                    <div class="table-responsive">
                        <asp:GridView ID="grDeposito" runat="server" AutoGenerateColumns="False" ToolTip="Detalle pedido" CssClass="table">
                            <Columns>
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
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="STOCK" HeaderText="DE STOCK" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="P_FAB" HeaderText="PARA FABRICAR" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MARCO_TER" HeaderText="MARCOS TER" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="HOJAS_TER" HeaderText="HOJAS TER" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ENSAMBLADAS" HeaderText="ENSAMBLADAS" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DEPOSITO" HeaderText="EN DEPOSITO" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="P_ALM" HeaderText="P/ALMACENAR" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            </div>
        </div>  
    </div>
    </asp:Panel>
    <div class="modal fade" id="enviarProd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Desea cubrir este pedido con stock existente?</h4>
          </div>
          <div class="modal-body">
            <div class="table-responsive">
                  <asp:GridView ID="grEnviarProd" runat="server" AutoGenerateColumns="False" ToolTip="Detalles del Pedido">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="LINEA" DataField="LINEA" />
                            <asp:BoundField HeaderText="MADERA" DataField="MADERA" />
                            <asp:BoundField HeaderText="HOJA" DataField="HOJA" />
                            <asp:BoundField HeaderText="MARCO" DataField="MARCO" />
                            <asp:BoundField HeaderText="CHAPA" DataField="CHAPA" />
                            <asp:BoundField HeaderText="MANO" DataField="MANO" />
                            <asp:BoundField HeaderText="CANT" DataField="CANT" >
                            <ItemStyle CssClass="numCol" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="STOCK DISP" DataField="STOCK_PROD" >
                            <ItemStyle CssClass="numCol" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="USAR STOCK">
                                <ItemTemplate>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtStockRow" runat="server" ValidationGroup="vgStock" ToolTip="Seleccione cuantas puertas cubrir con stock existente" CssClass="form-control"></asp:TextBox>
                                        <asp:RangeValidator ID="rvStockNvo" runat="server" ControlToValidate="txtStockRow" ErrorMessage="No puede superar Stock o Cantidad" ForeColor="Red" MinimumValue="0" ValidationGroup="vgStock" Type="Integer" MaximumValue="0" Text="0">*</asp:RangeValidator>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ValidationSummary ID="vsNvos" runat="server" ValidationGroup="vgStock" DisplayMode="List" ForeColor="Red" />
                </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <asp:Button ID="btnEnviarProd" runat="server" Text="Enviar" ValidationGroup="vgStock" />
          </div>
        </div>
      </div>
    </div>
</asp:Content>
