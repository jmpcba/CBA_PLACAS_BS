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

            //HABILITAR PANEL PEDIDO SI SE ELIGIO UN CLIENTE
            if ($("#" + '<%= hfCliente.ClientID %>').val() != "inicial") {
                console.log("habilitando")
                $("#aPedido").prop("disabled", false);
                $("#btnSigCliente").prop("disabled", false);
                $("#headingPedido").addClass("panel-primary")
                
            } else {
                console.log("des-habilitando")
                $("#aPedido").prop("disabled", true);
                $("#btnSigCliente").prop("disabled", true);
                $("#headingPedido").removeClass("panel-primary")
            }

            //HABILITAR PANEL RESUMEN SI HAY PEDIDOS
            if ($("#" + '<%= hfPedido.ClientID %>').val() != 0) {
                console.log("habilitando")
                $("#aResumen").prop("disabled", false);
                $("#btnSigPedido").prop("disabled", false);
                $("#headingResumen").addClass("panel-primary")
                
            } else {
                console.log("des-habilitando")
                $("#aResumen").prop("disabled", true);
                $("#btnSigPedido").prop("disabled", true);
                $("#headingResumen").removeClass("panel-primary")
            }

            $(function () {
                var paneName = $("[id*=PaneName]").val() != "" ? $("[id*=PaneName]").val() : "collapseOne";
                console.log(paneName)
                //Remove the previous selected Pane.
                $("#accordion .in").removeClass("in");

                //Set the selected Pane.
                $("#" + paneName).collapse("show");

                //When Pane is clicked, save the ID to the Hidden Field.
                $(".panel-heading a").click(function () {
                    $("[id*=PaneName]").val($(this).attr("href").replace("#", ""));
                });
            });
        })
    </script>
    <!--HIDDEN FIELDS-->
    <asp:HiddenField ID="paneName" runat="server" />
    <asp:HiddenField ID="hfCliente" runat="server" Value="inicial" />
    <asp:HiddenField ID="hfPedido" runat="server" Value="0" />
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
            <div id="headingCLiente" class="panel panel-default panel-primary">
            <div class="panel-heading" role="tab" id="headingOne">
                <h4 class="panel-title">
                <a id="aCliente" role="button" data-toggle="collapse" data-parent="#accordion" href="#pnlCliente" aria-expanded="true" aria-controls="collapseOne">
                    Cliente
                </a>
                </h4>
            </div>
            <div id="pnlCliente" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                <div class="panel-body">
                      <div class="form-group">
                          <div class="row">
                              <div class="col-md-2">
                                  Seleccione un Cliente
                              </div>
                              <div class="col-md-4">
                                <asp:DropDownList ID="dpCliente" runat="server" AutoPostBack="True" ValidationGroup="vgCliente" DataSourceID="dsClientes" DataTextField="NOMBRE" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="dsClientes" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [CLIENTES]"></asp:SqlDataSource>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="dpCliente" CssClass="validators" ErrorMessage="Debe elegir un cliente de la lista" Operator="NotEqual" ValidationGroup="vgCliente" ValueToCompare="">*</asp:CompareValidator>
                              </div>
                          </div>
                        <asp:Panel ID="pnlDatosCliente" Visible="False" runat="server">
                            <hr />
                            <div class="panel panel-info">
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
                    <button id="btnSigCliente" class="btn btn-primary pull-right" type="button" data-toggle="collapse" data-parent="#accordion" data-target="#pnlPedido" aria-expanded="false" aria-controls="pnlPedido">
                        Siguiente
                    </button>
                </div>
            </div>
            </div>
            <div id="headingPedido" class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwo">
                <h4 class="panel-title">
                <a id="aPedido" class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#pnlPedido" aria-expanded="false" aria-controls="collapseTwo">
                    Pedido
                </a>
                </h4>
            </div>
            <div id="pnlPedido" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                <div class="panel-body">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="col-md-3">
                                Seleccione una linea de productos
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="cbLinea" AutoPostBack="true" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <br />
                    <button class="btn btn-primary pull-left" type="button" data-toggle="collapse" data-parent="#accordion" data-target="#pnlCliente" aria-expanded="false" aria-controls="pnlPedido">
                        Anterior
                    </button>
                    <button id="btnSigPedido" class="btn btn-primary pull-right" type="button" data-toggle="collapse" data-parent="#accordion" data-target="#pnlResumen" aria-expanded="false" aria-controls="pnlPedido">
                        Siguiente
                    </button>
                </div>
            </div>
            </div>
            <div id="headingResumen" class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingThree">
                <h4 class="panel-title">
                <a id="aResumen" class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#pnlResumen" aria-expanded="false" aria-controls="collapseThree">
                    Resumen
                </a>
                </h4>
            </div>
            <div id="pnlResumen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                <div class="panel-body">
                    RESUMEN
                    <br />
                    <button class="btn btn-primary pull-left" type="button" data-toggle="collapse" data-parent="#accordion" data-target="#pnlResumen" aria-expanded="false" aria-controls="pnlPedido">
                        Anterior
                    </button>
                    <button class="btn btn-primary pull-right" type="button" data-toggle="modal" data-parent="#accordion" data-target="#mdlConfirmacion" aria-expanded="false" aria-controls="pnlPedido">
                        Enviar
                    </button>
                </div>
            </div>
            </div>
            <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingFour">
                <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#pnlConfirmacion" aria-expanded="false" aria-controls="collapseThree">
                    Confirmacion
                </a>
                </h4>
            </div>
            <div id="pnlConfirmacion" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                <div class="panel-body">
                    CONFIRMACION
                    <br />
                    <button class="btn btn-primary pull-left" type="button" data-toggle="collapse" data-parent="#accordion" data-target="#pnlResumen" aria-expanded="false" aria-controls="pnlPedido">
                        Nuevo Pedido
                    </button>
                </div>
            </div>
            </div>
        </div>
    </div>
    <!--MODAL CONFIRMACION-->
    <div class="modal fade" tabindex="-1" role="dialog" id="mdlConfirmacion">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Confirme</h4>
                </div>
                <div class="modal-body">
                    <p>Desea enviar este pedido?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                    <asp:Button ID="btnEnviar" runat="server" Text="Si" />
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</asp:Content>
