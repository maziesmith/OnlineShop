<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderCart.ascx.cs" Inherits="OnlineShop.UControls.HeaderCart" %>
<div class="cart">
    <p>
        Chào mừng bạn đến với website <span>Giỏ hàng:</span><div id="dd" class="wrapper-dropdown-2">
            <span id="tongsoluongtronggio"><%: (Session["cartshop"] as List<OnlineShop.Models.CartItem>).Sum(m=>m.Quantity)  %></span> sản phẩm
            <ul class="dropdown">
                <% if ((Session["cartshop"] as List<OnlineShop.Models.CartItem>).Count == 0)
                         { %>   
                <li>Chưa có sản phẩm trong giỏ</li>
                <% }
                         else
                         { %>
                <asp:Repeater ID="repeaterCartShop" runat="server" ItemType="OnlineShop.Models.CartItem" SelectMethod="GetCartShop">
                    <ItemTemplate>
                        <li><%# Eval("Quantity") %> sản phẩm <b class="text-primary"><%# Eval("Product.Name") %></b> </li>
                    </ItemTemplate>
                </asp:Repeater>
                <% } %>
            </ul>
        </div>
    </p>
</div>