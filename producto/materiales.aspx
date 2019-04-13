<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="materiales.aspx.vb" Inherits="CBA_PLACAS_BS.materiales" theme="default"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))

            
            var txtBoxes = [$("#" + '<%= txtUnidad.ClientID %>'),
                            $("#" + '<%= txtNombre.ClientID %>'),
                            $("#txtFiltroNombre"),
                            $("#txtFiltroCod")
            ]

            validar()
            iniciarTextBoxes(txtBoxes)

            $("#txtFiltroNombre").keyup(function () {
                var col = 1
                var table = document.getElementById('<%= grMateriales.ClientID %>');
                var val = this.value
                limpiarFiltro(table)
                filtro(table, val, col)

                if (val != "") {
                    filtro(table, val, col)
                }
            })

            $("#txtFiltroCod").keyup(function () {
                var col = 0
                var table = document.getElementById('<%= grMateriales.ClientID %>');
                var val = this.value
                limpiarFiltro(table)

                if (val != "") {
                    filtro(table, val, col)
                }
            })

            $("#btnLimpiarFiltro").click(function () {
                var table = document.getElementById('<%= grMateriales.ClientID %>');
                limpiarFiltro(table)
            })

            $("#" + '<%= txtNombre.ClientID %>').keyup(function () {
                validar()
            })

            $("#" + '<%= txtUnidad.ClientID %>').keyup(function () {
                validar()
            })

            function validar() {
                var nombre = $("#" + '<%= txtUnidad.ClientID %>').val()
                var unidad = $("#" + '<%= txtUnidad.ClientID %>').val()

                if (nombre != "" && unidad != "") {
                    $("#" + '<%= btnNvo.ClientID %>').attr("disabled", false)
                } else {
                    $("#" + '<%= btnNvo.ClientID %>').attr("disabled", true)
                }
            }

            if ($("input[id$=HFRol]").val() == "ENCARGADO" || $("input[id$=HFRol]").val() == "GERENCIA") {
                var controles = [$("#btnMdlNvo")]
                console.log(controles)
                inHabilitarControles(controles)
            }
        })
    </script>
    <div class="page-header">
        <h1 class="text-center">MATERIALES<br /><small>
        Lista de piezas y stock</small></h1>
    </div>
    <div class="row">
        <div id="msg" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HFMsg" runat="server" Value="success" />
        </div>
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col-md-4">
                <strong>CODIGO:</strong><br />
                <input id="txtFiltroCod" class="form-control" data-columna="0" type="text" /><br />
            </div>
            <div class="col-md-4">
                <strong>NOMBRE:</strong><br />
                <input id="txtFiltroNombre" class="form-control" data-columna="1" type="text" /><br />
            </div>
            <div class="col-md-4">
                <br />
                <input id="btnLimpiarFiltro" class="btn btn-primary pull-right" type="button" value="Limpiar Filtro" />
            </div>
        </div>
    </div>
    <hr>
    <div class="row">
            <button id= "btnMdlNvo" type="button" class="btn btn-primary pull-left" data-toggle="modal" data-target="#mdlNvo">
                Nueva Pieza</button>
    </div><br />
    <div class="row">    
        <div class="table-responsive">
            <asp:GridView ID="grMateriales" runat="server" AutoGenerateColumns="False" ToolTip="Productos" CssClass="table" DataKeyNames="ID">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="COD" />
                    <asp:BoundField DataField="NOMBRE" HeaderText="PIEZA" />
                    <asp:BoundField DataField="STOCK_DISPONIBLE" HeaderText="STOCK"  DataFormatString="{0:F2}">
                        <ItemStyle CssClass="numCol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UNIDAD" HeaderText="UNIDAD" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                        <ControlStyle CssClass="imageButtons" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <!-- Modal nueva pieza -->
    <div class="modal fade" id="mdlNvo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Nueva Pieza</h4>
          </div>
          <div class="modal-body">
              <div id="divTextBox">
                  <strong>NOMBRE:</strong><br />
                  <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox><br />
                  <strong>UNIDAD:</strong><br />
                  <asp:TextBox ID="txtUnidad" runat="server"></asp:TextBox>
                  <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtUnidad" ServiceMethod="getUnidades"></ajaxToolkit:AutoCompleteExtender>
                  <br />
              </div>
          </div>
          <div class="modal-footer">
              <asp:Button ID="btnNvo" runat="server" Text="Guardar" />
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
