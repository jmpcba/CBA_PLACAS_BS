<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="detalleProducto.aspx.vb" Inherits="CBA_PLACAS_BS.modificarProducto" theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))

            //IMAGEN
            if ($("#" + '<%= HFidProducto.ClientID %>').val() != "") {
                var idProducto = $("#" + '<%= HFidProducto.ClientID %>').val()
                $("#imgCroquis").attr("src", "../images/productos/" + idProducto + ".jpg")
            } else {
                $("#imgCroquis").attr("src", "../images/productos/general.jpg")
            }
            

            //botondeshacer
            if ($("#" + '<%= HFEliminar.ClientID %>').val() == 0) {
                $("#" + '<%= aUndo.ClientID %>').hide()
            } else {
                $("#" + '<%= aUndo.ClientID %>').show()
                var controles = [$("#btnMdlMod"), $("#btnMdlMat"), $("#btnMdlEl")]
                inHabilitarControles(controles)
            }

            $('#mdlPedidos').on('show.bs.modal', function (event) {
                $("#" + '<%= btnUPHidden.ClientID %>').click()
            })

            $('#mdlHistorial').on('show.bs.modal', function (event) {
                $("#" + '<%= btnHistorial.ClientID %>').click()
            })


            if ($("input[id$=HFRol]").val() == "ENCARGADO" || $("input[id$=HFRol]").val() == "GERENCIA") {
                var controles = [$("#btnMdlMod"), $("#btnMdlMat"), $("#btnMdlEl")]
                inHabilitarControles(controles)
            }

            //validacion
            $("td > input").keyup(function (event) {
                var val = $(this).val()
                var td = $(this).parent("td")
                var div = $(this).siblings("div")
                if (isNaN(val)){
                    td.addClass("has-error")
                    div.show()
                    $("#" + '<%= btnModMat.ClientID %>').attr("disabled", true)
                }else{
                    td.removeClass("has-error")
                    div.hide()
                    $("#" + '<%= btnModMat.ClientID %>').attr("disabled", false)
                }
            })

            //subir imagen
            $("#aImg").click(function () {
                 console.log("click en boton")
                 $("#" + '<%= FLImagen.ClientID %>').click()
            })

            $("#" + '<%= FLImagen.ClientID %>').change(function () {
                console.log("abrir el modal")
                 $('#mdlImagen').modal('show')
            })

        })

    </script>
    <asp:HiddenField ID="HFEliminar" runat="server" Value="0" />
    <asp:HiddenField ID="HFidProducto" runat="server" Value="" />
    <asp:FileUpload style="display:none" ID="FLImagen" runat="server" />
    <div class="page-header">
        <h1 class="text-center">Administrar Producto<br /><small>
        <asp:Label ID="lblSubtitulo" runat="server" Text=""></asp:Label></small></h1>
    </div>
    <div class="row">
        <div id="msg" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label><asp:LinkButton ID="aUndo" runat="server"> Deshacer</asp:LinkButton>
            <asp:HiddenField ID="HFMsg" runat="server" />
        </div>
    </div>
    <div class="row">
        <!--botones grupo -->
        <div class="btn-group" role="group" aria-label="...">
            <asp:Button ID="btnVolver" runat="server" Text="Volver" />
            <div class="btn-group">
                  <button id="btnMdlMod" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Modificar <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu">
                    <li ><a href="#" data-target="#mdlDetalle" data-toggle="modal">Detalle</a></li>
                    <li ><a href="#" data-target="#mdlMateriales" data-toggle="modal">Materiales</a></li>
                    <li ><a id="aImg" href="#">Imagen</a></li>
                  </ul>
                </div>
            <button id="btnMdlEl" type="button" class="btn btn-primary" data-toggle="modal" data-target="#mdlConfEliminar">
                Eliminar</button>
            <asp:Button ID="btnRefrescarDetalle" runat="server" Text="Refrescar" />
        </div>
    </div>
    <hr />
    <div class="panel-group" id="accordion">
	<!--panel detalle-->
	<div class="panel panel-default panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#detalle">Detalle Del Producto</a>
			</h4>
		</div>
		<div id="detalle" class="panel-collapse collapse in">
			<div class="panel-body">
				<div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="col-md-6">
                                    <strong>Linea: </strong><asp:Label ID="lblLinea" runat="server" Text="Label"></asp:Label><br />
                                    <br />
                                    <strong>Chapa: </strong><asp:Label ID="lblChapa" runat="server" Text="Label"></asp:Label><br />
                                    <br />
                                    <strong>Madera: </strong><asp:Label ID="lblMadera" runat="server" Text="Label"></asp:Label><br />
                                    <br />
                                    <strong>Hoja: </strong><asp:Label ID="lblHoja" runat="server" Text="Label"></asp:Label><br />
                                </div>
                                <div class="col-md-6">
                                    <strong>Marco: </strong><asp:Label ID="lblMarco" runat="server" Text="Label"></asp:Label><br />
                                    <br />
                                    <strong>Mano: </strong><asp:Label ID="lblMano" runat="server" Text="Label"></asp:Label><br />
                                    <br />
                                    <strong>Precio: </strong><asp:Label ID="lblPrecio" runat="server" Text="Label"></asp:Label><br />
                                    <br />
                                    <strong>Stock: </strong><asp:Label ID="lblStock" runat="server" Text="Label"></asp:Label><br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="thumbnail">
                            <img id="imgCroquis" src="" alt="IMAGEN NO DISPONIBLE">
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
	<!--DESPIECE-->
	<div class="panel panel-default panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#produccion">Materiales</a>
			</h4>
		</div>
		<div id="produccion" class="panel-collapse collapse">
			<div class="panel-body">
				<div class="table-responsive">
					<asp:GridView ID="grMateriales" runat="server" ToolTip="Despiece" AutoGenerateColumns="False" DataKeyNames="ID_PIEZA">
                        <Columns>
                            <asp:BoundField DataField="ID_PIEZA" HeaderText="CODIGO" />
                            <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" />
                            <asp:BoundField DataField="CONSUMO" HeaderText="CONSUMO"  DataFormatString="{0:F}" >
                            <ItemStyle CssClass="numCol" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                                <ControlStyle CssClass="imageButtons" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
				</div>
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
			    <button class="btn btn-primary" data-target="#mdlHistorial" data-toggle="modal" type="button">
				    <span class="glyphicon glyphicon-list-alt"></span> Mostrar Registro
			    </button>
		    </div>
	    </div>
    </div>
    <!--HISTORICO DE PEDIDOS-->
    <div class="panel panel-default panel-primary">
	    <div class="panel-heading">
		    <h4 class="panel-title">
			    <a data-toggle="collapse" data-parent="#accordion" href="#pedidos">Pedidos para este producto</a>
		    </h4>
	    </div>
	    <div id="pedidos" class="panel-collapse collapse">
		    <div class="panel-body table-responsive">
                <div class="row">
                    <div class="col-md-4">
                        <button class="btn btn-primary" data-target="#mdlPedidos" data-toggle="modal" type="button">
				            <span class="glyphicon glyphicon-list-alt"></span> Mostrar Pedidos
			            </button>
                    </div>
                    <div class="col-md-8">
                        <p class="pull-left">Se mostraran pedidos en curso para este producto</p>
                    </div>
                </div>
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
            <h4 class="modal-title" id="myModalLabel">Modificar Producto</h4>
          </div>
          <div class="modal-body form-group">
            <div class="row">
                <div class="col-md-3"><strong>Linea</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Seleccione una Linea" Text="*" CssClass="validators" ControlToValidate="DPLinea" ValidationGroup="VGMod"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="DPLinea" runat="server" DataSourceID="DSLinea" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="DSLinea" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [LINEAS]"></asp:SqlDataSource>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Chapa</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Selecione una Chapa" Text="*" CssClass="validators" ControlToValidate="DPChapa" ValidationGroup="VGMod"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="DPChapa" runat="server" DataSourceID="DSChapa" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource ID="DSChapa" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [CHAPAS]"></asp:SqlDataSource>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Madera</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Seleccione un tipo de madera" Text="*" CssClass="validators" ControlToValidate="DPMadera" ValidationGroup="VGMod"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="DPMadera" runat="server" DataSourceID="DSMadera" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource ID="DSMadera" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [MADERAS]"></asp:SqlDataSource>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Hoja</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Seleccione un ancho de hoja" Text="*" CssClass="validators" ControlToValidate="DPHoja" ValidationGroup="VGMod"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="DPHoja" runat="server" DataSourceID="HSHojas" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="HSHojas" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [HOJAS]"></asp:SqlDataSource>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Marco</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Seleccione un ancho de marco" Text="*" CssClass="validators" ControlToValidate="DPMarco" ValidationGroup="VGMod"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="DPMarco" runat="server" DataSourceID="DSMarco" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="DSMarco" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [MARCOS]"></asp:SqlDataSource>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Mano</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Seleccione una Mano" Text="*" CssClass="validators" ControlToValidate="DPMano" ValidationGroup="VGMod"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="DPMano" runat="server" DataSourceID="DSMano" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource ID="DSMano" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [MANOS]"></asp:SqlDataSource>
                </div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><strong>Precio</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Ingrese un precio" Text="*" CssClass="validators" ControlToValidate="txtPrecio" ValidationGroup="VGMod"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese un valor valido" ValidationExpression="(\d+|\d*,\d*)+" CssClass="validators" ValidationGroup="VGMod" ControlToValidate="txtPrecio" Text="*"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
                </div>
            </div><br />
            <div class="row">
            <div class="col-md-3"><strong>Stock</strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Ingrese valor para Stock" Text="*" CssClass="validators" ControlToValidate="txtStock" ValidationGroup="VGMod"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un valor valido" ValidationExpression="(\d+|\d*,\d*)+" CssClass="validators" ValidationGroup="VGMod" ControlToValidate="txtPrecio" Text="*"></asp:RegularExpressionValidator>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
            </div>
        </div>
              <br />
              <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validators" ValidationGroup="VGMod" />
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" ValidationGroup="VGMod" />
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
            <h4 class="modal-title" id="lblHistorial">Registro de Cambios</h4>
          </div>
          <div class="modal-body form-group">
              <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                  <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate><div class="validators">Cargando</div></ProgressTemplate>
                    </asp:UpdateProgress>
                    <div class="table-responsive">
                        <asp:GridView ID="grHistorial" runat="server" AutoGenerateColumns="False" ToolTip="Pedidos en estado RECIBIDO" CssClass="table-condensed">
                            <Columns>
                                <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" DataFormatString="{0:g}"/>
                                <asp:BoundField DataField="CAMBIOS" HeaderText="CAMBIOS" SortExpression="CAMBIOS" />
                                <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" SortExpression="USUARIO" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div style="display:none">
	                    <asp:Button ID="btnHistorial" runat="server" Text="Button" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
    <!--confirmacion eliminar-->
    <div class="modal fade" tabindex="-1" role="dialog" id="mdlConfEliminar">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger"">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Confirme</h4>
                    </div>
                <div class="modal-body">
                        <p>Desea dar de baja este producto? </p>
                    </div>
                <div class="modal-footer">
                    <asp:Button ID="btnEliminarProd" runat="server" Text="Si" />
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#mdlModificarItems" data-dismiss="modal">No</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!--modal modificar materiales-->
    <div class="modal fade" id="mdlMateriales" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="lblMdlMateriales">Modificar Consumo de Materiales</h4>
          </div>
          <div class="modal-body form-group">
            <div class="table-responsive">
                <asp:GridView ID="grModMateriales" runat="server" ToolTip="Despiece" DataKeyNames="ID" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="CODIGO" />
                        <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" />
                        <asp:TemplateField HeaderText="CONSUMO">
                            <ItemTemplate>    
                                <asp:TextBox ID="txtConsumo" runat="server" CssClass="txtConsumo"></asp:TextBox>
                                <div id="msgValidar" class="text-left has-error" style="float:left;padding-left: 10px; width:90%; display:none">
                                    <label class="control-label" for="txtConsumo"> Ingrese un valor numerico</label>
                                </div>
                            </ItemTemplate>
                            <ItemStyle CssClass="numCols" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="UNIDAD" HeaderText="UNIDAD" />
                    </Columns>
                </asp:GridView>
            </div>
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnModMat" runat="server" Text="Guardar" ValidationGroup="vgMat" />
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
    <!--MODAL PEDIDOS-->
    <div class="modal fade" id="mdlPedidos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="lblPedidos">Pedidos en curso que incluyen este producto</h4>
          </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                  <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                        <ProgressTemplate><div class="validators">Cargando</div></ProgressTemplate>
                    </asp:UpdateProgress>
                  <div class="modal-body form-group">
                    <div class="table-responsive">
                        <asp:GridView ID="grPedidos" runat="server" AutoGenerateColumns="False" ToolTip="Pedidos en estado RECIBIDO" DataKeyNames="ID" CssClass="table-condensed">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="NRO" SortExpression="ID" />
                                <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" >
                                <ItemStyle CssClass="numCol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                                <asp:BoundField DataField="FECHA_RECIBIDO" HeaderText="Recibido" SortExpression="FECHA_RECIBIDO" DataFormatString="{0:d}" />
                                <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                                    <ControlStyle CssClass="imageButtons" />
                                </asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div style="display:none">
	                    <asp:Button ID="btnUPHidden" runat="server" Text="Button" />
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                  </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
      </div>
    </div>
<!--confirmacion cambio imagen-->
    <div class="modal fade" tabindex="-1" role="dialog" id="mdlImagen">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger"">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Confirme</h4>
                    </div>
                <div class="modal-body">
                        <p>Desea cambiar la imagen? </p>
                    </div>
                <div class="modal-footer">
                    <asp:Button ID="btncambiarImagen" runat="server" Text="Si" />
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#mdlModificarItems" data-dismiss="modal">No</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</asp:Content>
