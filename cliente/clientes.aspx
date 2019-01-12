<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="clientes.aspx.vb" Inherits="CBA_PLACAS_BS.clientes" theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            
            //INICIAR DROPDOWN PROVINCIAS EN PAGINA PRINCIPAL
            iniciarDropDowns([$("#" + '<%= dpFiltroProv.ClientID %>'),])

            //INICIAR DROPDOWN EN MODAL DETALLE
            $('#btnNvo').click(function(){
                var dropdowns = [$("#" + '<%= dpProv.ClientID %>'),]
                iniciarDropDowns(dropdowns)
            })

            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))
        })
    </script>
    <div class="page-header">
        <h1 class="text-center">Administrar Clientes <br /><small>
        <asp:Label ID="lblSubtitulo" runat="server" Text=""></asp:Label></small></h1>
    </div>
    <div class="row">
        <div id="msg" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HFMsg" runat="server" />
        </div>
    </div>
    <asp:Panel ID="pnlClientes" runat="server">
        <div class="form-group">
            <div class="row">
            <div class="col-md-3">
                <strong>NOMBRE:</strong>
            </div>
            <div class="col-md-2">
                <strong>CUIT:</strong>
            </div>
            <div class="col-md-3">
                <strong>PROVINCIA:</strong>
            </div>
        </div>
            <div class="row">
                <div class="col-md-3">
                    <asp:TextBox ID="txtBuscarNombre" runat="server"></asp:TextBox>
                 </div>
                <div class="col-md-2">
                    <asp:TextBox ID="txtBuscarCuit" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="dpFiltroProv" runat="server"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <div class="btn-group" role="group" aria-label="...">
                        <button id="btnLimpiarFiltro" type="button" class="btn btn-primary" data-dismiss="modal">Limpiar Filtro</button>
                        <asp:Button ID="btnRefrescar" runat="server" Text="Refrescar" />
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <button id="btnNvo" class="btn btn-primary" type="button" value="" data-toggle="modal" data-target="#mdlDetalle">Nuevo Cliente</button>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="table-responsive">
                    <asp:GridView ID="grClientes" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID" DataSourceID="DSClientes">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID">
                                <ControlStyle CssClass="hiddencol" />
                                <FooterStyle CssClass="hiddencol" />
                                <HeaderStyle CssClass="hiddencol" />
                                <ItemStyle CssClass="hiddencol" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CUIT" HeaderText="CUIT" SortExpression="CUIT" />
                            <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                            <asp:BoundField DataField="PROVINCIA" HeaderText="PROVINCIA" SortExpression="PROVINCIA" />
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                                <ControlStyle CssClass="imageButtons" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:SqlDataSource ID="DSClientes" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [CLIENTES]"></asp:SqlDataSource>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlDatosCliente" Visible="False" runat="server">
            <div class="row">
            <!--botones grupo -->
            <div class="btn-group" role="group" aria-label="...">
                <asp:Button ID="btnVolver" runat="server" Text="Volver" />
                <button id="btnModificar" type="button" class="btn btn-primary">
                Modificar
                </button>
                <button id="btnHistorial" type="button" class="btn btn-primary">
                Historial de Pedidos
                </button>
                <asp:Button ID="btnRefrescarDetalle" runat="server" Text="Refrescar" />
            </div>
        </div>
        <hr />
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <asp:Label ID="lblNombreTitulo" runat="server" Text=""></asp:Label>
                </h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-3">
                        <strong>Id: </strong><asp:Label ID="lblIDCliente" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <strong>CUIT: </strong><asp:Label ID="lblCuitCliente" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <strong>Nombre: </strong><asp:Label ID="lblNombreCliente" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <strong>Telefono: </strong><asp:Label ID="lblTelCliente" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <strong>Mail: </strong><asp:Label ID="lblMailcliente" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <strong>Direccion: </strong><asp:Label ID="lblDirCliente" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <strong>Ciudad: </strong><asp:Label ID="lblCiudadCliente" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <strong>Provincia: </strong><asp:Label ID="lblProvCliente" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <br />
    </asp:Panel>
    <!-- Modal -->
    <div class="modal fade" id="mdlDetalle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Nuevo Cliente</h4>
          </div>
          <div class="modal-body form-group">
            <div class="row">
                <div class="col-md-3"><strong>CUIT</strong></div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtCuit" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Razon social</strong></div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Direccion</strong></div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtDir" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Telefono</strong></div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Mail</strong></div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Ciudad</strong></div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtCiudad" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Provincia</strong></div>
                <div class="col-md-4">
                    <asp:DropDownList ID="dpProv" runat="server">
                    </asp:DropDownList>
                </div>
            </div><br />
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" />
          </div>
        </div>
      </div>
    </div>
</asp:Content>
