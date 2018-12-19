<%@ Page Title="" Language="C#" MasterPageFile="~/Sesion.Master" AutoEventWireup="true" CodeBehind="Sesion.aspx.cs" Inherits="WBSupportCenter.vistas.Sesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-3"></div>
    <div class="card card-container col-lg-6">

        
        <a style="text-align:center;">
            <h2 style="color:#FFF;">Support<span style="color:#fcea1d;">Center</span></h2>
        </a>
        <br />
        <img id="profile-img" class="profile-img-card" src="../recursos/StyleLogin/img/Login.png" />
        <p id="profile-name" class="profile-name-card"></p>
        <asp:TextBox type="text" ID="Usuario" runat="server" class="form-control" placeholder="Usuario" style="background-color:rgba(0, 0, 0, 0.72);border-color:#77DAD5; color:#fff;font-size:20px;" focus></asp:TextBox>
        <asp:Label ID="ErrUsu" runat="server" Text="" style="color:red;font-size:18px"></asp:Label>
        <br /><br />
        <asp:TextBox type="password" ID="contrasena" runat="server" class="form-control" placeholder="Contraseña"  style="background-color:rgba(0, 0, 0, 0.72); border-color:#77DAD5; color:#fff;font-size:20px;"></asp:TextBox>
        <asp:Label ID="Errpass" runat="server" Text=""></asp:Label>
        <br /><br />

        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <asp:Button ID="Button1" runat="server" Text="Aceptar" class="btn btn-lg btn-primary btn-block btn-signin" style="border-radius: 50px;" OnClick="Button1_Click"/>
        </div>
        <div class="col-lg-3"></div>

    </div>

    <div class="col-lg-3"></div>

</asp:Content>
