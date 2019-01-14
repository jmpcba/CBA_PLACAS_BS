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

            //FILTRAR POR PROVINCIA
            $("#" + '<%= dpFiltroProv.ClientID %>').change(function () {
                var prov, table
                prov = this.value;
                table = document.getElementById('<%= grClientes.ClientID %>');
                filtro(table, prov, 3)
            })

            //FILTRAR POR NOMBRE
            $("#" + '<%= txtBuscarNombre.ClientID %>').keyup(function () {
                console.log("cambio en txtNombre")
                var cliente, table
                cliente = this.value;
                table = document.getElementById('<%= grClientes.ClientID %>');
                filtro(table, cliente, 2)
            })

            //FILTRAR POR CUIT
            $("#" + '<%= txtBuscarCuit.ClientID %>').keyup(function () {
                var cuit, table
                cuit = this.value;
                table = document.getElementById('<%= grClientes.ClientID %>');
                filtro(table, cuit, 1)
            })

            //LIMPIAR FILTROS
            $("#btnLimpiarFiltro").click(function () {
                table = document.getElementById('<%= grClientes.ClientID %>');
                limpiarFiltro(table)

                iniciarDropDowns([$("#" + '<%= dpFiltroProv.ClientID %>'), ])
                iniciarTextBoxes([$("#" + '<%= txtBuscarCuit.ClientID %>'),$("#" + '<%= txtBuscarNombre.ClientID %>')])
            })
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
    <div class="row">
        <div class="col-md-12">
            <button id="btnNvo" class="btn btn-primary" type="button" value="" data-toggle="modal" data-target="#mdlDetalle">Nuevo Cliente</button>
        </div>
    </div>
    <br />
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
    <!-- Modal modificar-->
    <div class="modal fade" id="mdlDetalle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Nuevo Cliente</h4>
          </div>
          <div class="modal-body form-group">
            <div class="row">
                <div class="col-md-3"><strong>CUIT</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese un CUIT" Text="*" CssClass="validators" ControlToValidate="txtCuit" ValidationGroup="VGNvoCliente"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese un CUIT valido" ValidationExpression="\b(20|23|24|27|30|33|34)(\D)?[0-9]{8}(\D)?[0-9]" CssClass="validators" ValidationGroup="VGNvoCliente" ControlToValidate="txtCuit" Text="*"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtCuit" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Razon social</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese un nombre" Text="*" CssClass="validators" ControlToValidate="txtNombre" ValidationGroup="VGNvoCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Direccion</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ingrese una direccion" Text="*" CssClass="validators" ControlToValidate="txtDir" ValidationGroup="VGNvoCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtDir" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Telefono</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Ingrese un telefono" Text="*" CssClass="validators" ControlToValidate="txtTel" ValidationGroup="VGNvoCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Mail</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ingrese un mail" Text="*" CssClass="validators" ControlToValidate="txtMail" ValidationGroup="VGNvoCliente"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un mail valido" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" CssClass="validators" ValidationGroup="VGNvoCliente" ControlToValidate="txtMail" Text="*"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Ciudad</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Ingrese una ciudad" Text="*" CssClass="validators" ControlToValidate="txtCiudad" ValidationGroup="VGNvoCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtCiudad" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Provincia</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Seleccione una provincia" Text="*" CssClass="validators" ControlToValidate="dpProv" ValidationGroup="VGNvoCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="dpProv" runat="server">
                    </asp:DropDownList>
                </div>
            </div><br />
              <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validators" ValidationGroup="VGNvoCliente" />
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" ValidationGroup="VGNvoCliente"/>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
