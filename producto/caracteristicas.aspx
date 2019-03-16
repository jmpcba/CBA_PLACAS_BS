<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="caracteristicas.aspx.vb" Inherits="CBA_PLACAS_BS.caracteristicas" theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        
        $(document).ready(function () {
            //COMBOS
            var combos = [
                $("#" + '<%= cbModificar.ClientID %>'),
            ]

            iniciarDropDowns(combos)

            //TEXT BOXES
            var txtBoxes = [
                $("#" + '<%= txtMod.ClientID %>'),
            ]
            iniciarTextBoxes(txtBoxes)

            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))

            //CERRAR PANEL ANTERIOR
            var pnlAnterior
            $(".panel-collapse").on("show.bs.collapse", function () {
                if (pnlAnterior != undefined) {
                    $(pnlAnterior).collapse('hide')
                }
                pnlAnterior = $(this)
            })

            $('#mdlAgregar').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget)
                var tipo = button.data('tipo') 
                var modal = $(this)
                modal.find('.modal-title').text('Agregar ' + tipo)
                modal.find('.modal-body input').val(tipo)
                $("#" + '<%= HFTipo.ClientID %>').val(tipo)
            })

            $('#mdlModificar').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget)
                var tipo = button.data('tipo') 
                var modal = $(this)
                modal.find('.modal-title').text('Modificar ' + tipo)
                $("#" + '<%= HFModificar.ClientID %>').val(tipo)
                $("#" + '<%= btnUPModificar.ClientID %>').click()
            })

            $('#mdlEliminar').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget)
                var tipo = button.data('tipo') 
                var modal = $(this)
                modal.find('.modal-title').text('Eliminar ' + tipo)
                $("#" + '<%= HFEliminar.ClientID %>').val(tipo)
                $("#" + '<%= btnUPHidden.ClientID %>').click()
            })

            $("#" + '<%= cbModificar.ClientID %>').change(function () {
                console.log("cbmodificar")
            })
        })

    </script>
    <!--HIDDEN FIELDS-->
    <asp:HiddenField ID="HFTipo" runat="server" />
    <asp:HiddenField ID="HFEliminar" runat="server" />
    <asp:HiddenField ID="HFModificar" runat="server" />
    <div class="page-header">
        <h1 class="text-center">Caracteristicas Productos<br /><small>
        <asp:Label ID="lblSubtitulo" runat="server" Text=""></asp:Label></small></h1>
    </div>
    <div class="row">
        <div id="msg" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HFMsg" runat="server" />
        </div>
    </div>
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="headingOne">
                      <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                          Lineas
                        </a>
                      </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                      <div class="panel-body">
                        <div class="col-md-6 table-responsive">
                        <asp:GridView ID="grLineas" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSLineas">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="COD" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="DSLineas" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [lineas]"></asp:SqlDataSource>
                    </div>
                        <div class="col-md-2">
                        <div class="btn-group-vertical">
                            <button id="btnAgregarLinea" type="button" class="btn btn-primary" data-toggle="modal" data-target="#mdlAgregar" data-tipo="Linea">Agregar</button>
                            <button id="btnModificarLinea" type="button" class="btn btn-primary" data-target="#mdlModificar" data-toggle="modal" data-tipo="Linea">Modificar</button>
                            <button id="btnEliminarLinea" type="button" class="btn btn-primary" data-target="#mdlEliminar" data-toggle="modal" data-tipo="Linea">Eliminar</button>
                        </div>
                    </div>
                      </div>
                    </div>
                  </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-primary">
                <div class="panel-heading" role="tab" id="headingTwo">
                  <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      Chapas
                    </a>
                  </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                  <div class="panel-body">
                    <div class="col-md-6 table-responsive">
                        <asp:GridView ID="grChapas" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSChapas">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="DSChapas" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [chapas]"></asp:SqlDataSource>
                    </div>
                      <div class="col-md-2">
                          <div class="btn-group-vertical">
                              <button id="btnAgregarChapa" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal" data-tipo="Chapa">Agregar</button>
                              <button id="btnModificarChapa" type="button" class="btn btn-primary" data-target="#mdlModificar" data-toggle="modal" data-tipo="Chapa">Modificar</button>
                              <button id="btnEliminarChapa" type="button" class="btn btn-primary" data-target="#mdlEliminar" data-toggle="modal" data-tipo="Chapa">Eliminar</button>
                          </div>
                      </div>
                  </div>
                </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Maderas
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            <div class="col-md-6 table-responsive">
                                <asp:GridView ID="grMaderas" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSMaderas">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="COD" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="DSMaderas" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [maderas]"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-2">
                                <div class="btn-group-vertical">
                                    <button id="btnAgregarMadera" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal" data-tipo="Madera">Agregar</button>
                                    <button id="btnModificarMadera" type="button" class="btn btn-primary" data-target="#mdlModificar" data-toggle="modal" data-tipo="Madera">Modificar</button>
                                    <button id="btnEliminarMadera" type="button" class="btn btn-primary" data-target="#mdlEliminar" data-toggle="modal" data-tipo="Madera">Eliminar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="headingFour">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">Hojas
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            <div class="col-md-6 table-responsive">
                                <asp:GridView ID="grHojas" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSHojas">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="COD" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="DSHojas" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [hojas]"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-2">
                                <div class="btn-group-vertical">
                                    <button id="btnAgregarHoja" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal" data-tipo="Hoja">Agregar</button>
                                    <button id="btnModificarHoja" type="button" class="btn btn-primary" data-target="#mdlModificar" data-toggle="modal" data-tipo="Hoja">Modificar</button>
                                    <button id="btnEliminarHoja" type="button" class="btn btn-primary" data-target="#mdlEliminar" data-toggle="modal" data-tipo="Hoja">Eliminar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="headingFive">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">Marcos
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            <div class="col-md-6 table-responsive">
                                <asp:GridView ID="grMarco" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSMarcos">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="COD" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="DSMarcos" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [marcos]"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-2">
                                <div class="btn-group-vertical">
                                    <button id="btnAgregarMarco" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal" data-tipo="Marco">Agregar</button>
                                    <button id="btnModificarMarco" type="button" class="btn btn-primary" data-target="#mdlModificar" data-toggle="modal" data-tipo="Marco">Modificar</button>
                                    <button id="btnEliminarMarco" type="button" class="btn btn-primary" data-target="#mdlEliminar" data-toggle="modal" data-tipo="Marco">Eliminar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="headingSix">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">Manos
                            </a>
                        </h4>
                    </div>
                    <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                        <div class="panel-body">
                            <div class="col-md-6 table-responsive">
                                <asp:GridView ID="GRManos" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSManos">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="COD" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="DSManos" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [manos]"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-2">
                                <div class="btn-group-vertical">
                                    <button id="btnAgregarMano" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal" data-tipo="Mano">Agregar</button>
                                    <button id="btnModificarMano" type="button" class="btn btn-primary" data-target="#mdlModificar" data-toggle="modal" data-tipo="Mano">Modificar</button>
                                    <button id="btnEliminarMano" type="button" class="btn btn-primary" data-target="#mdlEliminar" data-toggle="modal" data-tipo="Mano">Eliminar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--MODAL AGREGAR-->
    <div class="modal fade" id="mdlAgregar" tabindex="-1" role="dialog" aria-labelledby="mdlAgregar">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">Agregar</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="Nombre" class="control-label">Nombre:</label>
                        <asp:TextBox ID="txtNombre" runat="server" ValidationGroup="VGAgregar"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese un valor" ControlToValidate="txtNombre" ValidationGroup="VGAgregar" CssClass="validators"></asp:RequiredFieldValidator><br />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" ValidationGroup="VGAgregar" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!--MODAL MODIFICAR-->
    <div class="modal fade" id="mdlModificar" tabindex="-1" role="dialog" aria-labelledby="mdlModificar">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="lblModalModificarManos">Modificar Manos</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                    <ProgressTemplate><div class="validators">Cargando</div></ProgressTemplate>
                                </asp:UpdateProgress>
                                <asp:DropDownList ID="cbModificar" runat="server" ValidationGroup="VGMod"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Seleccione un item" ControlToValidate="cbModificar" ValidationGroup="VGMod" CssClass="validators" InitialValue=''></asp:RequiredFieldValidator><br />
                                <label for="Nombre" class="control-label">Nombre:</label><br />
                                <asp:TextBox ID="txtMod" runat="server" ValidationGroup="VGMod"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ingrese un valor" ControlToValidate="txtMod" ValidationGroup="VGMod" CssClass="validators"></asp:RequiredFieldValidator><br />
                                <div style="display:none">
                                    <asp:Button ID="btnUPModificar" runat="server" Text="modficar auto" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnMod" runat="server" Text="Guardar" ValidationGroup="VGMod" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!--MODAL ELIMINAR-->
    <div class="modal fade" id="mdlEliminar" tabindex="-1" role="dialog" aria-labelledby="mdlEliminar">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="lblEliminar">Eliminar</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                                    <ProgressTemplate><div class="validators">Cargando</div></ProgressTemplate>
                                </asp:UpdateProgress>
                                <asp:DropDownList ID="cbEliminar" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Seleccione un item" ControlToValidate="cbEliminar" ValidationGroup="VGEliminar" CssClass="validators" InitialValue=''></asp:RequiredFieldValidator><br />
                                <div style="display:none">
                                    <asp:Button ID="btnUPHidden" runat="server" Text="Button" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" ValidationGroup="VGEliminar" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
