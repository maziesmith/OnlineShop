<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductCategory.ascx.cs" Inherits="OnlineShop.UControls.ProductCategory" %>
<h3>Danh mục sản phẩm</h3>
<asp:ListView ID="lvProductCategory" runat="server" DataSourceID="objSourceProductCategory">

    <EmptyDataTemplate>
        Chưa có loại sản phẩm nào
    </EmptyDataTemplate>
    <ItemTemplate>
        <li >
            <a href="/Pages/Products.aspx?categoryID=<%# Eval("ID") %>"><%# Eval("Name") %></a>
        </li>
    </ItemTemplate>
    <LayoutTemplate>
        <ul id="itemPlaceholderContainer" runat="server" >
            <li runat="server" id="itemPlaceholder" />
        </ul>
    </LayoutTemplate>

</asp:ListView>
<asp:ObjectDataSource ID="objSourceProductCategory" runat="server" SelectMethod="ListAll" TypeName="Model.Dao.ProductCategoryDao"></asp:ObjectDataSource>