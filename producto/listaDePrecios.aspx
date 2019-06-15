<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="listaDePrecios.aspx.vb" Inherits="CBA_PLACAS_BS.listaDePrecios" theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            var check = false
            var dropDowns = [
                $("#" + '<%= DPFiltroLinea.ClientID %>'),
                $("#" + '<%= DPFiltroChapa.ClientID %>'),
                $("#" + '<%= DPFiltroMadera.ClientID %>'),
                $("#" + '<%= DPFiltroHoja.ClientID %>'),
                $("#" + '<%= DPFiltroMarco.ClientID %>'),
                $("#" + '<%= DPFiltroMano.ClientID %>')
            ]

            //inicio de controles
            iniciarDropDowns(dropDowns)
            iniciarTextBoxes([$("#txtFiltroCod"), $("#<%= txtPrecio.ClientID %>")])
            $('#btnGuardarPrecio').attr("disabled", true)


            //iniciar barra de estado
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))

            //FILTROS 
            
            $("select").change(function () {
                iniciarTextBoxes([$("#txtFiltroCod")])
                filtroProd()
            })

            $("#btnSel").click(function () {
                check = !check
                console.log("click en boton sel, valor de variable: " + check)
                console.log($("checkbox"))
                $("input[type=checkbox]").prop('checked', check);
                
            })

            $("#txtFiltroCod").keyup(function () {
                var texto = this.value;
                var table = document.getElementById('<%= grProductos.ClientID %>');
                if (texto !="") {
                    iniciarDropDowns(dropDowns)
                    limpiarFiltro(table)
                    filtro(table, texto, 8)
                } else {
                    limpiarFiltro(table)
                }
            })

            $("#btnLimpiarFiltro").click(function () {

                iniciarDropDowns(dropDowns)
                iniciarTextBoxes([$("#txtFiltroCod")])
                table = document.getElementById('<%= grProductos.ClientID %>');
                limpiarFiltro(table)
            })

            $("#" + '<%= rbOpcionPrecio.ClientID %>').click(function () {
                var rbVal = $("#" + '<%= rbOpcionPrecio.ClientID %>' + " input:checked").val()

                $("#" + '<%= txtPrecio.ClientID %>').val("")
                $("#msgValidar").hide()
                $("#divTextBox").removeClass("has-error")
                $("#divTextBox").removeClass("has-success")
                $('#btnGuardarPrecio').attr("disabled", true)

                if (rbVal == "PORCENTAJE") {
                    $("#preTxtPrecio").text("%")
                    $("#msgAyuda").text("Ingrese un numero mayor a 100 para aumentar el precio o menor para disminuirlo")
                }else{
                    $("#preTxtPrecio").text("$")
                    $("#msgAyuda").text("Ingrese el nuevo precio")
                }
            })

            $("#" + '<%= txtPrecio.ClientID %>').keyup(function () {
                var val = $("#" + '<%= txtPrecio.ClientID %>').val()

                if (val =="") {
                    $("#msgValidar").hide()
                    $("#divTextBox").removeClass("has-error")
                    $("#divTextBox").removeClass("has-success")
                    $('#btnGuardarPrecio').attr("disabled", true)
                }else if (isNaN(val)) {
                    $("#msgValidar").show()
                    $("#divTextBox").addClass("has-error")
                    $("#divTextBox").removeClass("has-success")
                    $("#btnGuardarPrecio").attr("disabled", true);
                }else{
                    $("#msgValidar").hide()
                    $("#divTextBox").removeClass("has-error")
                    $("#divTextBox").addClass("has-success")
                    $('#btnGuardarPrecio').attr("disabled", false)

                    var rbVal = $("#" + '<%= rbOpcionPrecio.ClientID %>' + " input:checked").val()
                    if (rbVal == "PORCENTAJE") {
                        $("#msgConfirmar").text("el precio de los productos seleccionados sera aumentado un " + val + "%. Desea continuar?")
                    } else {
                        $("#msgConfirmar").text("el precio de los productos seleccionados sera establecido en $" + val + ". Desea continuar?")
                    }
                }
            })
            

            function filtroProd() {
                var linea = $("#" + '<%= DPFiltroLinea.ClientID %>').val();
                var chapa = $("#" + '<%= DPFiltroChapa.ClientID %>').val()
                var mad = $("#" + '<%= DPFiltroMadera.ClientID %>').val()
                var hoja = $("#" + '<%= DPFiltroHoja.ClientID %>').val()
                var marco = $("#" + '<%= DPFiltroMarco.ClientID %>').val()
                var mano = $("#" + '<%= DPFiltroMano.ClientID %>').val()
                var table = document.getElementById('<%= grProductos.ClientID %>');

                var colLinea = 1
                var colChapa = 2
                var colMad = 3
                var colHoj = 4
                var colMar = 5
                var colMan = 6
                var filasOcultar =[]

                tr = table.getElementsByTagName("tr");

                for (i = 0; i < tr.length; i++) {

                    if (linea) {
                        tdLinea = tr[i].getElementsByTagName("td")[colLinea];
                        if (tdLinea) {
                            txtValue = tdLinea.textContent || tdLinea.innerText;
                            if (txtValue.toUpperCase().indexOf(linea.toUpperCase()) == -1) {
                                if (!filasOcultar.includes(i)) {
                                    filasOcultar.push(i)
                                }
                            }
                        }
                    }//end if

                    if (chapa) {
                        tdLinea = tr[i].getElementsByTagName("td")[colChapa];
                        if (tdLinea) {
                            txtValue = tdLinea.textContent || tdLinea.innerText;
                            if (txtValue.toUpperCase().indexOf(chapa.toUpperCase()) == -1) {
                                if (!filasOcultar.includes(i)) {
                                    filasOcultar.push(i)
                                }
                            }
                        }
                    }//endif

                    if (mad) {
                        tdLinea = tr[i].getElementsByTagName("td")[colMad];
                        if (tdLinea) {
                            txtValue = tdLinea.textContent || tdLinea.innerText;
                            if (txtValue.toUpperCase().indexOf(mad.toUpperCase()) == -1) {
                                if (!filasOcultar.includes(i)) {
                                    filasOcultar.push(i)
                                }
                            }
                        }
                    }//end if

                    if (hoja) {
                        tdLinea = tr[i].getElementsByTagName("td")[colHoj];
                        if (tdLinea) {
                            txtValue = tdLinea.textContent || tdLinea.innerText;
                            if (txtValue.toUpperCase().indexOf(hoja.toUpperCase()) == -1) {
                                if (!filasOcultar.includes(i)) {
                                    filasOcultar.push(i)
                                }
                            }
                        }
                    }//end if

                    if (marco) {
                        tdLinea = tr[i].getElementsByTagName("td")[colMar];
                        if (tdLinea) {
                            txtValue = tdLinea.textContent || tdLinea.innerText;
                            if (txtValue.toUpperCase().indexOf(marco.toUpperCase()) == -1) {
                                if (!filasOcultar.includes(i)) {
                                    filasOcultar.push(i)
                                }
                            }
                        }
                    }//end if

                    if (mano) {
                        tdLinea = tr[i].getElementsByTagName("td")[colMan];
                        if (tdLinea) {
                            txtValue = tdLinea.textContent || tdLinea.innerText;
                            if (txtValue.toUpperCase().indexOf(mano.toUpperCase()) == -1) {
                                if (!filasOcultar.includes(i)) {
                                    filasOcultar.push(i)
                                }
                            }
                        }
                    }//end if
                }

                for (i = 1; i < tr.length; i++) {
                    if (filasOcultar.includes(i)) {
                        tr[i].style.display = "none";
                    } else {
                        tr[i].style.display = "";
                    }
                }
            }

            if ($("input[id$=HFRol]").val() == "ENCARGADO" || $("input[id$=HFRol]").val() == "GERENCIA") {
                var controles = [$("#btnMdlPrecio"), $("#btnSel")]
                console.log(controles)
                inHabilitarControles(controles)
            }

        })

    </script>
    <div class="page-header">
        <h1 class="text-center">Lista de Precios<br /><small>
        Lista de Precios</small></h1>
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
            <div class="col-md-6">
                <strong>CODIGO:</strong><br />
                <input id="txtFiltroCod" class="form-control" type="text" /><br />
            </div>
            <div class="col-md-6">
                <input id="btnLimpiarFiltro" class="btn btn-primary pull-right" type="button" value="Limpiar Filtro" />
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
    </div>
    <hr>
    <div class="row">    
        <div class="table-responsive">
            <asp:GridView ID="grProductos" runat="server" AutoGenerateColumns="False" ToolTip="Productos" CssClass="table" DataKeyNames="ID">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID_LINEA" SortExpression="ID" >
                        <ControlStyle CssClass="hiddencol" />
                        <FooterStyle CssClass="hiddencol" />
                        <HeaderStyle CssClass="hiddencol" />
                        <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ID_LINEA" HeaderText="ID_LINEA" SortExpression="ID_LINEA" >
                        <ControlStyle CssClass="hiddencol" />
                        <FooterStyle CssClass="hiddencol" />
                        <HeaderStyle CssClass="hiddencol" />
                        <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ID_CHAPA" HeaderText="ID_CHAPA" SortExpression="ID_CHAPA" >
                        <ControlStyle CssClass="hiddencol" />
                        <FooterStyle CssClass="hiddencol" />
                        <HeaderStyle CssClass="hiddencol" />
                        <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ID_MADERA" HeaderText="ID_MADERA" SortExpression="ID_MADERA" >
                        <ControlStyle CssClass="hiddencol" />
                        <FooterStyle CssClass="hiddencol" />
                        <HeaderStyle CssClass="hiddencol" />
                        <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ID_HOJA" HeaderText="ID_HOJA" SortExpression="ID_HOJA" >
                        <ControlStyle CssClass="hiddencol" />
                        <FooterStyle CssClass="hiddencol" />
                        <HeaderStyle CssClass="hiddencol" />
                        <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ID_MARCO" HeaderText="ID_MARCO" SortExpression="ID_MARCO" >
                        <ControlStyle CssClass="hiddencol" />
                        <FooterStyle CssClass="hiddencol" />
                        <HeaderStyle CssClass="hiddencol" />
                        <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ID_MANO" HeaderText="ID_MANO" SortExpression="ID_MANO" >
                        <ControlStyle CssClass="hiddencol" />
                        <FooterStyle CssClass="hiddencol" />
                        <HeaderStyle CssClass="hiddencol" />
                        <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="SEL">
                        <ItemTemplate>
                            <asp:CheckBox ID="check" runat="server" />
                        </ItemTemplate>
                        <ItemStyle CssClass="numCols" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="COD" HeaderText="COD" />
                    <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                    <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                    <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                    <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                    <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                    <asp:BoundField DataField="MANO" HeaderText="MANO" />
                    <asp:BoundField DataField="PRECIO" HeaderText="PRECIO" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="STOCK" HeaderText="STOCK" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                        <ControlStyle CssClass="imageButtons" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
