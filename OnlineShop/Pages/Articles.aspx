<%@ Page Title="Tin tức" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="OnlineShop.Pages.Articles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SlideContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div class="content_top">
            <div class="heading">
                <h3>Tin tức</h3>
            </div>
            <div class="see">
            </div>
            <div class="clear"></div>
        </div>
        <asp:ListView ID="lvTinTuc" runat="server" DataSourceID="objSourceTinTuc">

            <EmptyDataTemplate>
                <table style="">
                    <tr>
                        <td>Chưa có bài viết nào.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
      
            <ItemTemplate>
                <div class="image group">
                    <div class="grid images_3_of_1">
                        <img src="<%# Eval("Image") %>" alt="" />
                    </div>
                    <div class="grid news_desc">
                        <h3><a href="/Pages/PostContent?id=<%# Eval("ID") %>"><%# Eval("Name") %></a></h3>
                        <h4>Đăng lúc <%# Eval("CreatedDate") %> bởi <span><a href="#"><%# Eval("CreatedBy") %></a></span></h4>
                        <%# Eval("Description") %>
                    </div>
                </div>

            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server">
                    <div id="itemPlaceholder" runat="server"></div>
                </div>
                <div class="text-center clear">
                    <asp:DataPager PageSize="5" ID="DataPager1" QueryStringField="trang" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            <asp:NumericPagerField CurrentPageLabelCssClass="btn btn-primary" NumericButtonCssClass="btn btn-default" />
                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-default" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="objSourceTinTuc" runat="server" SelectMethod="GetList" TypeName="Model.Dao.ContentDao"></asp:ObjectDataSource>
      
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
