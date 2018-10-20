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
                                    <input type="number" min="1" step="1" class="txtQuantity" data-id="<%# Eval("Product.ID") %>" value="<%# Eval("Quantity") %>" /></td>
                                <td><%# Eval("Product.Price","{0:#,##0}").Replace(',','.') %> đ</td>
                                <td><%# ((decimal)Eval("Product.Price") * (int)Eval("Quantity")).ToString("#,##0").Replace(',','.') %> đ</td>
                                <td><a class="btn btn-default" onclick="return confirm('Xác nhận xóa sản phẩm <%# Eval("Product.Name") %> khỏi giỏi hàng?');" href="/Pages/CartShop?action=delete&productId=<%# Eval("Product.ID") %>" data-id="<%# Eval("Product.ID") %>" >Xoá</a></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>Tổng số lượng</td>
                        <td><%: (Session["cartshop"] as List<OnlineShop.Models.CartItem>).Sum(m=>m.Quantity)  %></td>
                        <td>Trị giá</td>
                        <td><%: (Session["cartshop"] as List<OnlineShop.Models.CartItem>).Sum(m=>m.Quantity * m.Product.Price).Value.ToString("#,##0").Replace(',','.') %> đ</td>
                    </tr>
                </tbody>
            </table>
            <a href="/Pages/Products" id="btnContinue" class="btn btn-default">Tiếp tục mua hàng</a>
            <button id="btnUpdate" class="btn btn-default">Cập nhật giỏ hàng</button>
            <a href="/Pages/CartShop?action=deleteall" id="btnDeleteAll" class="btn btn-default">Xoá giỏ hàng</a>
            <button type="button" data-toggle="modal" data-target="#modalCheckout" id="btnPayment" class="btn btn-default">Thanh toán</button>
            <!-- Modal -->
            <div class="modal fade" id="modalCheckout" role="dialog">
                <div class="modal-dialog modal-md">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header bg-primary">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Đặt Hàng</h4>
                        </div>
                        <div class="modal-body">
                            <h5 class="text-info">Nhập thông tin của bạn bên dưới và click Đặt Hàng. Nhân viên sẽ liên hệ với bạn để xác nhận đơn hàng và giao hàng cho bạn trong vòng 48 giờ.</h5>
                            <br />
                            <div class="form-group">
                                <label>Người nhận</label>
                                <input name="shipName" type="text" id="txtshipName" runat="server" class="form-control">
                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ValidationGroup="dathang" ControlToValidate="txtshipName" Font-Bold="true" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn chưa nhập tên người nhận"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Điện thoại</label>
                                <input name="mobile" type="text" id="txtMobile" runat="server" class="form-control">
                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ValidationGroup="dathang" ControlToValidate="txtMobile" Font-Bold="true" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn chưa nhập số điện thoại"></asp:RequiredFieldValidator>
                         </div>
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input name="address" type="text" id="txtAddress" runat="server" class="form-control">
                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ValidationGroup="dathang" ControlToValidate="txtAddress" Font-Bold="true" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bạn chưa nhập địa chỉ"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" type="text" id="txtEmail" runat="server" class="form-control">
                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="text-danger" ValidationGroup="dathang" ControlToValidate="txtEmail" Font-Bold="true" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Bạn chưa nhập email"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  CssClass="text-danger" Font-Bold="true" Display="Dynamic" ErrorMessage="Email không đúng định dạng!" runat="server" ValidationGroup="dathang" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                            </div>
                            <asp:Button ID="btnGui" OnClick="btnGui_Click" CssClass="btn btn-primary" ValidationGroup="dathang" runat="server" Text="Gửi đơn hàng" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
        <% } else
        { %>
            <div class="text-center">
               <span  class="alert alert-danger">Chưa có sản phẩm nào trong giỏ hàng</span>
            </div>
        <%}  %>

    </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="/assets/client/js/controller/cartController.js"></script>
</asp:Content>
