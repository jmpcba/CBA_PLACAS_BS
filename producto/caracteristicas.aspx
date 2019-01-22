<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="caracteristicas.aspx.vb" Inherits="CBA_PLACAS_BS.caracteristicas" theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        
        $(document).ready(function () {
            //COMBOS
            var combos = [
                $("#" + '<%= cbChapas.ClientID %>'),
                $("#" + '<%= cbMadera.ClientID %>'),
                $("#" + '<%= cbHojas.ClientID %>'),
                $("#" + '<%= cbMarcos.ClientID %>'),
                $("#" + '<%= cbManos.ClientID %>')
            ]

            iniciarDropDowns(combos)

            //TEXT BOXES
            var txtBoxes = [
                $("#" + '<%= txtModChapa.ClientID %>'),
                $("#" + '<%= txtModMadera.ClientID %>'),
                $("#" + '<%= txtModHojas.ClientID %>'),
                $("#" + '<%= txtMarcos.ClientID %>'),
                $("#" + '<%= txtModManos.ClientID %>')
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

        })

    </script>
    <!--HIDDEN FIELDS-->
    <asp:HiddenField ID="HFTipo" runat="server" />
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
                            <button id="btnModificarLinea" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal">Modificar</button>
                            <button id="btnEliminarLinea" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal">Eliminar</button>
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
                                <asp:BoundField DataField="COD_MAT" HeaderText="COD_MAT" SortExpression="COD_MAT"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="DSChapas" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [chapas]"></asp:SqlDataSource>
                    </div>
                      <div class="col-md-2">
                          <div class="btn-group-vertical">
                              <button id="btnAgregarChapa" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal" data-tipo="Chapa">Agregar</button>
                              <button id="btnModificarChapa" type="button" class="btn btn-primary" data-target="#mdlModificarChapa" data-toggle="modal">Modificar</button>
                              <button id="btnEliminarChapa" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal">Eliminar</button>
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
                                    <button id="btnModificarMadera" type="button" class="btn btn-primary" data-target="#mdlModificarMadera" data-toggle="modal">Modificar</button>
                                    <button id="btnEliminarMadera" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal">Eliminar</button>
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
                                    <button id="btnModificarHoja" type="button" class="btn btn-primary" data-target="#mdlModificarHojas" data-toggle="modal">Modificar</button>
                                    <button id="btnEliminarHoja" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal">Eliminar</button>
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
                                    <button id="btnModificarMarco" type="button" class="btn btn-primary" data-target="#mdlModificarMarcos" data-toggle="modal">Modificar</button>
                                    <button id="btnEliminarMarco" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal">Eliminar</button>
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
                                    <button id="btnModificarMano" type="button" class="btn btn-primary" data-target="#mdlModificarManos" data-toggle="modal">Modificar</button>
                                    <button id="btnEliminarMano" type="button" class="btn btn-primary" data-target="#mdlAgregar" data-toggle="modal">Eliminar</button>
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
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!--MODAL MODIFICAR CHAPA-->
    <div class="modal fade" id="mdlModificarChapa" tabindex="-1" role="dialog" aria-labelledby="mdlAgregar">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="lblModalModificarChapa">Modificar Chapa</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:DropDownList ID="cbChapas" runat="server" DataSourceID="DSChapas" DataTextField="nombre" DataValueField="id"></asp:DropDownList><br />
                        <label for="Nombre" class="control-label">Nombre:</label><br />
                        <asp:TextBox ID="txtModChapa" runat="server" ValidationGroup="VGChapa"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese un valor" ValidationGroup="VGChapa" ControlToValidate="txtModChapa" CssClass="validators"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnGuardarModificar" runat="server" Text="Guardar" ValidationGroup="VGChapa" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!--MODAL MODIFICAR MADERA-->
    <div class="modal fade" id="mdlModificarMadera" tabindex="-1" role="dialog" aria-labelledby="mdlAgregar">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="lblModalModificarMadera">Modificar Maderas</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:DropDownList ID="cbMadera" runat="server" DataSourceID="DSMaderas" DataTextField="nombre" DataValueField="id"></asp:DropDownList><br />
                        <label for="Nombre" class="control-label">Nombre:</label><br />
                        <asp:TextBox ID="txtModMadera" runat="server" ValidationGroup="VGMadera"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese un valor" ControlToValidate="txtModMadera" ValidationGroup="VGMadera" CssClass="validators"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnGuardarMadera" runat="server" Text="Guardar" ValidationGroup="VGMadera" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!--MODAL MODIFICAR HOJAS-->
    <div class="modal fade" id="mdlModificarHojas" tabindex="-1" role="dialog" aria-labelledby="mdlAgregar">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="lblModalModificarHojas">Modificar Hojas</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:DropDownList ID="cbHojas" runat="server" DataSourceID="DSHojas" DataTextField="nombre" DataValueField="id"></asp:DropDownList><br />
                        <label for="Nombre" class="control-label">Nombre:</label><br />
                        <asp:TextBox ID="txtModHojas" runat="server" ValidationGroup="VGHojas"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ingrese un valor" ControlToValidate="txtModHojas" ValidationGroup="VGHojas" CssClass="validators"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnModHojas" runat="server" Text="Guardar" ValidationGroup="VGHojas" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!--MODAL MODIFICAR MARCOS-->
    <div class="modal fade" id="mdlModificarMarcos" tabindex="-1" role="dialog" aria-labelledby="mdlAgregar">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="lblModalModificarMarcos">Modificar Marcos</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:DropDownList ID="cbMarcos" runat="server" DataSourceID="DSMarcos" DataTextField="nombre" DataValueField="id"></asp:DropDownList><br />
                        <label for="Nombre" class="control-label">Nombre:</label><br />
                        <asp:TextBox ID="txtMarcos" runat="server" ValidationGroup="VGMarcos"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Ingrese un valor" ControlToValidate="txtModHojas" ValidationGroup="VGMarcos" CssClass="validators"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnMarcos" runat="server" Text="Guardar" ValidationGroup="VGMarcos" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    <!--MODAL MODIFICAR MANOS-->
    <div class="modal fade" id="mdlModificarManos" tabindex="-1" role="dialog" aria-labelledby="mdlAgregar">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="lblModalModificarManos">Modificar Manos</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:DropDownList ID="cbManos" runat="server" DataSourceID="DSManos" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Seleccione un item" ControlToValidate="cbManos" ValidationGroup="VGManos" CssClass="validators" InitialValue=''></asp:RequiredFieldValidator><br />
                        <label for="Nombre" class="control-label">Nombre:</label><br />
                        <asp:TextBox ID="txtModManos" runat="server" ValidationGroup="VGManos"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ingrese un valor" ControlToValidate="txtModManos" ValidationGroup="VGManos" CssClass="validators"></asp:RequiredFieldValidator><br />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnManos" runat="server" Text="Guardar" ValidationGroup="VGManos" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
