<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="Vista.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="containerArticle">

            <div class="articleDetails">
                <div class="articleImage">
                    <img src="<%:articulo.UrlImg %>" onerror="this.src='https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg'" alt="Imagen del Artículo">
                </div>
                <div class="articleContent">
                    <p class="articleName"><%:articulo.Fabricante.Nombre %></p>
                    <h3><%: articulo.Nombre %></h3>
                    <p class="articleDescription"><%:articulo.Descripcion %></p>
                    <p class="articlePrice">$<%: articulo.Precio %></p>
                    <div class="btnFav">
                        <i class="fa fa-heart-o"></i>
                    </div>
                    <div class="btnFavChecked">
                        <i class="fa fa-heart"></i>
                    </div>
                    <asp:Label Text="" ID="Label1" runat="server" />
                </div>
            </div>


        </div>
    </div>
    <asp:Label Text="" ID="lblPrueba" runat="server" />
</asp:Content>
