<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioArticulos.aspx.cs" Inherits="Vista.FormularioArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <h1 class="text-center mb-3">Agregar nuevo Artículo</h1>
        <asp:ScriptManager ID="ScriptManager" runat="server" />

        <div class="row">
            <div class="col-6">
                <!-- ID -->
                <div class="mb-3">
                    <asp:Label ID="lblID" runat="server" Text="Id"></asp:Label>
                    <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <!-- Codigo -->
                <div class="mb-3">
                    <asp:Label ID="lblCodigo" runat="server" Text="Código"></asp:Label>
                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <!-- Nombre -->
                <div class="mb-3">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <!-- Precio -->
                <div class="mb-3">
                    <asp:Label ID="lblPrecio" runat="server" Text="Precio"></asp:Label>
                    <asp:TextBox ID="txtprecio" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <!-- Marca -->
                <div class="mb-3">
                    <asp:Label ID="lblMarca" runat="server" Text="Marca"></asp:Label>
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <!-- Categoría -->
                <div class="mb-3">
                    <asp:Label ID="lblCategoria" runat="server" Text="Categoría"></asp:Label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <!-- Botones -->
                <div class="mb-3">
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" />
                    <asp:Button Text="Desactivar" ID="btnDesactivar" CssClass="btn btn-warning" runat="server" />
                    <a href="PokemonLista.aspx" class="btn btn-secondary">Cancelar</a>
                </div>
            </div>

            <!-- Segunda columna -->
            <!-- Descripción -->
            <div class="col-6">
                <div class="mb-3">
                    <asp:Label ID="lblDescripcion" runat="server" Text="Descripción"></asp:Label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                <!-- Url Imagen, e imagen, con UpdatePanel para no renderizar todo el sitio -->
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <asp:Label ID="lblUrl" runat="server" Text="Url Imágen"></asp:Label>
                            <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control" AutoPostBack="true"></asp:TextBox>
                            <!--OnTextChanged="txtUrl_TextChanged"-->
                            <asp:Image ImageUrl="https://editorial.unc.edu.ar/wp-content/uploads/sites/33/2022/09/placeholder.png" runat="server" ID="imgPokemon" Width="60%" CssClass="mt-3" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <!-- Sección eliminación -->
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="mb-3">
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" />
                        </div>
                        <!-- Confirmar eliminación -->
                        <% //if (ConfirmaEliminacion)
// { %>
                        <div class="mb-3">
                            <asp:CheckBox Text="Confirmar eliminación" ID="chkConfirmarEliminacion" runat="server" />
                            <asp:Button Text="Eliminar" ID="btConfirmarElimnar" CssClass="btn btn-outline-danger" runat="server" />
                        </div>
                        <% //} %>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

</asp:Content>
