<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Vista.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Favoritos</h1>
    <div class="container">
        <div>
            <asp:CheckBox Text="" runat="server" />
            <asp:Button Text="Eliminar favoritos seleccionados" runat="server" />
        </div>
        <div>

            <% foreach (dominio.Articulo articulo in ListaFavoritos)
                {%>

            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="<%:articulo.UrlImg %>" onerror="this.src='https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg'" class="img-fluid rounded-start" alt="imagen de <%:articulo.Nombre %>">
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title"> <%:articulo.Nombre %></h5>
                            <p class="card-text"><%:articulo.Descripcion %></p>
                            <p class="card-text"><small class="text-body-secondary">$ <%:articulo.Precio %> </small></p>
                        </div>
                    </div>
                    <div class="d-flex col-md-1">
                        <asp:CheckBox Text="" runat="server" ID="" />
                    </div>
                </div>
            </div>

            <%} %>
        </div>

    </div>


</asp:Content>
