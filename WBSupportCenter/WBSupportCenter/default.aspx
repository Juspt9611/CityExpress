<%@ Page Title="" Language="C#" MasterPageFile="~/Sesion.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WBSupportCenter.vistas.Sesion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #contenedorh1 {
            text-align: center !important;
            margin: 0 auto;
        }
    </style>
    <div class="col-lg-3"></div>
    <div class="card card-container col-lg-6">

        <div id="contenedorh1">
            <h1 style="color: #FFF;">Support<span style="color: #fcea1d; width: 200px;">Center</span></h1>
        </div>

        <br />
        <p id="profile-name" class="profile-name-card"></p>
        <asp:TextBox type="text" ID="Usuario" runat="server" required="" class="form-control" placeholder="Usuario" Style="background-color: rgba(0, 0, 0, 0.72); border-color: #77DAD5; color: #fff; font-size: 20px;" focus></asp:TextBox>
        <asp:Label ID="ErrUsu" runat="server" Text="" Style="color: red; font-size: 18px"></asp:Label>
        <br />
        <br />
        <asp:TextBox type="password" ID="contrasena" runat="server" required="" class="form-control" placeholder="Contraseña" Style="background-color: rgba(0, 0, 0, 0.72); border-color: #77DAD5; color: #fff; font-size: 20px;"></asp:TextBox>
        <asp:Label ID="Errpass" runat="server" Text=""></asp:Label>
        <br />
        <br />

        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <asp:Button ID="Button1" runat="server" Text="Entrar" class="btn btn-lg btn-primary btn-block btn-signin" Style="border-radius: 50px;" OnClick="Button1_Click" />
        </div>
        <div class="col-lg-3"></div>

    </div>

    <div class="col-lg-3"></div>

</asp:Content>
