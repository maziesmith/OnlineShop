<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineShop._Default" %>

<%@ Register Src="~/UControls/ProductCategory.ascx" TagPrefix="uc1" TagName="ProductCategory" %>


<asp:Content ID="SlideContent" ContentPlaceHolderID="SlideContent" runat="server">
      <div class="header_slide">
        <div class="header_bottom_left">
            <div class="categories">
                <uc1:ProductCategory runat="server" ID="ProductCategory" />
            </div>
        </div>
        <div class="header_bottom_right">
            <div class="slider">
                <div id="slider">
                    <div id="mover">
                        <asp:Repeater ID="repeaterSlide" runat="server" DataSourceID="pbjSourceSlides">
                            <ItemTemplate>
                                <div class="slide">
                                    <div class="slider-img">
                                        <a href="<%# Eval("Link") %>">
                                            <img src="<%# Eval("Image") %>" alt="learn more" /></a>
                                    </div>
                                    <div class="slider-text">
                                        <h1>CỰC SHOCK<br>
                                            <span>SALE</span></h1>
                                        <h2>Giảm giá đến 20%</h2>
                                        <div class="features_list">
                                            <h4>Tìm hiểu thêm về dịch vụ của chúng tôi bằng cách click vào đây</h4>
                                        </div>
                                        <a href="/san-pham" class="button">Xem ngay</a>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="pbjSourceSlides" runat="server" SelectMethod="ListAll" TypeName="Model.Dao.SlideDao"></asp:ObjectDataSource>
                       <%-- @foreach (var item in slides)
                        {
                            <div class="slide">
                                <div class="slider-img">
                                    <a href="@item.Link"><img src="@item.Image" alt="learn more" /></a>
                                </div>
                                <div class="slider-text">
                                    <h1>Clearance<br><span>SALE</span></h1>
                                    <h2>UPTo 20% OFF</h2>
                                    <div class="features_list">
                                        <h4>Get to Know More About Our Memorable Services Lorem Ipsum is simply dummy text</h4>
                                    </div>
                                    <a href="preview.html" class="button">Shop Now</a>
                                </div>
                                <div class="clear"></div>
                            </div>
                        }--%>

                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
    </div>

</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="content">
    <div class="content_top">
        <div class="heading">
            <h3>Sản phẩm mới</h3>
        </div>
        <div class="see">
            <p><a href="/san-pham">Xem tất cả</a></p>
        </div>
        <div class="clear"></div>
    </div>
    <div class="section group">
        <asp:Repeater ID="repeaterlistNewProducts" runat="server" DataSourceID="objSourcelistNewProducts">
            <ItemTemplate>
                <div class="grid_1_of_4 images_1_of_4">
                    <a href="/Pages/ProductDetail.aspx?id=<%# Eval("ID") %>">
                        <img src="<%# Eval("Image") %>" alt="<%# Eval("Name") %>" /></a>
                    <h2><%# Eval("Name") %></h2>
                    <div class="price-details">
                        <div class="price-number">
                            <p><span class="rupees"><%# Eval("Price") == null ? "Liên hệ" : Eval("Price","{0:#,##0}").Replace(',','.') + "đ" %></span></p>
                        </div>
                        <div class="add-cart">
                            <h4><a href="/them-gio-hang?productId=<%# Eval("ID") %>&quantity=1">Thêm vào giỏ</a></h4>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="objSourcelistNewProducts" runat="server" SelectMethod="ListNewProduct" TypeName="Model.Dao.ProductDao">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="top" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
     
    </div>
    <div class="content_bottom">
        <div class="heading">
            <h3>Sản phẩm hot</h3>
        </div>
        <div class="see">
            <p><a href="/san-pham">Xem tất cả</a></p>
        </div>
        <div class="clear"></div>
    </div>
    <div class="section group">
        <asp:Repeater ID="repeaterlistFeatureProducts" runat="server" DataSourceID="objSourcelistFeatureProducts">
            <ItemTemplate>
                <div class="grid_1_of_4 images_1_of_4">
                <a href="/Pages/ProductDetail.aspx?id=<%# Eval("ID") %>"><img src="<%# Eval("Image") %>" alt="<%# Eval("Name") %>" /></a>
                <h2><%# Eval("Name") %></h2>
                <div class="price-details">
                    <div class="price-number">
                        <p><span class="rupees"><%# Eval("Price") == null ? "Liên hệ" : Eval("Price","{0:#,##0}").Replace(',','.') + "đ" %></span></p>
                    </div>
                    <div class="add-cart">
                        <h4><a href="/them-gio-hang?productId=<%# Eval("ID") %>&quantity=1">Thêm vào giỏ</a></h4>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="objSourcelistFeatureProducts" runat="server" SelectMethod="ListFeatureProduct" TypeName="Model.Dao.ProductDao">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="top" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</div>
</asp:Content>
