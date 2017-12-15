<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="OnlineShop.Pages.ProductDetail" %>

<%@ Register Src="~/UControls/ProductCategory.ascx" TagPrefix="uc1" TagName="ProductCategory" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      
    <asp:FormView ID="frmViewProductDetail" RenderOuterTable="false" runat="server" DataSourceID="objSourceProductDetail">
        <ItemTemplate>
             <div class="content">
        <div class="content_top">
                    <div class="back-links">
                        <p><a href="/">Trang chủ</a> >>>> <a href="/Pages/Products.aspx">Sản phẩm</a></p>
                    </div>
                    <div class="clear"></div>
        </div>
        <div class="section group">
            <div class="cont-desc span_1_of_2">
                <div class="product-details">
                    <div class="grid images_3_of_2">
                        <div id="container">
                            <div id="products_example">
                                <div id="products">
                                    <div class="slides_container">
                                        <a href="#" target="_blank">
                                            <img src="<%# Eval("Image") %>" alt=" " /></a>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="desc span_3_of_2">
                        <h2><%# Eval("Name") %> </h2>
                        <p><%# Eval("Description") %></p>
                        <div class="price">
                            <p>Giá: <span><%# Eval("Price") %></span></p>
                        </div>
                        <div class="share-desc">
                            <div class="share">
                                <p>Chia sẻ :</p>
                                <ul>
                                    <li><a href="#">
                                        <img src="/assets/client/images/facebook.png" alt="" /></a></li>
                                    <li><a href="#">
                                        <img src="/assets/client/images/twitter.png" alt="" /></a></li>
                                </ul>
                            </div>
                            <div class="button"><span><a href="/Pages/CartShop.aspx?action=add&productId=<%# Eval("ID") %>&quantity=1">Thêm vào giỏ</a></span></div>
                            <div class="clear"></div>
                        </div>
                        <div class="wish-list">
                            <ul>
                                <li class="wish"><a href="#">Thêm vào yêu thích</a></li>
                                <li class="compare"><a href="#">So sánh</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="product_desc">
                    <div id="horizontalTab">
                        <ul class="resp-tabs-list">
                            <li>Chi tiết</li>

                            <div class="clear"></div>
                        </ul>
                        <div class="resp-tabs-container">
                            <div class="product-desc">
                                <%# Eval("Detail") %>
                            </div>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#horizontalTab').easyResponsiveTabs({
                            type: 'default', //Types: default, vertical, accordion
                            width: 'auto', //auto or any width like 600px
                            fit: true   // 100% fit in a container
                        });
                    });
                </script>
                <div class="content_bottom">
                    <div class="heading">
                        <h3>Sản phẩm liên quan</h3>
                    </div>
                    <div class="see">
                        <p><a href="#">Xem tất cả</a></p>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="section group">
                    <asp:Repeater ID="repeaterrelatedProducts" runat="server">
                        <ItemTemplate>
                            <div class="grid_1_of_4 images_1_of_4">
                                <a href="/Pages/ProductDetail.aspx?id=<%# Eval("ID") %>">
                                    <img src="<%# Eval("Image") %>" alt=""></a>
                                <div class="price" style="border: none">
                                    <div class="add-cart" style="float: none">
                                        <h4><a href="#">Thêm vào giỏ</a></h4>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="rightsidebar span_3_of_1">
                <uc1:ProductCategory runat="server" ID="ProductCategory" />
            <div class="subscribe">
                <h2>Đăng ký nhận tin</h2>
                <p>Chúng tôi sẽ gửi bản tin vào email của bạn khi có khuyến mãi, sự kiện quan trọng từ shop  </p>
                <div class="signup">
                        <input type="text" placeholder="Nhập email"><input type="submit" value="Sign up">
                </div>
            </div>
                <div class="community-poll">
                    <h2>KHẢO SÁT NHANH</h2>
                    <p>Lý do chính để bạn mua sản phẩm trực tuyến là gì?</p>
                    <div class="poll">
                            <ul>
                                <li>
                                    <input type="radio" name="vote" class="radio" value="1">
                                    <span class="label">
                                        <label>Thuận tiện hơn </label>
                                    </span>
                                </li>
                                <li>
                                    <input type="radio" name="vote" class="radio" value="2">
                                    <span class="label">
                                        <label for="vote_2">Giá rẻ hơn</label></span>
                                </li>
                                <li>
                                    <input type="radio" name="vote" class="radio" value="3">
                                    <span class="label">
                                        <label for="vote_3">Nhiều sự lựa chọn</label></span>
                                </li>
                                <li>
                                    <input type="radio" name="vote" class="radio" value="5">
                                    <span class="label">
                                        <label for="vote_5">Bảo mật thanh toán </label>
                                    </span>
                                </li>
                               
                                <li>
                                    <input type="radio" name="vote" class="radio" value="7">
                                    <span class="label">
                                        <label for="vote_7">Khác</label></span>
                                </li>
                            </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="objSourceProductDetail" runat="server" SelectMethod="ViewDetail" TypeName="Model.Dao.ProductDao">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int64" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="objSourcerelatedProducts" runat="server" SelectMethod="ListRelatedProducts" TypeName="Model.Dao.ProductDao">
        <SelectParameters>
            <asp:QueryStringParameter Name="productId" QueryStringField="id" Type="Int64" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
