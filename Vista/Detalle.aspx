﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="Vista.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <div class="container">
        <div class="containerArticle">

            <div class="articleDetails">
                <div class="articleImage">
                    <img src="<%:ArticuloActual.UrlImg %>" onerror="this.src='https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg'" alt="Imagen del Artículo">
                </div>
                <div class="articleContent">
                    <p class="articleName"><%:ArticuloActual.Fabricante.Nombre %></p>
                    <h3><%: ArticuloActual.Nombre %></h3>
                    <p class="articleDescription"><%:ArticuloActual.Descripcion %></p>
                    <p class="articlePrice">$<%: ArticuloActual.Precio %></p>

                    <asp:Button Text="Agregar al carrito"
                        runat="server" CssClass="btn btn-primary"
                        ID="btnAgregarCarrito"
                        ClientIDMode="Static"
                        OnClick="btnAgregarCarrito_Click" />
                   
                   <%-- <div class="toast-container position-fixed bottom-0 end-0 p-3">
                        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                            <div class="toast-header">
                                <img src="..." class="rounded me-2" alt="...">
                                <strong class="me-auto">Bootstrap</strong>
                                <small>11 mins ago</small>
                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                            </div>
                            <div class="toast-body">
                                Hello, world! This is a toast message.
                            </div>
                        </div>
                    </div>--%>
                    <%
                        if (ArticuloActual.Codigo.Contains("(BAJA)"))
                        {%>
                    <p class="text-danger">Articulo no disponible.</p>
                    <%}
                    %>

                    <%
                        if (SesionActiva)
                        {
                            if (ArticuloFaveado)

                            {%>

                    <asp:LinkButton runat="server" ID="btnHeartChecked" OnClick="btnHeartChecked_Click" CssClass="btnFavChecked">
                                <i class="fa fa-heart"></i>
                    </asp:LinkButton>

                    <%}
                        else
                        {%>
                    <asp:LinkButton runat="server" ID="bntHeart" OnClick="bntHeart_Click" CssClass="btnFav">
                                <i class="fa fa-heart-o"></i>
                    </asp:LinkButton>
                    <%}

                        }
                    %>
                </div>

            </div>


        </div>
    </div>

</asp:Content>
