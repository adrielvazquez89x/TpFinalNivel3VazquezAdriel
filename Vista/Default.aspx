<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Vista.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server" />
    <div class="container d-flex justify-content-between">
        <aside>
            <div class="containerFilters">
                <!-- Barra de búsqueda-->
                <div class="d-flex flex-column">
                    <asp:Label Text="Buscar" runat="server" CssClass="form-label" />
                    <div class="d-flex">
                        <asp:TextBox runat="server" ID="txtBuscar" CssClass="form-control" />
                        <asp:Button Text="Lupa" runat="server" ID="btnBuscar" OnClick="btnBuscar_Click" CssClass="mx-1" />

                    </div>
                </div>
                <!-- Ordenar por-->

                <div class="d-flex flex-column">
                    <asp:Label Text="Ordenar por:" runat="server" CssClass="form-label" />
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlOrdenar" AutoPostBack="true" OnSelectedIndexChanged="ddlOrdenar_SelectedIndexChanged">
                        <asp:ListItem Text="A - Z" />
                        <asp:ListItem Text="Z - A" />
                        <asp:ListItem Text="Menor precio" />
                        <asp:ListItem Text="Mayor precio" />
                    </asp:DropDownList>
                </div>


                <!-- Precio -->
                <div class="d-flex flex-column">
                    <asp:Label Text="Precio" runat="server" CssClass="form-label" />
                    <div class="d-flex gap-2">
                        <div>
                            <asp:TextBox runat="server" ID="txtMinPrecio" CssClass="form-control form-control-sm" TextMode="Number" Placeholder="mínimo" />
                        </div>
                        <div>
                            <asp:TextBox runat="server" ID="txtMaxPrecio" CssClass="form-control form-control-sm" TextMode="Number" Placeholder="máximo" />
                        </div>
                    </div>
                </div>
                <!-- Filtros podrian ir dropdowns tambien acá -->
                <div class="d-flex flex-column">
                    <asp:Label Text="Marcas" runat="server" />
                    <asp:DropDownList ID="ddlMarcas" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlMarcas_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="d-flex flex-column">
                    <asp:Label Text="Categorias" runat="server" />
                    <asp:DropDownList ID="ddlCategorias" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <asp:Button Text="Filtrar" runat="server" ID="btnFiltrar" OnClick="btnFiltrar_Click" />
            <asp:Button Text="Limpiar Filtros" runat="server" ID="btnLimpiarFiltros" OnClick="btnLimpiarFiltros_Click" />

            <asp:Label Text="consola" ID="consola" runat="server" />

            <%
                if (FiltrosAplicados)
                {%>
            <div class="d-flex flex-column">
                <p>Filtros Aplicados: </p>
                <asp:Label Text="" ID="lblCategoria" runat="server" />
                <asp:Label Text="" ID="lblMarcas" runat="server" />
                <asp:Label Text="" ID="lblPrecio" runat="server" />
            </div>

            <%}
            %>
        </aside>
        <!-- Seccion para mostrar articulos -->
        <section>
            <div class="containerItems">

                <% if (ListaArticulos.Count > 0)
                    {
                        foreach (dominio.Articulo articulo in ListaArticulos)
                        {%>
                <div class="card">
                    <img src="<%:articulo.UrlImg %>" onerror="this.src='https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg'" class="card-img-top" alt="Imagen del artículo">
                    <div class="cardContent">
                        <h5 class="cardTitle"><%:articulo.Nombre %></h5>
                        <p class="cardDescription">Precio: $<%:articulo.Precio %></p>
                        <a href="Detalle.aspx?id=<%:articulo.Id %>" class="btnCard">Leer más</a>
                    </div>
                </div>
                <%}
                    }
                    else
                    {%>
                <div class="col"></div>
                <div class="col text-center">
                    <h5 class="mt-5 pt-5">No se han encontrado resultados para esos criterios</h5>
                </div>
                <div class="col"></div>

                <%} %>
            </div>
        </section>

    </div>



</asp:Content>
