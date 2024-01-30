<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticulosLista.aspx.cs" Inherits="Vista.ArticulosLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1 class="text-center">Lista de Articulos</h1>
    <%-- Filtro Sencillo --%>
    <asp:Label Text="Filtrar" runat="server" />
    <div class="row">
        <div class="col-4">
            <asp:TextBox runat="server" ID="txtFiltro" AutoPostBack="true" CssClass="form-control my-3" />
        </div>
        <div class="col-4 my-auto">
            <asp:CheckBox Text="Filtro Avanzado" ID="chkAvanzado"
                AutoPostBack="true"
                
                runat="server" />

        </div>
    </div>

    <%-- Filtro Avanzado --%>
    <%// if (FiltroAvanzado)
        //{%>
    <div class="row mb-3">
        <div class="col-3">
            <asp:Label Text="Campo" runat="server" />
            <asp:DropDownList ID="ddlCampo" runat="server" CssClass="form-control" AutoPostBack="true">
                <asp:ListItem Text="Nombre" />
                <asp:ListItem Text="Tipo" />
                <asp:ListItem Text="Número" />
            </asp:DropDownList>
        </div>
        <div class="col-3">
            <asp:Label Text="Criterio" runat="server" />
            <asp:DropDownList ID="ddlCriterio" runat="server" CssClass="form-control" />
        </div>
        <div class="col-3">
            <asp:Label Text="Filtro" runat="server" />
            <asp:TextBox ID="txtFiltroAvanzado" runat="server" CssClass="form-control" />
        </div>
        <div class="col-3 mb-3">
            <asp:Label Text="Estado" runat="server" />
            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                <asp:ListItem Text="Todos" />
                <asp:ListItem Text="Activo" />
                <asp:ListItem Text="Inactivo" />
            </asp:DropDownList>
        </div>
        <div class="col-3 mb-3">
            <asp:Button ID="btnBuscar" Text="Buscar" runat="server" CssClass="btn btn-primary" />

        </div>
    </div>
    <%//}%>

    <%-- Listado de pokemon --%>
    <asp:GridView ID="dgvArticulos" runat="server" CssClass="table" DataKeyNames="Id"
        AutoGenerateColumns="false"
      
        AllowPaging="true" PageSize="5">
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Código" DataField="Codigo" />
            <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" />

            <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
            <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="Modificar" />

        </Columns>
    </asp:GridView>
    <a href="FormularioArticulos.aspx" class="btn btn-primary">Agregar</a>


</asp:Content>
