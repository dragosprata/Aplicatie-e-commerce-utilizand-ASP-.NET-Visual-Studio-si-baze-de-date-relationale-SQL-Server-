<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="EcommerceApp.View.User.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/slider.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript" src="js/startstop-slider.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <div class="row" style="width:100%;margin:20px;min-height:1000px;">

        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <div style="width:20%;float:left;margin-left:5px;">
					 <%--<a href=""><img src="../../images/slide-3-image.jpg" alt="" style="width:250px;height:250px"/></a>--%>
                    <asp:Image ID="Image1" runat="server" style="width:220px;height:250px" ImageUrl='<%# Eval("pro_image")%>'/>
					 <h2><p><span class="rupees"><asp:Label ID="Label2" runat="server" Text='<%# Eval("pro_name")%>'></asp:Label></span></p></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">$ <asp:Label ID="Label1" runat="server" Text='<%# Eval("pro_price")%>'></asp:Label></span></p>
					    </div>
					       		<div class="add-cart">								
									<%--<h4><a href="preview.html">Add to Cart</a></h4>--%>
                                    <h4><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("pro_id","~/View/User/productdetails.aspx?view={0}") %>'>View Details</asp:HyperLink></h4>

							     </div>
							 <div class="clear"></div>
					</div>
				</div>
            </ItemTemplate>
        </asp:Repeater>
	</div>

    <asp:Repeater ID="rptPager" runat="server">
        <ItemTemplate>
            <ul class="pagination">
                <li>
                    <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                    CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
                    OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                </li>
            </ul>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
