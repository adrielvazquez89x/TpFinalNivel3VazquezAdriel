<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Vista.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container d-flex">
        <aside>
            <div class="containerFilters">
                <!-- Barra de búsqueda-->
                <div class="d-flex flex-column">
                    <asp:Label Text="Buscar" runat="server" CssClass="form-label" />
                    <div class="d-flex">
                        <asp:TextBox runat="server" ID="txtBuscar" CssClass="form-control" />
                        <asp:Button Text="Lupa" runat="server" CssClass="mx-1" />

                    </div>
                </div>
                <!-- Ordenar por-->
                <div class="d-flex flex-column">
                    <asp:Label Text="Ordenar por:" runat="server" CssClass="form-label" />
                    <asp:DropDownList runat="server" CssClass="form-control">
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
                            <asp:Label Text="MIN" runat="server" CssClass="form-label" />
                            <asp:TextBox runat="server" ID="txtMinPrice" CssClass="form-control form-control-sm" />
                        </div>
                        <div>
                            <asp:Label Text="MAX" runat="server" CssClass="form-label" />
                            <asp:TextBox runat="server" ID="txtMaxPrice" CssClass="form-control form-control-sm" />
                        </div>
                    </div>

                </div>
                <!-- Filtros podrian ir dropdowns tambien acá -->
                <div class="d-flex flex-column">
                    <asp:Label Text="Marcas" runat="server" />
                    <asp:DropDownList ID="ddlMarcas" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="d-flex flex-column">
                    <asp:Label Text="Categorias" runat="server" />
                    <asp:DropDownList ID="ddlCategorias" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
        </aside>
        <!-- Seccion para mostrar articulos -->
        <section>
            <div class="containerItems">

                <%foreach (dominio.Articulo articulo in ListaArticulos)
                    {%>
                <div class="card">
                    <img src="<%:articulo.UrlImg %>" onerror="this.src='https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg'" class="card-img-top" alt="Imagen del artículo">
                    <div class="cardContent">
                        <h5 class="cardTitle"><%:articulo.Nombre %></h5>
                        <p class="cardDescription"><%:articulo.Descripcion %></p>
                        <a href="#" class="btn btnCard">Leer más</a>
                    </div>
                </div>
                <%}%>
            </div>
        </section>

    </div>



</asp:Content>
