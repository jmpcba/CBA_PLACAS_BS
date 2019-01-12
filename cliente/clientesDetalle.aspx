<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="clientesDetalle.aspx.vb" Inherits="CBA_PLACAS_BS.clientesDetalle" theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
        <!--botones grupo -->
        <div class="btn-group" role="group" aria-label="...">
            <asp:Button ID="btnVolver" runat="server" Text="Volver" />
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mdlDetalle">
                Modificar
            </button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mdlHistorial">
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
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" />
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
                <asp:GridView ID="grHistorialPedidos" runat="server" DataKeyNames="ID_PEDIDO" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ID_PEDIDO" HeaderText="NRO" SortExpression="ID_PEDIDO" />
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                        <asp:BoundField DataField="CANT" HeaderText="Cantidad" SortExpression="CANT" >
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
