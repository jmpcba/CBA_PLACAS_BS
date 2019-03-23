<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="productos.aspx.vb" Inherits="CBA_PLACAS_BS.productos1" Theme="default" %>
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
            iniciarDropDowns(dropDowns)

            //iniciar barra de estado
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))

            $("#" + '<%= DPFiltroLinea.ClientID %>').change(function () {
                filtro() 
            })

            $("#" + '<%= DPFiltroChapa.ClientID %>').change(function () {
                filtro()
            })

            $("#" + '<%= DPFiltroMadera.ClientID %>').change(function () {
                filtro() 
            })

             $("#" + '<%= DPFiltroHoja.ClientID %>').change(function () {
                filtro() 
             })

            $("#" + '<%= DPFiltroMarco.ClientID %>').change(function () {
                filtro() 
            })

            $("#" + '<%= DPFiltroMano.ClientID %>').change(function () {
                filtro() 
            })

            function filtro() {

                var linea = $("#" + '<%= DPFiltroLinea.ClientID %>').val();
                var chapa = $("#" + '<%= DPFiltroChapa.ClientID %>').val()
                var mad = $("#" + '<%= DPFiltroMadera.ClientID %>').val()
                var hoja = $("#" + '<%= DPFiltroHoja.ClientID %>').val()
                var marco = $("#" + '<%= DPFiltroMarco.ClientID %>').val()
                var mano = $("#" + '<%= DPFiltroMano.ClientID %>').val()
                var table = document.getElementById('<%= grProductos.ClientID %>');

                var colLinea = 0
                var colChapa = 1
                var colMad = 2
                var colHoj = 3
                var colMar = 4
                var colMan = 5
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

            $("#btnLimpiarFiltro").click(function () {
                table = document.getElementById('<%= grProductos.ClientID %>');
                limpiarFiltro(table)

                iniciarDropDowns(dropdowns)
            })
        })

    </script>
    <div class="page-header">
        <h1 class="text-center">PRODUCTOS<br /><small>
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
        <div class="row">
            <br />
            <button id="btnLimpiarFiltro" class="btn btn-primary pull-right" type="submit">Limpiar Filtros</button>
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
