<%@ Page  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostContent.aspx.cs" Inherits="OnlineShop.Pages.PostContent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SlideContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <asp:FormView ID="frmViewPostContent" runat="server" DataSourceID="objSourcePostContent">
            <ItemTemplate>
                <div class="content_top">
                    <div class="heading">
                        <h3><%# Eval("Name") %></h3>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="section-group">
                   <%# Eval("Detail") %>
                </div>
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="objSourcePostContent" runat="server" SelectMethod="GetByID" TypeName="Model.Dao.ContentDao">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int64" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">

</asp:Content>
