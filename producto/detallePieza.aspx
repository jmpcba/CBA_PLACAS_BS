<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="detallePieza.aspx.vb" Inherits="CBA_PLACAS_BS.detallePieza" theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))

            //botondeshacer
            if ($("#" + '<%= HFEliminar.ClientID %>').val() == 0) {
                $("#" + '<%= aUndo.ClientID %>').hide()
            } else {
                $("#" + '<%= aUndo.ClientID %>').show()
            }
        })
    </script>
    <asp:HiddenField ID="HFEliminar" runat="server" Value="0" />
    <div class="page-header">
        <h1 class="text-center">Administrar Pieza<br /><small>
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
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Modificar
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="#" data-toggle="modal" data-target="#mdlModDetalle">Modificar Detalles</a></li>
                  <li><a href="#" data-toggle="modal" data-target="#mdlModStock">Modificar Stock</a></li>
                </ul>
            </div>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mdlConfEliminar">
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
				<a data-toggle="collapse" data-parent="#accordion" href="#detalle">Detalle</a>
			</h4>
		</div>
		<div id="detalle" class="panel-collapse collapse in">
			<div class="panel-body">
				<div class="row">
                <div class="col-md-3">
                    <strong>Codigo: </strong><asp:Label ID="lblCodigo" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-3">
                    <strong>Nombre: </strong><asp:Label ID="lblNombre" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-3">
                    <strong>Stock: </strong><asp:Label ID="lblStock" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-3">
                    <strong>Unidad: </strong><asp:Label ID="lblUnidad" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
			</div>
		</div>
	</div>
	<!--DESPIECE-->
	<div class="panel panel-default panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#produccion">Consumo</a>
			</h4>
		</div>
		<div id="produccion" class="panel-collapse collapse">
			<div class="panel-body">
				<div class="row">
                    <div class="col-md-4">
                        <button class="btn btn-primary" data-target="#mdlPedidos" data-toggle="modal" type="button">
				            <span class="glyphicon glyphicon-list-alt"></span> Mostrar Productos
			            </button>
                    </div>
                    <div class="col-md-8">
                        <p class="pull-left">Se mostraran los productos en que se utiliza esta pieza y el consumo</p>
                    </div>
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
</div>
    <br />
    <!--modal modificar-->
    <div class="modal fade" id="mdlModStock" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Modificar Stock</h4>
          </div>
          <div class="modal-body form-group">
            <div class="row">
            <div class="col-md-3"><strong>Stock</strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Ingrese valor para Stock" Text="*" CssClass="validators" ControlToValidate="txtStock" ValidationGroup="VGMod"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese un valor valido" ValidationExpression="(\d+|\d*,\d*)+" CssClass="validators" ValidationGroup="VGMod" ControlToValidate="txtStock" Text="*"></asp:RegularExpressionValidator>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblModUnidad" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
              <br />
              <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validators" ValidationGroup="VGMod" />
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnGuardarStock" runat="server" Text="Guardar Cambios" ValidationGroup="VGMod" />
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
    <!--MODAL MODIFICAR DETALLES-->
    <div class="modal fade" id="mdlModDetalle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="mdlModDetalleLabel">Modificar Detalle</h4>
          </div>
          <div class="modal-body form-group">
              <div class="row">
                <div class="col-md-3"><strong>Nombre</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese valor para Stock" Text="*" CssClass="validators" ControlToValidate="txtStock" ValidationGroup="VGMod"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese un valor valido" ValidationExpression="(\d+|\d*,\d*)+" CssClass="validators" ValidationGroup="VGMod" ControlToValidate="txtStock" Text="*"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtModNombre" runat="server"></asp:TextBox>
                </div>
            </div>
              <br />
              <div class="row">
                <div class="col-md-3"><strong>Unidad</strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese valor para Stock" Text="*" CssClass="validators" ControlToValidate="txtStock" ValidationGroup="VGMod"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Ingrese un valor valido" ValidationExpression="(\d+|\d*,\d*)+" CssClass="validators" ValidationGroup="VGMod" ControlToValidate="txtStock" Text="*"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtModUnidad" runat="server"></asp:TextBox>
                </div>
            </div>
          <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="validators" ValidationGroup="VGMod" />
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnModDet" runat="server" Text="Guardar Cambios" ValidationGroup="VGMod" />
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
                    <asp:Button ID="btnEliminarPieza" runat="server" Text="Si" />
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
                                <asp:TextBox ID="txtConsumo" runat="server"></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle CssClass="numCols" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="UNIDAD" HeaderText="UNIDAD" />
                    </Columns>
                </asp:GridView>
            </div>
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnModMat" runat="server" Text="Guardar" />
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
    <!--MODAL PRODUCTOS-->
    <div class="modal fade" id="mdlPedidos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="lblPedidos">Productos que utilizan esta pieza</h4>
          </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                  <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                        <ProgressTemplate><div class="validators">Cargando</div></ProgressTemplate>
                    </asp:UpdateProgress>
                  <div class="modal-body form-group">
                      <div class="table-responsive">
					    <asp:GridView ID="grProductos" runat="server" ToolTip="Despiece" AutoGenerateColumns="False" DataKeyNames="ID">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID_PROD" SortExpression="ID" >
                                    <ControlStyle CssClass="hiddencol" />
                                    <FooterStyle CssClass="hiddencol" />
                                    <HeaderStyle CssClass="hiddencol" />
                                    <ItemStyle CssClass="hiddencol" />
                                </asp:BoundField>
                                <asp:BoundField DataField="COD" HeaderText="CODIGO PRODUCTO" />
                                <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                                <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                                <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                                <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                                <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                                <asp:BoundField DataField="MANO" HeaderText="MANO" />
                                <asp:BoundField DataField="CONSUMO" HeaderText="CONSUMO"  DataFormatString="{0:F2}" >
                                <ItemStyle CssClass="numCol" />
                                </asp:BoundField>
                                <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                                    <ControlStyle CssClass="imageButtons" />
                                </asp:CommandField>
                            </Columns>
                        </asp:GridView>
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
</asp:Content>
