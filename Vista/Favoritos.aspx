<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Vista.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Favoritos</h1>

    <% if (ListaFavoritos.Count != 0 && ListaFavoritos != null)
        {%>
    <div class="row justify-content-center gap-4">
        <asp:Repeater runat="server" ID="ripiter">
            <ItemTemplate>

                <div class="card mb-3 col-5" style="max-width: 700px;">
                    <div class="row g-0">

                        <div class="col-md-4 favImg py-3">
                            <a href="Detalle.aspx?id=<%#Eval("Id") %>">
                                <img src="<%#Eval("UrlImg") %>" onerror="this.src='https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg'" class="img-fluid rounded-start" alt="imagen de <%#Eval("Nombre") %>">
                            </a>
                        </div>
                        <div class="col-md-7">
                            <div class="card-body">
                                <a href="Detalle.aspx?id=<%#Eval("Id") %>">
                                    <h5 class="card-title"><%#Eval("Nombre")%></h5>
                                </a>
                                <p class="card-text"><%#Eval("Descripcion") %></p>
                                <p class="card-text"><small class="text-body-secondary">$ <%#Eval("Precio") %> </small></p>
                            </div>
                        </div>

                        <div class="d-flex col-md-1 justify-content-center align-items-center">
                            <asp:LinkButton runat="server" ID="bntEliminar" CssClass="btnDelete"
                                OnClick="bntEliminar_Click" CommandArgument='<%#Eval("Id") %>' CommandName="ArticuloId">
                                    <i class="fa fa-trash-o" aria-hidden="true"></i>
                            </asp:LinkButton>

                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <%}
        else
        {%>
    <div class="d-flex flex-column justify-content-center align-items-center">
        <h5>Aún no hay artículos marcados como favoritos</h5>
        <i class="fa fa-exclamation-circle " aria-hidden="true"></i>
    </div>
    <%}
    %>
</asp:Content>
