<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Vista.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <h1 class="text-center"></h1>
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <asp:Label Text="E-mail" runat="server" />
                    <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" Placeholder="Ingrésa tu dirección E-mail" CssClass="form-control" />
                    <small id="emailHelp" class="form-text text-muted">Tu información será confidencial.</small>
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" id="2" aria-describedby="emailHelp" placeholder="Enter email">
                    <small id="emailHel2p" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
