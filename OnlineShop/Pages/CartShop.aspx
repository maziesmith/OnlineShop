<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CartShop.aspx.cs" Inherits="OnlineShop.Pages.CartShop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SlideContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
    <div class="section group">
       <% if ((Session["cartshop"] as List<OnlineShop.Models.CartItem>).Count > 0)
           {  %>
            <table class="table">
                <thead>
                    <tr>
                        <td>Mã SP</td>
                        <td>Tên SP</td>
                        <td>Ảnh SP</td>
                        <td>Số lượng</td>
                        <td>Đơn giá</td>
                        <td>Thành tiền</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repeaterCartShop" runat="server" ItemType="OnlineShop.Models.CartItem" SelectMethod="GetCartShop">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Product.ID") %></td>
                                <td><%# Eval("Product.Name") %></td>
                                <td>
                                    <img src="<%# Eval("Product.Image") %>" width="100" /></td>
                                <td>
                                    <input type="text" class="txtQuantity" data-id="<%# Eval("Product.ID") %>" value="<%# Eval("Quantity") %>" /></td>
                                <td><%# Eval("Product.Price") %></td>
                                <td><%# (decimal)Eval("Product.Price") * (int)Eval("Quantity") %></td>
                                <td><a href="#" data-id="<%# Eval("Product.ID") %>" class="btn-delete">Xoá</a></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                       
                </tbody>
            </table>

            <button id="btnContinue" class="btn">Tiếp tục mua hàng</button>
            <button id="btnUpdate" class="btn">Cập nhật giỏ hàng</button>
            <button id="btnDeleteAll" class="btn">Xoá giỏ hàng</button>
            <button id="btnPayment" class="btn">Thanh toán</button>
        <% } else
        { %>
        
            <span class="alert alert-danger">Chưa có sản phẩm nào trong giỏ hàng</span>
        <%}  %>

    </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="/assets/client/js/controller/cartController.js"></script>
</asp:Content>
