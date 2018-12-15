<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="nuevo.aspx.vb" Inherits="CBA_PLACAS_BS.nuevo" Theme="default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            if (err == "error") {
                $("#msg").removeClass("alert-success");
                $("#msg").addClass("alert-danger");
                $("#msg").show()
            } else if (err == "success") {
                $("#msg").addClass("alert-success");
                $("#msg").removeClass("alert-danger");
                $("#msg").show()
            } else {
                $("#msg").hide();
            }
        })
    </script>
    <div class="page-header">
        <h1 class="text-center">Nuevo Pedido<br /><small>
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
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default panel-primary panel-primary">
            <div class="panel-heading" role="tab" id="headingOne">
                <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Seleccione un Cliente
                </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                <div class="panel-body">
                      <div class="form-group">
                          <div class="row">
                              <div class="col-md-1">
                                  Cliente
                              </div>
                              <div class="col-md-4">
                                <asp:DropDownList ID="dpCliente" runat="server" AutoPostBack="True" ValidationGroup="vgCliente" DataSourceID="dsClientes" DataTextField="NOMBRE" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="dsClientes" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [CLIENTES]"></asp:SqlDataSource>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="dpCliente" CssClass="validators" ErrorMessage="Debe elegir un cliente de la lista" Operator="NotEqual" ValidationGroup="vgCliente" ValueToCompare="">*</asp:CompareValidator>
                              </div>
                          </div>
                        <asp:Panel ID="pnlDatosCliente" Visible="False" runat="server">
                            <hr />
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Detalle</h3>
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
                    </asp:Panel>
                      </div>
                </div>
            </div>
            </div>
            <div class="panel panel-default panel-primary">
            <div class="panel-heading" role="tab" id="headingTwo">
                <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    Pedido
                </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                <div class="panel-body">
                PEDIDO
                </div>
            </div>
            </div>
            <div class="panel panel-default panel-primary">
            <div class="panel-heading" role="tab" id="headingThree">
                <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    Resumen
                </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                <div class="panel-body">
                RESUMEN
                </div>
            </div>
            </div>
            <div class="panel panel-default panel-primary">
            <div class="panel-heading" role="tab" id="headingFour">
                <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    Confirmacion
                </a>
                </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                <div class="panel-body">
                CONFIRMACION
                </div>
            </div>
            </div>
        </div>
    </div>
    </asp:Content>
