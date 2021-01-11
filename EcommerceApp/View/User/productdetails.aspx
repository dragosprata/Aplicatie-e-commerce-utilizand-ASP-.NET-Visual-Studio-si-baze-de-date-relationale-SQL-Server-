<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="productdetails.aspx.cs" Inherits="EcommerceApp.View.User.productdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="../../css/bootstrap.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />

    <div class="row">
        <div class="col-sm-4" style="height:500px">
            <asp:Image ID="Image1" runat="server" CssClass="img-rounded img-responsive" Style="width:300px;height:300px; margin-top:20px"/>
        </div>

        <div class="col-sm-8" style="height:500px">
            <h1>Name: <asp:Label ID="Label1" runat="server" Text="Product Name"></asp:Label></h1>
            <h2>Date: <asp:Label ID="Label2" runat="server" Text="Price"></asp:Label></h2>
            <h2>Price: <asp:Label ID="Label3" runat="server" Text="Phone"></asp:Label></h2>
            <h2>Email: <asp:Label ID="Label4" runat="server" Text="Posted by:"></asp:Label></h2>
            <h2>Contact: <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></h2>
        </div>
    </div>

</asp:Content>