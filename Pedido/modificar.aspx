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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT [ID], [NOMBRE] FROM [CLIENTES]"></asp:SqlDataSource>
                </div>
                <div class="col-md-3">
                     <div class="btn-group" role="group" aria-label="...">
                <button id="btnLimpiarFiltro" type="button" class="btn btn-primary" data-dismiss="modal">Limpiar Filtro</button>
                <asp:Button ID="Button1" runat="server" Text="Refrescar" />
            </div>
                </div>
            </div>
        </div>
        <div class="row">
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
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [CLIENTES]"></asp:SqlDataSource>
        </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlDetalle" CssClass="row" runat="server" Visible="false">
        <div class="row">
            <!--botones grupo -->
            <div class="btn-group" role="group" aria-label="...">
                <asp:Button ID="btnVolver" runat="server" Text="Volver" />
                <div class="btn-group">
                  <button id="btnEliminarGrupo" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Eliminar <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu">
                    <li id="liOrden" class="disabled"><a id="aOrden" href="#">Eliminar Pedido</a></li>
                    <li id="liEtiqueta" class="disabled"><a id="aEtiqueta" href="#mdlImprimir" data-toggle="modal">Eliminar Items</a></li>
                  </ul>
                </div>
                <button id="btnModificar" class="btn btn-primary" type="button" value="" data-toggle="modal" data-target="#enviarProd">
                    Modificar
                </button>
                <asp:Button ID="btnRefrescar" runat="server" Text="Refrescar" />
            </div>
        </div>
        <div class="row">
            <br />
            <div class="table-responsive">
                <!--tabla detalle-->
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
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <!--acordeon-->
            <div class="panel-group" id="accordion">
                <!--panel detalle-->
                <div class="panel panel-default panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#detalle">Detalle Del Pedido</a>
                        </h4>
                    </div>
                    <div id="detalle" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <h5>Numero: <small><asp:Label ID="lblnroPedidoDet" runat="server" Text=""></asp:Label></small></h5>
                            <h5>Cliente: <small><asp:Label ID="lblClienteDet" runat="server" Text=""></asp:Label></small></h5>
                            <h5>Estado: <small><asp:Label ID="lblEstadoDet" runat="server" Text=""></asp:Label></small></h5>
                            <h5>Cantidad: <small><asp:Label ID="lblCantDet" runat="server" Text=""></asp:Label></small></h5>
                            <h5>Recibido: <small><asp:Label ID="lblRecibidoDet" runat="server" Text=""></asp:Label></small></h5>
                            <h5>Modificado: <small><asp:Label ID="lblModificadoDet" runat="server" Text=""></asp:Label></small></h5>
                        </div>
                    </div>
                </div>
                <!--panel registro-->
                <div class="panel panel-default panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#log">Registro De Cambios</a>
                    </h4>
                </div>
                <div id="log" class="panel-collapse collapse">
                    <div class="panel-body">
                        <button class="btn btn-primary" data-target="#mdlRegistro" data-toggle="modal" type="button">
                            <span class="glyphicon glyphicon-list-alt"></span> Mostrar Registro
                        </button>
                    </div>
                </div>
            </div>
            </div>  
        </div>
        
    </asp:Panel>
    <!--MODAL REGISTRO HISTORICO-->
    <div class="modal fade" id="mdlRegistro" tabindex="-1" role="dialog" aria-labelledby="registroLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="registroLabel">Registro Actividad</h4>
          </div>
          <div class="modal-body">
            <div class="table-responsive">
                <asp:GridView ID="grLog" runat="server"></asp:GridView>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
