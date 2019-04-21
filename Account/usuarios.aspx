<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="usuarios.aspx.vb" Inherits="CBA_PLACAS_BS.usuarios" theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var table = document.getElementById('<%= grUsuarios.ClientID %>');
            var txtBox = [$("#" + '<%= txtNombre.ClientID %>'), $("#" + '<%= txtUsr.ClientID %>')]
            var drops = [$("#" + '<%= dpRoles.ClientID %>'), $("#" + '<%= DPNvoRol.ClientID %>')]

            iniciarDropDowns(drops)
            iniciarTextBoxes(txtBox)

            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))

            //FILTRAR POR NOMBRE
            $("#" + '<%= txtNombre.ClientID %>').keyup(function () {
                var usr
                usr = this.value;
                filtro(table, usr, 1)
            })

            //FILTRAR POR ROL
            $("#" + '<%= dpRoles.ClientID %>').keyup(function () {
                var rol
                rol = this.value;
                filtro(table, rol, 2)
            })

            //LIMPIAR FILTROS
            $("#btnLimpiarFiltro").click(function () {
                limpiarFiltro(table)

                iniciarDropDowns(drops)
                iniciarTextBoxes(txtBox)
            })

            if ($("input[id$=HFRol]").val() == "GERENCIA") {
                var controles = [$("#btnNvo")]
                console.log(controles)
                inHabilitarControles(controles)
            }
        })
    </script>
    <div class="page-header">
        <h1 class="text-center">Administrar Usuarios <br /><small>
        <asp:Label ID="lblSubtitulo" runat="server" Text=""></asp:Label></small></h1>
    </div>
    <div class="row">
        <div id="msg" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HFMsg" runat="server" />
        </div>
    </div>
    <br />
    <asp:Panel ID="pnlClientes" runat="server">
        <div class="form-group">
            <div class="row">
            <div class="col-md-3">
                <strong>USUARIO:</strong><br />
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <strong>ROL:</strong>
                <asp:DropDownList ID="dpRoles" runat="server" DataSourceID="DSroles" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="DSroles" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT * FROM [AspNetRoles]"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1"></asp:SqlDataSource>
            </div>
            <div class="col-md-6">
                <br />
                <div class="btn-group pull-right" role="group" aria-label="...">
                    <button id="btnLimpiarFiltro" type="button" class="btn btn-primary" data-dismiss="modal">Limpiar Filtro</button>
                    <asp:Button ID="btnRefrescar" runat="server" Text="Refrescar" />
                    <button id="btnNvo" class="btn btn-primary" type="button" value="" data-toggle="modal" data-target="#mdlNvo">Nuevo Usuario</button>
                </div>
            </div>
        </div>
            <br />
            <div class="row">
                <hr />
                <div class="table-responsive">
                    <asp:GridView ID="grUsuarios" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID" DataSourceID="DSUsuarios">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id">
                                <ControlStyle CssClass="hiddencol" />
                                <FooterStyle CssClass="hiddencol" />
                                <HeaderStyle CssClass="hiddencol" />
                                <ItemStyle CssClass="hiddencol" />
                            </asp:BoundField>
                            <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                                <ControlStyle CssClass="imageButtons" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="DSUsuarios" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="select U.id, U.username, R.name from AspNetUsers U
                        inner join AspNetUserRoles UR on UR.UserId = U.id
                        inner join AspNetRoles R on R.id = UR.RoleId">
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>
    <!--MODAL NUEVO USUARIO-->
    <div class="modal fade" id="mdlNvo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Nuevo Cliente</h4>
          </div>
          <div class="modal-body form-group">
            <div class="row">
                <div class="col-md-3"><strong>MAIL</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese un mail" Text="*" CssClass="text-danger" ControlToValidate="txtUsr" ValidationGroup="VGNvoUser"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese mail valido" CssClass="text-danger" ValidationGroup="VGNvoUser" ControlToValidate="txtUsr" Text="*" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtUsr" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>CONTRASEÑA</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese una contraseña" Text="*" CssClass="text-danger" ControlToValidate="txtPass" ValidationGroup="VGNvoUser"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>CONFIRMAR CONTRASEÑA</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="confirme contraseña" Text="*" CssClass="text-danger" ControlToValidate="txtConfPass" ValidationGroup="VGNvoUser"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" ControlToCompare="txtPass" ControlToValidate="txtConfPass"
                    CssClass="text-danger" Display="Dynamic" Text="*" ErrorMessage="La contraseña y la contraseña de confirmación no coinciden." ValidationGroup="VGNvoUser"/>
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtConfPass" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>ROL</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="seleccione un rol" Text="*" CssClass="text-danger" ControlToValidate="DPNvoRol" ValidationGroup="VGNvoUser"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <asp:DropDownList ID="DPNvoRol" runat="server" DataSourceID="DSroles" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                </div>
            </div><br />
              <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" ValidationGroup="VGNvoUser" />
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" ValidationGroup="VGNvoUser"/>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
