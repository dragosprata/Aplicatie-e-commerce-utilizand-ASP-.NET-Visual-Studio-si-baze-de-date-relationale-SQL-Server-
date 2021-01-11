<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpannel.aspx.cs" Inherits="EcommerceApp.View.Admin.adminpannel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>   
    <!--include jQuery Validation Plugin-->  
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js" type="text/javascript"></script>

    <link href="../../css/bootstrap-theme.css" rel="stylesheet" />
    <link href="../../css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../../css/bootstrap.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />

    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
    font-family: "Lato", sans-serif;
}

.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Post an add</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">View or manage adds</asp:LinkButton>
            </div>

            <h3 Style="float:right"><asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#33CC33"></asp:Label></h3>
            <h4 Style="float:right">  <asp:Button ID="Button2" runat="server" Text="LogOut" OnClick="Button2_Click" BackColor="#CC0000" ForeColor="White" Width="104px" /> </h4>
            <h2 style align="center">Admin Panel</h2>
            <p></p>
            <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>

            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <div style="width:500px; height:700px;margin:0 auto;">
                        <h1>Post a new add</h1>
                        <table class="auto-style1 table table-bordered table-responsive progress-striped">
                            <tr>
                                <td>Select category</td>
                                <td><asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="130px" DataSourceID="SqlDataSource1" DataTextField="cat_name" DataValueField="cat_id"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>Product name</td>
                                <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Date</td>
                                <td><asp:TextBox ID="TextBox2" runat="server" ReadOnly="true"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Product price</td>
                                <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Product image</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ecom %>" SelectCommand="SELECT * FROM [tbl_product_category]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Button ID="Button1" runat="server" Text="Post" OnClick="Button1_Click" /></td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="" ForeColor="Red"></asp:Label>
                                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">View this add</asp:LinkButton>
                                </td>
                            </tr>
                        </table>



                    </div>
                </asp:View>

                <asp:View ID="View2" runat="server">
                    <div style="width:500px; height:700px;margin:0 auto;">
                        <h1 style="text-align:center">Manage your adds</h1>
                        <asp:GridView ID="GridView1" runat="server" Height="182px" Width="502px" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="pro_id" DataSourceID="SqlDataSource2">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="pro_fk_ad" HeaderText="pro_fk_ad" SortExpression="pro_fk_ad" />
                                <asp:BoundField DataField="pro_status" HeaderText="pro_status" SortExpression="pro_status" />
                                <asp:BoundField DataField="pro_price" HeaderText="pro_price" SortExpression="pro_price" />
                                <asp:BoundField DataField="pro_posted_date" HeaderText="pro_posted_date" SortExpression="pro_posted_date" />
                                <asp:BoundField DataField="pro_name" HeaderText="pro_name" SortExpression="pro_name" />
                                <asp:BoundField DataField="pro_id" HeaderText="pro_id" InsertVisible="False" ReadOnly="True" SortExpression="pro_id" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ecom %>" DeleteCommand="DELETE FROM [tbl_product_items] WHERE [pro_id] = @pro_id" InsertCommand="INSERT INTO [tbl_product_items] ([pro_fk_ad], [pro_status], [pro_price], [pro_posted_date], [pro_name]) VALUES (@pro_fk_ad, @pro_status, @pro_price, @pro_posted_date, @pro_name)" SelectCommand="SELECT [pro_fk_ad], [pro_status], [pro_price], [pro_posted_date], [pro_name], [pro_id] FROM [tbl_product_items] WHERE ([pro_fk_ad] = @pro_fk_ad)" UpdateCommand="UPDATE [tbl_product_items] SET [pro_fk_ad] = @pro_fk_ad, [pro_status] = @pro_status, [pro_price] = @pro_price, [pro_posted_date] = @pro_posted_date, [pro_name] = @pro_name WHERE [pro_id] = @pro_id">
                            <DeleteParameters>
                                <asp:Parameter Name="pro_id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="pro_fk_ad" Type="Int32" />
                                <asp:Parameter Name="pro_status" Type="Int32" />
                                <asp:Parameter Name="pro_price" Type="Double" />
                                <asp:Parameter DbType="Date" Name="pro_posted_date" />
                                <asp:Parameter Name="pro_name" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="pro_fk_ad" SessionField="admin_id" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="pro_fk_ad" Type="Int32" />
                                <asp:Parameter Name="pro_status" Type="Int32" />
                                <asp:Parameter Name="pro_price" Type="Double" />
                                <asp:Parameter DbType="Date" Name="pro_posted_date" />
                                <asp:Parameter Name="pro_name" Type="String" />
                                <asp:Parameter Name="pro_id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </div>
                </asp:View>
            </asp:MultiView>
                
                
        </div>
    </form>

    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }
        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }
    </script>
</body>
</html>
