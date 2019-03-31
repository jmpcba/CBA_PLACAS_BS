<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="nuevoProducto.aspx.vb" Inherits="CBA_PLACAS_BS.producto1" theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var dropDowns = [
                $("#" + '<%= DPFiltroLinea.ClientID %>'),
                $("#" + '<%= DPFiltroChapa.ClientID %>'),
                $("#" + '<%= DPFiltroMadera.ClientID %>'),
                $("#" + '<%= DPFiltroHoja.ClientID %>'),
                $("#" + '<%= DPFiltroMarco.ClientID %>'),
                $("#" + '<%= DPFiltroMano.ClientID %>')
            ]

            //INICIAR CONTROLES
            console.log("inicio dropdowns")
            iniciarDropDowns(dropDowns)
            iniciarTextBoxes([$("#" + '<%= txtPrecio.ClientID %>')])
            iniciarGrillaMateriales()

            //VALIDAR CONTROLES
            validarCaracteristicas()
            validarMateriales()
            

            //iniciar barra de estado
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))
            

            //LIMPIAR SELECCION DE CARACTERISTICAS
            $("#btnLimpiar").click(function () {
                console.log("apretado")
                iniciarDropDowns(dropDowns)
                iniciarTextBoxes([$("#" + '<%= txtPrecio.ClientID %>')])
                validarCaracteristicas()
            })

            //EVENTO CAMBIO DE DROPDOWN
            $("select").change(function () {
                validarCaracteristicas()
                console.log("cambio en dropdown")
            })

            //EVENTO CAMBIO EN PRECIO
            $("#" + '<%= txtPrecio.ClientID %>').keyup(function () {
                validarCaracteristicas()
                validarMateriales()
                $("#" + '<%= lblPrecio.ClientID %>').text($("#" + '<%= txtPrecio.ClientID %>').val())
            })

            //EVENTO CAMBIO EN MATERIAL
            $("td > input").keyup(function () {
                var colores = ["#EFF3FB", "White"]
                var i = 0
                validarMateriales()
                $("#tablaResumenMateriales").find("tr:gt(0)").remove()
                
                $("td > input").each(function () {

                    if (i == 2) {
                        i = 0
                    }

                    if ($(this).val() != "") {
                        var consumo = $(this).val()
                        var rowHtml = $(this).closest("tr").clone().html()
                        rowHtml = rowHtml.replace(/<input.*>/, consumo)
                        $('#tablaResumenMateriales tbody').append('<tr style="background-color:'+ colores[i] + ';" align="left">' + rowHtml + '</tr>')
                        i++
                    }
                })
            })

            //VALIDACIONES AL ABRIR UN PANEL
            $('.collapse').on('show.bs.collapse', function () {
                validarCaracteristicas()
                validarMateriales()
            })

            //LLENAR RESUMEN
            $("#" + '<%= DPFiltroLinea.ClientID %>').change(function () {
                $("#" + '<%= lblLinea.ClientID %>').text($("#" + '<%= DPFiltroLinea.ClientID %>' + ' option:selected').text())
            })

            $("#" + '<%= DPFiltroChapa.ClientID %>').change(function () {
                $("#" + '<%= lblChapa.ClientID %>').text($("#" + '<%= DPFiltroChapa.ClientID %>' + ' option:selected').text())
            })

            $("#" + '<%= DPFiltroMadera.ClientID %>').change(function () {
                $("#" + '<%= lblMadera.ClientID %>').text($("#" + '<%= DPFiltroMadera.ClientID %>' + ' option:selected').text())
            })

            $("#" + '<%= DPFiltroHoja.ClientID %>').change(function () {
                $("#" + '<%= lblHoja.ClientID %>').text($("#" + '<%= DPFiltroHoja.ClientID %>' + ' option:selected').text())
            })

            $("#" + '<%= DPFiltroMarco.ClientID %>').change(function () {
                $("#" + '<%= lblMarco.ClientID %>').text($("#" + '<%= DPFiltroMarco.ClientID %>' + ' option:selected').text())
            })

            $("#" + '<%= DPFiltroMano.ClientID %>').change(function () {
                $("#" + '<%= lblMano.ClientID %>').text($("#" + '<%= DPFiltroMano.ClientID %>' + ' option:selected').text())
            })

            //VALIDAR SI SE PUEDE PASAR DE CARACTERISTICAS AL SIGUIENTE PANEL
            function validarCaracteristicas() {

                $("select").each(function () {
                    if ($(this).val() && $("#" + '<%= txtPrecio.ClientID %>').val() != "") {
                        $("#aMateriales").prop("disabled", false);
                        $("#btnSigCaracteristicas").prop("disabled", false);
                        $("#headingMateriales").addClass("panel-primary")

                    } else {
                        $("#aMateriales").prop("disabled", true);
                        $("#btnSigCaracteristicas").prop("disabled", true);
                        $("#headingMateriales").removeClass("panel-primary")
                        return false
                    }
                })
            }

            //VALIDAR SI SE PUEDE PASAR DE MATERIALES AL RESUMEN
            function validarMateriales() {
                $("#myTable").find("tr:gt(0)").remove();
                $("td > input").each(function () {
                    if ($(this).val() != "" && $("#" + '<%= txtPrecio.ClientID %>').val() != "") {
                        $("#aResumen").prop("disabled", false);
                        $("#btnSigMateriales").prop("disabled", false);
                        $("#headingResumen").addClass("panel-primary")
                        return false
                    } else {
                        $("#aResumen").prop("disabled", true);
                        $("#btnSigMateriales").prop("disabled", true);
                        $("#headingResumen").removeClass("panel-primary")
                    }
                })
            }

            function iniciarGrillaMateriales() {
                $("td > input").val("")
            }
        })
    </script>
    <div class="page-header">
            <h1 class="text-center">Nuevo Producto<br /><small>
            <asp:Label ID="lblSubtitulo" runat="server" Text=""></asp:Label></small></h1>
        </div>
        <div class="row">
            <div id="msg" class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
                <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
                <asp:HiddenField ID="HFMsg" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div id="headingCaracteristicas" class="panel panel-default panel-primary">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                    <a id="aCaracteristicas" role="button" data-toggle="collapse" data-parent="#accordion" href="#pnlCaracteristicas" aria-expanded="true" aria-controls="collapseOne">
                        Caracteristicas
                    </a>
                    </h4>
                </div>
                <div id="pnlCaracteristicas" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <div class="form-group">
                            <!--INICIO CONTENIDO CARACTERISTICAS-->
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <h4>Caracteristicas del nuevo producto<br /><small>Debe Seleccionar un valor en todos los campos</small></h4><hr />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <strong>LINEA:</strong><br />
                                    <asp:DropDownList ID="DPFiltroLinea" runat="server" DataSourceID="DSLinea" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                                    <asp:SqlDataSource ID="DSLinea" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [LINEAS]"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-4">
                                    <strong>CHAPA:</strong><br />
                                    <asp:DropDownList ID="DPFiltroChapa" runat="server" DataSourceID="DSChapa" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                                    <asp:SqlDataSource ID="DSChapa" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [CHAPAS]"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-4">
                                    <strong>MADERA:</strong><br />
                                    <asp:DropDownList ID="DPFiltroMadera" runat="server" DataSourceID="DSMadera" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                                    <asp:SqlDataSource ID="DSMadera" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [MADERAS]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-4">
                                    <strong>HOJA:</strong><br />
                                    <asp:DropDownList ID="DPFiltroHoja" runat="server" DataSourceID="HSHojas" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                                    <asp:SqlDataSource ID="HSHojas" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [HOJAS]"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-4">
                                    <strong>MARCO:</strong><br />
                                    <asp:DropDownList ID="DPFiltroMarco" runat="server" DataSourceID="DSMarco" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                                    <asp:SqlDataSource ID="DSMarco" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [MARCOS]"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-4">
                                    <strong>MANO:</strong><br />
                                    <asp:DropDownList ID="DPFiltroMano" runat="server" DataSourceID="DSMano" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                                    <asp:SqlDataSource ID="DSMano" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [MANOS]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-4">
                                    <strong>PRECIO:</strong><br />
                                    <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <!--FIN CONTENIDO CARACTERISTICAS-->
                        </div>
                        <input id="btnLimpiar" class="btn btn-primary pull-left" type="button" value="Limpiar Seleccion" />
                        <button id="btnSigCaracteristicas" class="btn btn-primary pull-right" type="button" data-toggle="collapse" data-parent="#accordion" data-target="#pnlMateriales" aria-expanded="false" aria-controls="pnlCaracteristicas">
                        Siguiente</button>                
                    </div><br />
                </div>
                </div>
                <div id="headingMateriales" class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                    <a id="aMateriales" class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#pnlMateriales" aria-expanded="false" aria-controls="pnlMateriales">
                        Materiales
                    </a>
                    </h4>
                </div>
                <div id="pnlMateriales" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">  
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h4 >Materiales que se requieren para fabricar una unidad del producto<br /><small>Ingrese por lo menos un valor en un material</small></h4><hr />
                            </div>
                        </div>                                                                                                                            
                        <div class="table-responsive">
                            <asp:GridView ID="grMateriales" runat="server" ToolTip="Despiece" DataKeyNames="ID" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="CODIGO" />
                                    <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" />
                                    <asp:TemplateField HeaderText="CONSUMO">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtConsumo" runat="server" CssClass="txtConsumo"></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="numCols" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UNIDAD" HeaderText="UNIDAD" />
                                </Columns>
                            </asp:GridView>
                        </div><br />
                        <button class="btn btn-primary pull-left" type="button" data-toggle="collapse" data-parent="#accordion" data-target="#pnlCaracteristicas" aria-expanded="false" aria-controls="pnlMateriales">
                            Anterior</button>
                        <button id="btnSigMateriales" class="btn btn-primary pull-right" type="button" data-toggle="collapse" data-parent="#accordion" data-target="#pnlResumen" aria-expanded="false" aria-controls="pnlPedido">
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
                        <!--INICIO RESUMEN-->
                        <div class="panel panel-success">
                            <div class="panel-heading">CARACTERISTICAS</div>
                            <div class="panel-body">
                                <!--INICIO RESUMEN CARACTERISTICAS-->
                                <div class="row">
                                    <div class="col-md-3">
                                        <strong>LINEA: </strong>
                                        <asp:Label ID="lblLinea" runat="server" Text="Label"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <strong>CHAPA: </strong>
                                        <asp:Label ID="lblChapa" runat="server" Text="Label"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <strong>MADERA: </strong>
                                        <asp:Label ID="lblMadera" runat="server" Text="Label"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <strong>HOJA: </strong>
                                        <asp:Label ID="lblHoja" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-3">
                                        <strong>MARCO :</strong>
                                        <asp:Label ID="lblMarco" runat="server" Text="Label"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <strong>MANO: </strong>
                                        <asp:Label ID="lblMano" runat="server" Text="Label"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <strong>PRECIO: </strong>
                                        <asp:Label ID="lblPrecio" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                                <!--FIN RESUMEN CARACTERISTICAS-->
                            </div>
                        </div><br />
                        <div class="panel panel-success">
                            <div class="panel-heading">MATERIALES</div>
                            <div class="panel-body table-responsive">
                                <!--INICIO RESUMEN MATERIALES-->
                                <table id="tablaResumenMateriales" title="Despiece" class="table-responsive table table-striped table-bordered table-hover table-condensed" id="MainContent_grMateriales" style="color:#333333;border-width:1px;border-style:Solid;border-collapse:collapse;" cellspacing="0" cellpadding="4" align="Center">
                                    <tbody>
                                        <tr style="color:White;background-color:#428BCA;border-color:Black;border-width:2px;border-style:Solid;font-weight:bold;" align="center">
			                                <th scope="col">CODIGO</th>
                                            <th scope="col">NOMBRE</th>
                                            <th scope="col">CONSUMO</th>
                                            <th scope="col">UNIDAD</th>
		                                </tr>
                                    </tbody>
                                </table>
                                <!--FIN RESUMEN MATERIALES-->
                            </div>
                        </div><br />
                        <!--FIN RESUMEN-->
                        <button class="btn btn-primary pull-left" type="button" data-toggle="collapse" data-parent="#accordion" data-target="#pnlMateriales" aria-expanded="false" aria-controls="pnlPedido">
                            Anterior</button>
                        <button class="btn btn-primary pull-right" type="button" data-toggle="modal" data-parent="#accordion" data-target="#mdlConfirmacion" aria-expanded="false" aria-controls="pnlPedido">
                            Enviar
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
                <div class="modal-header bg-danger"">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Confirme</h4>
                    </div>
                <div class="modal-body">
                        <p>Desea guardar este producto?</p>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                    <asp:Button ID="btnEnviar" runat="server" Text="Si" />
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</asp:Content>
