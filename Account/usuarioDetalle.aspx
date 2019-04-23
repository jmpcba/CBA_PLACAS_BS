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
                    <strong>Id: </strong><asp:Label ID="lblId" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-4">
                    <strong>MAIL: </strong><asp:Label ID="lblMail" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-4">
                    <strong>ROL: </strong><asp:Label ID="lblRol" runat="server" Text="Label"></asp:Label>
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
                <div class="col-md-1"><strong>Mail:</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese un Mail" Text="*" CssClass="text-danger" ControlToValidate="txtModMail" ValidationGroup="VGNvoCliente"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese un mail valido" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" CssClass="text-danger" ValidationGroup="VGNvoCliente" ControlToValidate="txtModMail" Text="*"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="txtModMail" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-1"><strong>Rol</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese un rol" Text="*" CssClass="text-danger" ControlToValidate="dpRoles" ValidationGroup="VGNvoCliente"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <asp:DropDownList ID="dpRoles" runat="server" DataSourceID="DSRoles" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="DSRoles" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT * FROM [AspNetRoles]"></asp:SqlDataSource>
                </div>
            </div><br />
              <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" ValidationGroup="VGNvoCliente" />
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
            <h4 class="modal-title" id="lblHistorial">Cambiar Clave</h4>
          </div>
          <div class="modal-body form-group">
            <div class="row">
            <div class="col-md-3"><strong>Nueva Clave:</strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ingrese una clave" Text="*" CssClass="text-danger" ControlToValidate="txtPass" ValidationGroup="vgCambioClave"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-9">
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox><br />
            </div>
            <div class="col-md-3"><strong>Confirme Clave:</strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="confirme la clave" Text="*" CssClass="text-danger" ControlToValidate="txtConfPass" ValidationGroup="vgCambioClave"></asp:RequiredFieldValidator>
                <asp:CompareValidator runat="server" ControlToCompare="txtPass" ControlToValidate="txtConfPass" CssClass="text-danger" Text="*" Display="Dynamic" ErrorMessage="La contraseña y la contraseña de confirmación no coinciden." ValidationGroup="vgCambioClave"/>
            </div>
            <div class="col-md-9">
                <asp:TextBox ID="txtConfPass" runat="server" TextMode="Password"></asp:TextBox>
            </div>
        </div><br />
            <div class="row">
                <div class="col-md-12">
                    <asp:ValidationSummary CssClass="text-danger" ID="ValidationSummary2" runat="server" ValidationGroup="vgCambioClave" DisplayMode="List" />
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnCambiarClave" runat="server" Text="Guardar" ValidationGroup="vgCambioClave" />
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
