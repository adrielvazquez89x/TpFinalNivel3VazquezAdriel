<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Vista.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Olis Mundis</h1>

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
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </section>
    </div>



</asp:Content>
