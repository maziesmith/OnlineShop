<%@ Page  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="OnlineShop.Pages.Products" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div class="content_top">
            <div class="heading">
                <h3 id="tieude" runat="server"></h3>
            </div>
            <div class="clear"></div>
        </div>
        <asp:ListView ID="lvProducts"  runat="server" DataSourceID="objSourceProducts" GroupItemCount="4">
      
            <EmptyDataTemplate>
                <p class="text-center" runat="server"><br /><b>Chưa có sản phẩm</b></p>
            </EmptyDataTemplate>
         
            <GroupTemplate>
                <div id="itemPlaceholderContainer" runat="server" class="section group">
                    <div id="itemPlaceholder" runat="server"></div>
                </div>
            </GroupTemplate>

            <ItemTemplate>
                <div class="grid_1_of_4 images_1_of_4" runat="server">
                    <a href="/Pages/ProductDetail?id=<%# Eval("ID") %>">
                        <img src="<%# Eval("Image") %>" alt="<%# Eval("Name") %>" /></a>
                    <h2><%# Eval("Name") %></h2>
                    <div class="price-details">
                        <div class="price-number">
                            <p><span class="rupees"><%# Eval("Price") == null ? "Liên hệ" : Eval("Price","{0:#,##0}").Replace(',','.') + "đ" %></span></p>
                        </div>
                        <div class="add-cart">
                            <h4><a href="/Pages/CartShop?action=add&productId=<%# Eval("ID") %>&quantity=1">Thêm vào giỏ</a></h4>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="groupPlaceholderContainer" runat="server">
                    <div id="groupPlaceholder" runat="server"></div>
                </div>
                <div class="clear"></div>
                <div style="text-align:center;margin:20px auto">
                    <asp:DataPager QueryStringField="page" ID="DataPager1" runat="server" PageSize="8">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="btn btn-default" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            <asp:NumericPagerField NumericButtonCssClass="btn btn-default" CurrentPageLabelCssClass="btn btn-primary" />
                            <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="btn btn-default" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="objSourceProducts" runat="server" SelectMethod="ListAll" TypeName="Model.Dao.ProductDao"></asp:ObjectDataSource>
      
        <asp:ObjectDataSource ID="objSourceProductByCategory" runat="server" SelectMethod="ListByCategoryId" TypeName="Model.Dao.ProductDao">
            <SelectParameters>
                <asp:QueryStringParameter Name="categoryID" QueryStringField="categoryID" Type="Int64" />
            </SelectParameters>
        </asp:ObjectDataSource>
      
    </div>
</asp:Content>
