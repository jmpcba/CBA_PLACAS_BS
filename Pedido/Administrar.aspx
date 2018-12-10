<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Administrar.aspx.vb" Inherits="CBA_PLACAS_BS.Administrar" Theme="default"%>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
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

            //MATERIALES
            var mat = $("#" + '<%= HFMat.ClientID %>').val();
            if (mat=="False") {
                $("#pnlMat").removeClass("panel-primary")
                $("#pnlMat").addClass("panel-warning")

                $("#pnlMatOrden").removeClass("panel-success")
                $("#pnlMatOrden").addClass("panel-warning")

            } else if (mat == "True") {
                $("#pnlMat").removeClass("panel-warning")
                $("#pnlMat").addClass("panel-primary")

                $("#pnlMatOrden").removeClass("panel-warning")
                $("#pnlMatOrden").addClass("panel-success")
            }

            //DESACTIVAR BOTON ORDENES DE TRABAJO
            if ($("#" + '<%= HFBtnOrden.ClientID %>').val() == "disabled") {
                $("#btnEnviarProd").prop("disabled", true);
            } else {
                $("#btnEnviarProd").prop("disabled", false);
            }

            //DESACTIVAR BOTON PRODUCCION
            if ($("#" + '<%= HFBtnProd.ClientID %>').val() == "disabled") {
                $("#btnProd").prop("disabled", true);
            } else {
                $("#btnProd").prop("disabled", false);
            }

            //DESACTIVAR BOTON DEPOSITO
            if ($("#" + '<%= HFBtnDepo.ClientID %>').val() == "disabled") {
                $("#btnDepo").prop("disabled", true);
            } else {
                $("#btnDepo").prop("disabled", false);
            }

            //IMPRIMIR ORDENES
            if ($("#" + '<%= HFCrystal.ClientID%>').val() == "orden") {
                var newWindow = window.open("../reporte/impresion.aspx?rpt=orden&idPedido=" + $("#" + '<%= HFIDPedido.ClientID %>').val(), '', "width=800, height=1000");
                newWindow.blur();
                window.focus()

            } else if ($("#" + '<%= HFCrystal.ClientID%>').val() == "compra") {
                var newWindow = window.open("../reporte/impresion.aspx?rpt=compra&idPedido=" + $("#" + '<%= HFIDPedido.ClientID %>').val(), '', "width=800, height=1000");
                newWindow.blur();
                window.focus()
            
            }else if ($("#" + '<%= HFCrystal.ClientID%>').val() == "remito") {
                var newWindow = window.open("../reporte/impresion.aspx?rpt=remito&idPedido=" + $("#" + '<%= HFIDPedido.ClientID %>').val(), '', "width=800, height=1000");
                newWindow.blur();
                window.focus()
            }
            //IMPRIMIR ETIQUETAS DE DEPOSITO ANTES DE QUE EL SERVIDOR HAGA POSTBACK Y PROCESE LA ACTUALZIACION
            $("#<%= btnAccionDepo.ClientID%>").click(function () {
                if ($("#" + '<%= HFDepo.ClientID%>').val() == "almc") {
                    var newWindow = window.open("../reporte/impresion.aspx?rpt=almc&idPedido=" + $("#" + '<%= HFIDPedido.ClientID %>').val(), '', "width=800, height=1000");
                    newWindow.blur();
                    window.focus()
                    return true
                }
            })

            //SIGNOS DE EXCLAMACION EN BOTONES SEGUN TAREAS PENDIENTES
            if ($("#" + '<%= HFExIcon.ClientID %>').val() == "enviarProd") {
                $("#spBtnEnviarProd").addClass("glyphicon-exclamation-sign")
                $("#spLblPend").addClass("glyphicon-exclamation-sign")

            } else if ($("#" + '<%= HFExIcon.ClientID %>').val() == "prod") {
                $("#spBtnProd").addClass("glyphicon-exclamation-sign")
                $("#spLblPend").addClass("glyphicon-exclamation-sign")
            
            } else if ($("#" + '<%= HFExIcon.ClientID %>').val() == "depo"){
                $("#spBtnDepo").addClass("glyphicon-exclamation-sign")
                $("#spLblPend").addClass("glyphicon-exclamation-sign")

            } else if ($("#" + '<%= HFExIcon.ClientID %>').val() == "prod-depo") {
                $("#spBtnProd").addClass("glyphicon-exclamation-sign")
                $("#spBtnDepo").addClass("glyphicon-exclamation-sign")
                $("#spLblPend").addClass("glyphicon-exclamation-sign")
            } else {
                $("#spBtnProd").removeClass("glyphicon-exclamation-sign")
                $("#spBtnDepo").removeClass("glyphicon-exclamation-sign")
                $("#spLblPend").removeClass("glyphicon-exclamation-sign")
            }

            //COLOR DEL PANEL MENSAJE DEPOSITO
            if ($("#" + '<%= HFEstado.ClientID%>').val() >= 3) {
                $("#pnlMsgDepo").removeClass("panel-danger")
                $("#pnlMsgDepo").addClass("panel-success")}
            else{
                $("#pnlMsgDepo").removeClass("panel-success")
                $("#pnlMsgDepo").addClass("panel-danger")
            }

            //ACTIVAR - DESACTIVAR OPCIONES EN EL DROPDOWN IMPRIMIR
            if ($("#" + '<%= HFEstado.ClientID%>').val() >= 2) {
                
                $("#liOrden").removeClass("disabled")
                $("#liEtiqueta").removeClass("disabled")
            }

            if ($("#" + '<%= HFEstado.ClientID%>').val() >= 4){
                $("#liRemito").removeClass("disabled")
                
            }

            if ($("#" + '<%= HFEstado.ClientID%>').val() >= 5){
                $("#btnReImprimir").addClass("disabled")
            }

            if ($("#" + '<%= HFEstado.ClientID%>').val() >= 1 && $("#" + '<%= HFEstado.ClientID%>').val() < 3) {
                $("#liStock").removeClass("disabled")
            }

            //RE-IMPRESION ORDEN DE TRABAJO
            $("#aOrden").click(function () {
                var newWindow = window.open("../reporte/impresion.aspx?rpt=orden&idPedido=" + $("#" + '<%= HFIDPedido.ClientID %>').val(), '', "width=800, height=1000")
                newWindow.blur();
                window.focus()
                console.log("activando remito")
            })

            //RE-IMPRESION REMITO
            $("#aRemito").click(function () {
                var newWindow = window.open("../reporte/impresion.aspx?rpt=remito&idPedido=" + $("#" + '<%= HFIDPedido.ClientID %>').val(), '', "width=800, height=1000")
                newWindow.blur();
                window.focus()
            })
            //APERTURA DE MODAL PARA IMPRIMIR ETIQUETAS DE PRODUCTOS CUBIERTOS CON STOCK INTERNO
            if ($("#" + '<%= HFStock.ClientID %>').val() == "y"){
                $('#mdlImprimirEtiquetaDepo').modal()
            } else if ($("#" + '<%= HFStock.ClientID %>').val() == "r") {
                $('#mdlReImprimirOrden').modal()
            }

            //IMPRESION DE ETIQUETAS PARA STOCK
            $("#btnEtiquetasStock").click(function () {
                var newWindow = window.open("../reporte/impresion.aspx?rpt=stock&idPedido=" + $("#" + '<%= HFIDPedido.ClientID %>').val(), '', "width=800, height=1000")
                newWindow.blur();
                window.focus()
            })
            //IMPRESION ORDEN DE TRABAJO
            $("#btnReImprimirOrden").click(function () {
                var newWindow = window.open("../reporte/impresion.aspx?rpt=orden&idPedido=" + $("#" + '<%= HFIDPedido.ClientID %>').val(), '', "width=800, height=1000")
                newWindow.blur();
                window.focus()
            })

            //IMPRESION ETIQUETA DE DEPOSITO SIMPLE
            var urlEtiquetaSimple

            $("[id*=chkImprimir]").click(function () {

                if (this.checked) {
                    console.log("checkbox checkeado")
                    var $this = $(this);
                    var row = $this.closest('tr');
                    var idPedido = row.find(".hiddencol").html()
                    urlEtiquetaSimple += idPedido + "-"
                    console.log(urlEtiquetaSimple);
                } else {
                    var $this = $(this);
                    var row = $this.closest('tr');
                    var idPedido = row.find(".hiddencol").html()
                    urlEtiquetaSimple = urlEtiquetaSimple.replace(idPedido + "-", "")
                    console.log("checkbox des-checkeado")
                    console.log(urlEtiquetaSimple);
                }
            });

            $("#btnReImprimirEtiquetas").click(function () {
               //recorta el ultimo "-" de la url 
                if (urlEtiquetaSimple.endsWith("-")) {
                    urlEtiquetaSimple = urlEtiquetaSimple.substring(0, urlEtiquetaSimple.length - 1);
                }
                var newWindow = window.open(urlEtiquetaSimple, '', "width=800, height=1000");
                newWindow.blur();
                window.focus()
            })

            $('#mdlImprimir').on('shown.bs.modal', function (e) {
                console.log("PANEL ABIERTO");
                urlEtiquetaSimple = "../reporte/impresion.aspx?rpt=etiquetaSimple&idPedido="
                $("[type=checkbox]").removeAttr('checked');
            })
        })
    </script>
    <div class="page-header">
        <h1 class="text-center">Administracion de Pedidos <br /><small>
        <asp:Label ID="lblSubtitulo" runat="server" Text=""></asp:Label></small></h1>
    </div>
    <div class="row">
        <div id="msg" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HFMsg" runat="server" />
        </div>
    </div>
    <asp:Panel ID="pnlPedidos" runat="server" CssClass="row">
        <div class="form-group">
            <div class="row">
                <div class="col-md-3 col-md-offset-2">
                    <strong>ESTADOS:</strong>
                    <asp:DropDownList ID="DPFiltroEstados" runat="server" DataSourceID="DSestados" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource ID="DSestados" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [estados]"></asp:SqlDataSource>
                </div>
                <div class="col-md-3">
                    <strong>CLIENTES:</strong>
                    <asp:DropDownList ID="DPFiltroClientes" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT [ID], [NOMBRE] FROM [CLIENTES]"></asp:SqlDataSource>
                </div>
                <div class="col-md-2 text-right">
                    <asp:ImageButton ID="btnRefreshNv" runat="server" ImageUrl="~/images/refresh-button-icon.png" ImageAlign="Middle" ToolTip="Refrescar" CssClass="imageButtons img-circle" />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="table-responsive">
                    <asp:GridView ID="grPedidos" runat="server" AutoGenerateColumns="False" DataSourceID="dsNvos" ToolTip="Pedidos en estado RECIBIDO" DataKeyNames="ID" CssClass="table-condensed"><Columns>
                        <asp:BoundField DataField="ID" HeaderText="NRO" SortExpression="ID" />
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" >
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
                    <asp:SqlDataSource ID="dsNvos" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT DISTINCT * FROM [VW_PEDIDOS_EN_CURSO]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlDetalle" CssClass="row" runat="server" Visible="false">
        <!--hidden fields -->
        <!--numero de pedido-->
        <asp:HiddenField ID="HFIDPedido" runat="server" />
        <!--indica activar o desactivar el boton enviar a produccion-->
        <asp:HiddenField ID="HFBtnOrden" runat="server" />
        <!--indica activar o desactivar el boton produccion-->
        <asp:HiddenField ID="HFBtnProd" runat="server" />
        <!--indica activar o desactivar el boton enviar a deposito-->
        <asp:HiddenField ID="HFBtnDepo" runat="server" />
        <!--indica si se va a ejecutar un crystal report-->
        <asp:HiddenField ID="HFCrystal" runat="server" />
        <!--indica donde colocar el glyph-icon de exclamacion-->
        <asp:HiddenField ID="HFExIcon" runat="server" />
        <!--indica si el modal deposito va a mostrar el mensaje almacenar o enviar a cliente-->
        <asp:HiddenField ID="HFDepo" runat="server" Value="almc" />
        <!--id estado del pedido-->
        <asp:HiddenField ID="HFEstado" runat="server"/>
        <!--indica si se acaba de enviar a prod el pedido y si se cubrio parte del pedido con stock-->
        <asp:HiddenField ID="HFStock" runat="server"/>
        <div class="row">
            <!--botones grupo -->
            <div class="btn-group" role="group" aria-label="...">
                <asp:Button ID="btnVolver" runat="server" Text="Volver" />
                <button id="btnEnviarProd" class="btn btn-primary" type="button" value="" data-toggle="modal" data-target="#enviarProd">
                    Enviar a Produccion <span id="spBtnEnviarProd" class="glyphicon" aria-hidden="true"></span>
                </button>
                <button id="btnProd" class="btn btn-primary" type="button" value="" data-toggle="modal" data-target="#mdlProd">
                    Produccion <span id="spBtnProd" class="glyphicon" aria-hidden="true"></span>
                </button>
                 <button id="btnDepo" class="btn btn-primary" type="button" value="" data-toggle="modal" data-target="#mdlDepo">
                    Deposito <span id="spBtnDepo" class="glyphicon" aria-hidden="true"></span>
                </button>
                <div class="btn-group">
                  <button id="btnReImprimir" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Opciones <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu">
                    <li id="liOrden" class="disabled"><a id="aOrden" href="#">Imprimir Orden De Trabajo</a></li>
                    <li id="liEtiqueta" class="disabled"><a id="aEtiqueta" href="#mdlImprimir" data-toggle="modal">Imprimir Etiqueta De Deposito</a></li>
                    <li id="liRemito" class="disabled"><a id="aRemito" href="#">Imprimir Remito</a></li>
                    <li role="separator" class="divider"></li>
                    <li id="liStock" class="disabled"><a id="aStock" href="#mdlCambiarStock" data-toggle="modal">Cambiar Uso De Stock Existente</a></li>
                  </ul>
                </div>
                <asp:Button ID="btnRefrescar" runat="server" Text="Refrescar" />
            </div>
        </div>
        <div class="row">
            <br />
            <div class="table-responsive">
                <!--tabla detalle-->
                <asp:GridView ID="grDetalle" runat="server" AutoGenerateColumns="False" ToolTip="Detalle pedido" CssClass="table">
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                        <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                        <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                        <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                        <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                        <asp:BoundField DataField="MANO" HeaderText="MANO" />
                        <asp:BoundField DataField="CANT" HeaderText="CANT" >
                        <ControlStyle Font-Bold="True" />
                        <ItemStyle Font-Bold="True" CssClass="numCol" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <!--acordeon-->
            <div class="panel-group" id="accordion">
                <!--panel detalle-->
                <div class="panel panel-default panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#detalle">Detalle Del Pedido & Tareas Pendientes</a>
                        </h4>
                    </div>
                    <div id="detalle" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <h5>Numero: <small><asp:Label ID="lblnroPedidoDet" runat="server" Text=""></asp:Label></small></h5>
                            <h5>Cliente: <small><asp:Label ID="lblClienteDet" runat="server" Text=""></asp:Label></small></h5>
                            <h5>Estado: <small><asp:Label ID="lblEstadoDet" runat="server" Text=""></asp:Label></small></h5>
                            <h5>Cantidad: <small><asp:Label ID="lblCantDet" runat="server" Text=""></asp:Label></small></h5>
                            <h5>Recibido: <small><asp:Label ID="lblRecibidoDet" runat="server" Text=""></asp:Label></small></h5>
                            <h5>Modificado: <small><asp:Label ID="lblModificadoDet" runat="server" Text=""></asp:Label></small></h5>
                            <h5><strong>Pendientes: <span id="spLblPend" class="glyphicon" aria-hidden="true"></span></strong>
                                <asp:BulletedList ID="bltPendientes" runat="server" BulletStyle="Square"></asp:BulletedList>
                                <h5></h5>
                            </h5>
                        </div>
                    </div>
                </div>
                <!--panel deposito-->
                <div class="panel panel-default panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#deposito">
                Deposito & Produccion</a>
                </h4>
            </div>
            <div id="deposito" class="panel-collapse collapse">
                <div class="panel-body">
                    <div class="table-responsive">
                        <asp:GridView ID="grDeposito" runat="server" AutoGenerateColumns="False" ToolTip="Detalle pedido" CssClass="table">
                            <Columns>
                                <asp:TemplateField HeaderText="#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                                <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                                <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                                <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                                <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                                <asp:BoundField DataField="MANO" HeaderText="MANO" />
                                <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" />
                                <asp:BoundField DataField="CANT" HeaderText="CANT" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="STOCK" HeaderText="DE STOCK" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="P_FAB" HeaderText="PARA FABRICAR" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ENSAMBLADAS" HeaderText="TERMINADAS" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DEPOSITO" HeaderText="EN DEPOSITO" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="P_ALM" HeaderText="POR ALMACENAR" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            </div>
                <!--panel stock-->
                <div class="panel panel-default panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#stock">
                Stock Disponible</a>
                </h4>
            </div>
            <div id="stock" class="panel-collapse collapse">
                <div class="panel-body">
                    <div class="table-responsive">
                        <asp:GridView ID="grStock" runat="server" AutoGenerateColumns="False" ToolTip="Detalle pedido" CssClass="table-bordered">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                            <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                            <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                            <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                            <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                            <asp:BoundField DataField="MANO" HeaderText="MANO" />
                            <asp:BoundField DataField="STOCK_PROD" HeaderText="STOCK DISPONIBLE" >
                            <ControlStyle Font-Bold="True" />
                            <ItemStyle Font-Bold="True" CssClass="numCol" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
                </div>
            </div>
            </div>
                <!--panel materiales-->
                <div id="pnlMat" class="panel panel-default panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#materiales">
                Materiales</a>
                </h4>
            </div>
            <div id="materiales" class="panel-collapse collapse">
                <div class="panel-body">
                    <asp:HiddenField ID="HFMat" runat="server" />
                    <asp:GridView ID="grMateriales" runat="server" ToolTip="Despiece" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="ID_PIEZA" HeaderText="CODIGO" />
                            <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" />
                            <asp:BoundField DataField="CONSUMO" HeaderText="CONSUMO">
                            <ItemStyle CssClass="numCol" />
                            </asp:BoundField>
                            <asp:BoundField DataField="STOCK_DISPONIBLE" HeaderText="DISPONIBLE">
                            <ItemStyle CssClass="numCol" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FALTANTE" HeaderText="FALTANTE">
                            <ItemStyle CssClass="numCol" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            </div>
                <!--panel registro-->
                <div class="panel panel-default panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#log">Registro De Cambios</a>
                    </h4>
                </div>
                <div id="log" class="panel-collapse collapse">
                    <div class="panel-body">
                        <button class="btn btn-primary" data-target="#mdlRegistro" data-toggle="modal" type="button">
                            <span class="glyphicon glyphicon-list-alt"></span> Mostrar Registro
                        </button>
                    </div>
                </div>
            </div>
            </div>  
        </div>
    </asp:Panel>
    <!--MODAL ENVIAR A PRODUCCION-->
    <div class="modal fade" id="enviarProd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Enviar Pedido a Produccion</h4>
          </div>
          <div class="modal-body">
            <div  class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Desea Utilizar Stock existente?</h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                      <asp:GridView ID="grEnviarProd" runat="server" AutoGenerateColumns="False" ToolTip="Detalles del Pedido" DataKeyNames="ID_ITEM">
                            <Columns>
                                <asp:TemplateField HeaderText="#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="LINEA" DataField="LINEA" />
                                <asp:BoundField HeaderText="MADERA" DataField="MADERA" />
                                <asp:BoundField HeaderText="HOJA" DataField="HOJA" />
                                <asp:BoundField HeaderText="MARCO" DataField="MARCO" />
                                <asp:BoundField HeaderText="CHAPA" DataField="CHAPA" />
                                <asp:BoundField HeaderText="MANO" DataField="MANO" />
                                <asp:BoundField HeaderText="CANT" DataField="CANT" >
                                <ItemStyle CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="STOCK DISP" DataField="STOCK_PROD" >
                                <ItemStyle CssClass="numCol" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="USAR STOCK">
                                    <ItemTemplate>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtStockRow" runat="server" ValidationGroup="vgStock" ToolTip="Seleccione cuantas puertas cubrir con stock existente" CssClass="form-control"></asp:TextBox>
                                            <asp:RangeValidator ID="rvStockNvo" runat="server" ControlToValidate="txtStockRow" ErrorMessage="No puede superar Stock o Cantidad" ForeColor="Red" MinimumValue="0" ValidationGroup="vgStock" Type="Integer" MaximumValue="0" Text="0">*</asp:RangeValidator>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ID_ITEM" HeaderText="ID_ITEM" SortExpression="ID_ITEM" >
                                    <ControlStyle CssClass="hiddencol" />
                                    <FooterStyle CssClass="hiddencol" />
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:ValidationSummary ID="vsNvos" runat="server" ValidationGroup="vgStock" DisplayMode="List" ForeColor="Red" />
                    </div>
                </div>
            </div>
            <div id="pnlMatOrden" class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Materiales</h3>
                </div>
                <div class="panel-body">
                    <asp:Label ID="lblMatModalOrden" runat="server"></asp:Label>
                    <asp:Button ID="btnImprimirCompra" runat="server" Text="Imprimir Orden De Compra" />
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" ValidationGroup="vgStock" />
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
    <!--MODAL REGISTRO HISTORICO-->
    <div class="modal fade" id="mdlRegistro" tabindex="-1" role="dialog" aria-labelledby="registroLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="registroLabel">Registro Actividad</h4>
          </div>
          <div class="modal-body">
            <div class="table-responsive">
                <asp:GridView ID="grLog" runat="server"></asp:GridView>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
    <!--MODAL PRODUCCION-->
    <div class="modal fade" id="mdlProd" tabindex="-1" role="dialog" aria-labelledby="prodLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="prodLabel">Estado De Produccion</h4>
          </div>
          <div class="modal-body">
              <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Actualice aqui la cantidad de productos terminados</h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                <asp:GridView ID="grEnCurso" runat="server" AutoGenerateColumns="False" ToolTip="Detalle pedido" DataKeyNames="ITEM">
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                            <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                            <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                            <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                            <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                            <asp:BoundField DataField="MANO" HeaderText="MANO" />
                            <asp:BoundField DataField="CANT" HeaderText="CANT" >
                            <ControlStyle Font-Bold="True" />
                            <ItemStyle Font-Bold="True" CssClass="numCol" />
                            </asp:BoundField>
                            <asp:BoundField DataField="STOCK" HeaderText="DE STOCK" >
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle Font-Bold="True" CssClass="numCol" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="TERMINADAS">
                                <ItemTemplate>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEnsambladas" runat="server" Text='<%# Bind("ENSAMBLADOS") %>' ToolTip="Puertas terminadas" CssClass="form-control"></asp:TextBox>
                                        <asp:RangeValidator ID="rvEnsambladas" runat="server" ControlToValidate="txtEnsambladas" MinimumValue="0" MaximumValue='<%#Eval("CANT") - Eval("STOCK") %>' ErrorMessage="El Maximo no puede ser mayor a CANT - STOCK" ForeColor="Red" ValidationGroup="vgEnCurso" Type="Integer">*</asp:RangeValidator>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ITEM" HeaderText="ITEM" SortExpression="ITEM" >
                                <ControlStyle CssClass="hiddencol" />
                                <FooterStyle CssClass="hiddencol" />
                                <HeaderStyle CssClass="hiddencol" />
                                <ItemStyle CssClass="hiddencol" />
                            </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ValidationSummary ID="vsEnCurso" runat="server" DisplayMode="List" ForeColor="Red" ValidationGroup="vgEnCurso"/>
            </div>
                </div>
            </div>
          </div>
          <div class="modal-footer">
                <asp:Button ID="btnActualizarProd" runat="server" Text="Actualizar" ValidationGroup="vgEnCurso" />
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
    <!--MODAL DEPOSITO-->
    <div class="modal fade" id="mdlDepo" tabindex="-1" role="dialog" aria-labelledby="lblDepo">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="lblDepo">Deposito</h4>
          </div>
          <div class="modal-body">
              <!--PANEL RECIBIR EN DEPOSITO-->
                <div  class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Productos pendientes de ser almacenados en deposito</h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                      <asp:GridView ID="grAlmc" runat="server" AutoGenerateColumns="False" ToolTip="Detalles del Pedido" DataKeyNames="ID_ITEM">
                            <Columns>
                                <asp:TemplateField HeaderText="#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="LINEA" DataField="LINEA" />
                                <asp:BoundField HeaderText="MADERA" DataField="MADERA" />
                                <asp:BoundField HeaderText="HOJA" DataField="HOJA" />
                                <asp:BoundField HeaderText="MARCO" DataField="MARCO" />
                                <asp:BoundField HeaderText="CHAPA" DataField="CHAPA" />
                                <asp:BoundField HeaderText="MANO" DataField="MANO" />
                                <asp:BoundField HeaderText="EN DEPOSITO" DataField="DEPOSITO" >
                                <ItemStyle CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="P/ALMACENAR" DataField="P_ALM" >
                                <ItemStyle CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ID_ITEM" HeaderText="ID_ITEM" SortExpression="ID_ITEM" >
                                    <ControlStyle CssClass="hiddencol" />
                                    <FooterStyle CssClass="hiddencol" />
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
              <!-- PANEL MENSAJE DE DEPOSITO-->
                <div id="pnlMsgDepo" class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">Envio a Cliente</h3>
                </div>
                <div class="panel-body">
                    <asp:Label ID="lblModalDepo" Text="El Pedido NO esta listo para ser enviado" runat="server"></asp:Label>
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnAccionDepo" runat="server" Text="Almacenar" />
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
    <!--MODAL IMPRIMIR ETIQUETA UNICA-->
    <div class="modal fade" id="mdlImprimir" tabindex="-1" role="dialog" aria-labelledby="registroLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="ImprimirLabel">Imprimir Etiquetas de Deposito</h4>
          </div>
          <div class="modal-body">
              <!--PANEL GRILLA IMPRIMIR ETIQUETA DEPOSITO UNICA-->
              <div id="pnlGrillaImprimir" class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Para que items desea imprimir etiquetas?</h3>
                </div>
                <div class="panel-body">
                  <div class="table-responsive">
                <asp:GridView ID="grImprimir" runat="server" AutoGenerateColumns="False" ToolTip="Detalle pedido" CssClass="table">
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                        <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                        <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                        <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                        <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                        <asp:BoundField DataField="MANO" HeaderText="MANO" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <input id="chkImprimir" type="checkbox" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_ITEM" HeaderText="ID_ITEM" SortExpression="ID_ITEM" >
                            <ControlStyle CssClass="hiddencol" />
                            <FooterStyle CssClass="hiddencol" />
                            <HeaderStyle CssClass="hiddencol" />
                            <ItemStyle CssClass="hiddencol" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>  
                </div>
            </div>
          </div>
          <div class="modal-footer">
              <button id="btnReImprimirEtiquetas" type="button" class="btn btn-primary" data-dismiss="modal">Imprimir</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
    <!--MODAL IMPRIMIR ETIQUETA DE DEPOSITO PARA STOCK -->
    <div class="modal fade" id="mdlImprimirEtiquetaDepo" tabindex="-1" role="dialog" aria-labelledby="lblDepo">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="lblImprimirEtiquetaDepo">Se cubrio parte del pedido con stock interno</h4>
          </div>
          <div class="modal-body">
              <div id="pnlEtiquetasStock" class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Desea Imprimir etiquetas de deposito para estos items ahora?</h3>
                </div>
                <div class="panel-body">
                  <div class="table-responsive">
                <asp:GridView ID="grEtiquetasStock" runat="server" AutoGenerateColumns="False" CssClass="table">
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                        <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                        <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                        <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                        <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                        <asp:BoundField DataField="MANO" HeaderText="MANO" />
                        <asp:BoundField DataField="STOCK" HeaderText="CANTIDAD ETIQUETAS">
                            <ItemStyle CssClass="numCol" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>  
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <button id="btnEtiquetasStock" type="button" class="btn btn-primary" data-dismiss="modal">Si</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
          </div>
        </div>
      </div>
    </div>
    <!--MODAL CAMBIAR STOCK -->
    <div class="modal fade" id="mdlCambiarStock" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="lblCambiarStock">Cambiar Uso De Stock Existente</h4>
          </div>
          <div class="modal-body">
            <div  class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Cuantos Productos Desea Cubrir con Stock?</h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                      <asp:GridView ID="grCambiarStock" runat="server" AutoGenerateColumns="False" ToolTip="Detalles del Pedido" DataKeyNames="ID_ITEM">
                            <Columns>
                                <asp:TemplateField HeaderText="#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="LINEA" DataField="LINEA" />
                                <asp:BoundField HeaderText="MADERA" DataField="MADERA" />
                                <asp:BoundField HeaderText="HOJA" DataField="HOJA" />
                                <asp:BoundField HeaderText="MARCO" DataField="MARCO" />
                                <asp:BoundField HeaderText="CHAPA" DataField="CHAPA" />
                                <asp:BoundField HeaderText="MANO" DataField="MANO" />
                                <asp:BoundField HeaderText="CANT" DataField="CANT" >
                                <ItemStyle CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="STOCK DISP" DataField="STOCK_PROD" >
                                <ItemStyle CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ENSAMBLADAS" HeaderText="TERMINADAS" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="STOCK" HeaderText="CUBIERTO CON STOCK" >
                                <ControlStyle Font-Bold="True" />
                                <ItemStyle Font-Bold="True" CssClass="numCol" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="USAR STOCK">
                                    <ItemTemplate>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtStockRow" runat="server" ValidationGroup="vgCambiarStock" ToolTip="Seleccione cuantas puertas cubrir con stock existente" CssClass="form-control"></asp:TextBox>
                                            <asp:RangeValidator ID="rvStockNvo" runat="server" ControlToValidate="txtStockRow" ErrorMessage="No puede superar Stock o Cantidad" ForeColor="Red" MinimumValue="0" ValidationGroup="vgCambiarStock" Type="Integer" MaximumValue="0" Text="0">*</asp:RangeValidator>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ID_ITEM" HeaderText="ID_ITEM" SortExpression="ID_ITEM" >
                                    <ControlStyle CssClass="hiddencol" />
                                    <FooterStyle CssClass="hiddencol" />
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="vgCambiarStock" DisplayMode="List" ForeColor="Red" />
                    </div>
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnCambiarStock" runat="server" Text="Cambiar" ValidationGroup="vgCambiarStock" />
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
    <!-- MODAL RE IMPRIMIR ORDENES -->
    <div id="mdlReImprimirOrden" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Cambio Los Productos Cubiertos Con Stock Existente</h4>
      </div>
      <div class="modal-body">
        <p>Desea re-imprimir la orden de trabajo ahora?</p>
      </div>
      <div class="modal-footer">
        <button id="btnReImprimirOrden" type="button" class="btn btn-primary" data-dismiss="modal">Si</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</asp:Content>
