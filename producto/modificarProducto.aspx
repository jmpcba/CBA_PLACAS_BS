<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="modificarProducto.aspx.vb" Inherits="CBA_PLACAS_BS.modificarProducto" theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))
        })
    </script>
    <div class="page-header">
        <h1 class="text-center">Administrar Producto<br /><small>
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
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" />
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
                <div class="col-md-3">
                    <strong>Linea: </strong><asp:Label ID="lblLinea" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-3">
                    <strong>Chapa: </strong><asp:Label ID="lblChapa" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-3">
                    <strong>Madera: </strong><asp:Label ID="lblMadera" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-3">
                    <strong>Hoja: </strong><asp:Label ID="lblHoja" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <strong>Marco: </strong><asp:Label ID="lblMarco" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-3">
                    <strong>Mano: </strong><asp:Label ID="lblMano" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-3">
                    <strong>Precio: </strong><asp:Label ID="lblPrecio" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-3">
                    <strong>Stock: </strong><asp:Label ID="lblStock" runat="server" Text="Label"></asp:Label>
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
			    <button class="btn btn-primary" data-target="#mdlRegistro" data-toggle="modal" type="button">
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
			    <!--historico de pedidos aca-->
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
