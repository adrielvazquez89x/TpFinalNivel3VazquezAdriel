<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Vista.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" />

    <div class="generalContainer">
        <h2 class="text-center" runat="server" id="saludo"></h2>
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
                    <asp:Button runat="server" ID="btnGuardar" Text="Guardar" CssClass="btn btn-primary mt-5" OnClick="btnGuardar_Click" />
                </div>
                <%
                    if (IsAnAdmin)
                    { %>
                <div class="my-5">
                    <h5 class="mb-2">Bienvenido, Administrador </h5>

                    <a href="ArticulosLista.aspx" class="btn btn-success">Adminstrar artículos</a>
                </div>
                <%}
                %>
            </div>
            <!-- Imagen de perfil -->
            <div class="formImageContainer">
                <h3 class="text-center">Imagen de perfil</h3>

                <!-- Radio btns-->
                <div>
                    <label class="form-label">Cargar imágen de perfil</label>

                    <div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="imagenPerfil" id="rdbUrl">
                            <label class="form-check-label" for="rdbUrl">
                                Cargar por URL
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="imagenPerfil" id="rdbLocal">
                            <label class="form-check-label" for="rdbLocal">
                                Cargar imagen local
                            </label>
                        </div>
                    </div>
                </div>

                <!-- URL -->
                <label for="txtUrlImagen" class="form-label">URL:</label>
                <div class="d-flex flex-column align-items-center">
                    <div>
                        <input type="text" id="txtUrlImagen" clientidmode="Static" runat="server" placeholder="Ingrese la URL de su imagen de perfil" class="form-control mb-4" readonly="true" />
                        <input type="file" id="txtImagen" clientidmode="Static" runat="server" class="form-control" disabled />
                    </div>
                    <div class="d-flex justify-content-center">
                        <asp:Image ID="imgNuevoPerfil" ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg"
                            runat="server" CssClass="img-fluid my-3" Width="50%" />
                    </div>
                </div>

                <div class="d-flex justify-content-center">
                    <asp:Button Text="Cambiar imágen de perfil" ID="btnImg" ClientIDMode="Static" OnClick="btnImg_Click" CssClass="btn btn-primary text-center" runat="server" />

                </div>

            </div>
        </div>
    </div>



</asp:Content>











