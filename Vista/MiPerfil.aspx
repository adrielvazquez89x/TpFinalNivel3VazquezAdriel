<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Vista.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="generalContainer">
        <h2 class="text-center">Perfil de Usuario</h2>
        <asp:Label Text="text" ID="lblPrueba" runat="server" />
        <div class="profileContainer boxShadow">
            <!-- Datos del usuario -->
            <div class="formProfileContainer">
                <h3 class="text-center">Mis Datos</h3>
                <div>
                    <label for="txtEmail" class="form-label">Email:</label>
                    <asp:TextBox runat="server" ID="txtEmail" type="email" placeholder="Ingrese su email" CssClass="form-control" />
                </div>

                <div>
                    <label for="txtNombre" class="form-label">Nombre:</label>
                    <asp:TextBox runat="server" ID="txtNombre" placeholder="Ingrese su nombre" CssClass="form-control" />
                </div>

                <div>
                    <label for="txtApellido" class="form-label">Apellido:</label>
                    <asp:TextBox runat="server" ID="txtApellido" placeholder="Ingrese su apellido" CssClass="form-control" />
                </div>
                <div>
                    <asp:Button runat="server" ID="btnEnviar" Text="Enviar" CssClass="btn btn-primary mt-5" />
                </div>
            </div>
            <!-- Imagen de perfil -->

            <div class="formImageContainer">
                <h3 class="text-center">Imagen de perfil</h3>

                <div>
                    <label class="form-label">Cargar imágen de perfil</label>
                    <div class="d-flex flex-column">
                        <asp:RadioButton Text="Cargar por URL" ID="rdbUrl" runat="server" GroupName="imagenPerfil" CssClass="mx-2" />
                        <asp:RadioButton Text="Cargar imagen local" ID="rdbLocal" runat="server" GroupName="imagenPerfil" CssClass="mx-2" />

                    </div>
                </div>

                <label for="txtUrlImagen" class="form-label">URL:</label>
                <div>
                    <asp:TextBox runat="server" ID="txtUrlImagen" placeholder="Ingrese la URL de su imagen de perfil" CssClass="form-control mb-4" />
                    <input type="file" id="txtImagen" runat="server" class="form-control" />

                </div>
                <asp:Image ID="imgNuevoPerfil" ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg"
                    runat="server" CssClass="img-fluid pb-3 mt-4" Width="50%" />
            </div>
        </div>
    </div>
</asp:Content>











