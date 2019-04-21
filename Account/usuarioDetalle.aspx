<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="usuarioDetalle.aspx.vb" Inherits="CBA_PLACAS_BS.usuarioDetalle" Theme="default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))
            })
    </script>
    <div class="page-header">
        <h1 class="text-center">Administrar Usuario<br /><small>
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
        <!--botones grupo -->
        <div class="btn-group" role="group" aria-label="...">
            <a href="usuarios.aspx" class="btn btn-primary">Volver</a>
            <button id="btnMod" type="button" class="btn btn-primary" data-toggle="modal" data-target="#mdlDetalle">
                Modificar
            </button>
            <button id="btnEl" type="button" class="btn btn-primary" data-toggle="modal" data-target="#mdlDetalle">
                Eliminar
            </button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mdlHistorial">
                Cambiar Clave
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
                <div class="col-md-4">
                    <strong>Id: </strong><asp:Label ID="lblIDCliente" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-4">
                    <strong>MAIL: </strong><asp:Label ID="lblCuitCliente" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-4">
                    <strong>ROL: </strong><asp:Label ID="lblNombreCliente" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <br />
    <!--modal modificar-->
    <div class="modal fade" id="mdlDetalle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Modificar Cliente</h4>
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
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" ValidationGroup="VGNvoCliente" />
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
    <!--modal historial-->
    <div class="modal fade" id="mdlHistorial" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="lblHistorial">Historial de Pedidos</h4>
          </div>
          <div class="modal-body form-group">
            <div class="table-responsive">
                <asp:GridView ID="grHistorialPedidos" runat="server" DataKeyNames="ID" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="NRO" SortExpression="ID" />
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                        <asp:BoundField DataField="CANT_TOTAL" HeaderText="Cantidad" SortExpression="CANT_TOTAL" >
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
            </div>
          </div>
          <div class="modal-footer">
            <asp:Button ID="Button1" runat="server" Text="Guardar" />
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
