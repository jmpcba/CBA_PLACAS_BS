<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="nuevo.aspx.vb" Inherits="CBA_PLACAS_BS.nuevo" Theme="default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="../scripts/funcionesComunes.js">
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            //ABRIR ULTIMO PANEL
            var pnlActual = $("#" + '<%= HFPanelActual.ClientID %>').val()
            var pnlAnterior = $("#" + '<%= HFPanelAnterior.ClientID %>').val()
            console.log("PANELES SEGUN HF")
            console.log(pnlActual)
            console.log(pnlAnterior)
            if (pnlActual != "") {
                $("#" + pnlActual).addClass("in")
                $("#" + pnlAnterior).removeClass("in")
            } else {
                $("#pnlCliente").addClass("in")
            }

            //DETECTAR POSICION DE SCROLL
            $(window).scroll(function (event) {
                var scroll = $(window).scrollTop();
                $("#" + '<%= HFPos.ClientID %>').val(scroll)
            });

            var pos = $("#" + '<%= HFPos.ClientID %>').val()
            if (pos != "") {
                $(window).scrollTop(pos)
            }

            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))
            
            
            $("#aConfirmacion").prop("disabled", true);
            

            //HABILITAR PANEL PEDIDO SI SE ELIGIO UN CLIENTE
            if ($("#" + '<%= hfCliente.ClientID %>').val() != "inicial") {
                $("#aPedido").prop("disabled", false);
                $("#btnSigCliente").prop("disabled", false);
                $("#headingPedido").addClass("panel-primary")
                
            } else {
                $("#aPedido").prop("disabled", true);
                $("#btnSigCliente").prop("disabled", true);
                $("#headingPedido").removeClass("panel-primary")
            }

            //HABILITAR PANEL RESUMEN SI HAY PEDIDOS
            if ($("#" + '<%= hfPedido.ClientID %>').val() != 0) {
                $("#aResumen").prop("disabled", false);
                $("#btnSigPedido").prop("disabled", false);
                $("#headingResumen").addClass("panel-primary")
                
            } else {
                $("#aResumen").prop("disabled", true);
                $("#btnSigPedido").prop("disabled", true);
                $("#headingResumen").removeClass("panel-primary")
            }

            //IDENTIFICAR ULTIMO PANEL ABIERTO Y CERRADO
            $(".panel-collapse").on("shown.bs.collapse", function () {
                var pnl = $(this).attr('id')
                $("#" + '<%= HFPanelActual.ClientID %>').val(pnl)
            })

            $(".panel-collapse").on("hidden.bs.collapse", function () {
                var pnl = $(this).attr('id')
                $("#" + '<%= HFPanelAnterior.ClientID %>').val(pnl)
            })

            //PANEL STOCK
            if ($("#" + '<%= HFStock.ClientID %>').val() == "1") {
                $("#pnlStock").removeClass("panel-danger")
                $("#pnlStock").addClass("panel-success")
                console.log("true")
                console.log($("#" + '<%= HFStock.ClientID %>').val())
            } else {
                $("#pnlStock").removeClass("panel-success")
                $("#pnlStock").addClass("panel-danger")
                console.log("false")
                console.log($("#" + '<%= HFStock.ClientID %>').val())
            }
        })
    </script>
    <!--HIDDEN FIELDS-->
    <asp:HiddenField ID="HFStock" value="0" runat="server" />
    <asp:HiddenField ID="HFPanelActual" runat="server" />
    <asp:HiddenField ID="HFPos" runat="server" />
    <asp:HiddenField ID="HFPanelAnterior" runat="server" />
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
            <div id="pnlCliente" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                <div class="panel-body">
                      <div class="form-group">
                          <div class="row">
                              <div class="col-md-2">
                                  Seleccione un Cliente
                              </div>
                              <div class="col-md-4">
                                <asp:DropDownList ID="dpCliente" runat="server" AutoPostBack="True" ValidationGroup="vgCliente"></asp:DropDownList>
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
                            <br />
                        </asp:Panel>
                    </div>
                    <button id="btnSigCliente" class="btn btn-primary pull-right" type="button" data-toggle="collapse" data-parent="#accordion" data-target="#pnlPedido" aria-expanded="false" aria-controls="pnlPedido">
                        Siguiente</button>
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
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">Seleccione una linea de productos</h3>
                        </div>
                    <div class="panel-body">
                        <div class="col-md-1">
                            Linea:
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="cbLinea" AutoPostBack="true" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                    <br />
                    <asp:Panel ID="pnlCombos" Visible="false" runat="server">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">Caracteristicas</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-2">
                                    Chapa:
                                </div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="cbChapa" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    Marco:
                                </div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="cbMarco" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    Madera:
                                </div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="cbMadera" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-2">
                                    Hoja:
                                </div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="cbHoja" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    Mano:
                                </div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="cbMano" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    Cantidad:
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtCant" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="rgvCant" runat="server" ErrorMessage="Ingrese un valor numerico" ControlToValidate="txtCant" ValidationExpression="\d*" Display="Static" Text="*" CssClass="validators"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese un valor numerico" Text="*" ControlToValidate="txtCant" CssClass="validators"></asp:RequiredFieldValidator>
                                </div>  
                            </div>
                            <div class="row">
                                <asp:Panel ID="pnlValidacion" runat="server" CssClass="validators">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" />
                                </asp:Panel>
                            </div>
                            <div class="row">
                                <div class="col-md-2 col-md-offset-10">
                                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="pull-right" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                </asp:Panel>
                    <asp:Panel ID="pnlDetalle" Visible ="false" runat="server">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">Detalle</h3>
                        </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <asp:GridView ID="grPedido" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete.png" ShowDeleteButton="True">
                                    <ControlStyle Width="20px" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                                    <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                                    <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                                    <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                                    <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                                    <asp:BoundField DataField="MANO" HeaderText="MANO" />
                                    <asp:BoundField DataField="CANTIDAD" HeaderText="CANTIDAD" >
                                    <HeaderStyle CssClass="numCols" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="numCols" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="MONTO" HeaderText="MONTO" DataFormatString="{0:C2}" >
                                    <HeaderStyle CssClass="numCols" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="numCols" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                </asp:Panel>
                    <br />
                    <button class="btn btn-primary pull-left" type="button" data-toggle="collapse" data-parent="#accordion" data-target="#pnlCliente" aria-expanded="false" aria-controls="pnlPedido">
                        Anterior</button>
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
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">Resumen</h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-4">
                                <h5><strong>Cliente: </strong>
                                    <asp:Label ID="lblCliente" runat="server" Text="Label"></asp:Label></h5>
                            </div>
                            <div class="col-md-4">
                                <h5><strong>Cant Total: </strong>
                                    <asp:Label ID="lblCantTotal" runat="server" Text="Label"></asp:Label></h5>
                            </div>
                            <div class="col-md-4">
                                <h5><strong>Monto Total: </strong>
                                    <asp:Label ID="lblMontoTotal" runat="server" Text="Label"></asp:Label></h5>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div id="pnlStock" class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <asp:Label ID="lblStock" runat="server" Text="Label"></asp:Label>
                            </h3>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <asp:GridView ID="grPepedidoConfirmar" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                                        <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                                        <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                                        <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                                        <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                                        <asp:BoundField DataField="MANO" HeaderText="MANO" />
                                        <asp:BoundField DataField="CANTIDAD" HeaderText="PEDIDO" >
                                        <HeaderStyle CssClass="numCols" />
                                        <ItemStyle CssClass="numCols" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="STOCK" HeaderText="STOCK" ItemStyle-HorizontalAlign="Right" >
                                            <HeaderStyle CssClass="numCols" />
                                            <ItemStyle HorizontalAlign="Right" CssClass="numCols"></ItemStyle>
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <br>
                    <button class="btn btn-primary pull-left" type="button" data-toggle="collapse" data-parent="#accordion" data-target="#pnlPedido" aria-expanded="false" aria-controls="pnlPedido">
                        Anterior
                    </button>
                    <button class="btn btn-primary pull-right" type="button" data-toggle="modal" data-parent="#accordion" data-target="#mdlConfirmacion" aria-expanded="false" aria-controls="pnlPedido">
                        Enviar
                    </button>
                </div>
            </div>
            </div>
            <!--div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingConfirmacion">
                <h4 class="panel-title">
                <a class="collapsed" id="aConfirmacion" role="button" data-toggle="collapse" data-parent="#accordion" href="#pnlConfirmacion" aria-expanded="false" aria-controls="collapseThree">
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
            </!--div-->
        </div>
    </div>
    <!--MODAL CONFIRMACION-->
    <div class="modal fade" tabindex="-1" role="dialog" id="mdlConfirmacion">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger"">
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
