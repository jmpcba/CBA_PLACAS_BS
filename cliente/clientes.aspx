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
                        <button id="btnNvo" class="btn btn-primary" type="button" value="" data-toggle="modal" data-target="#mdlDetalle">Nuevo Cliente</button>
                        <button id="btnLimpiarFiltro" type="button" class="btn btn-primary" data-dismiss="modal">Limpiar Filtro</button>
                        <asp:Button ID="Button1" runat="server" Text="Refrescar" />
                    </div>
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
    <asp:Panel ID="pnlDetalle" runat="server" Visible="False"></asp:Panel>
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
            <button type="button" class="btn btn-primary">Guardar</button>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
