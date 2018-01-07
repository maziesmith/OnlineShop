<%@ Page Title="Danh sách đơn hàng" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineShop.Admin.Pages.QLDonHang.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
        <!--Begin Datatables-->
    <div class="row">
        <div class="col-lg-12">
            <div class="box">
                <header>
                    <div class="icons"><i class="fa fa-table"></i></div>
                    <h5><%: Page.Title %></h5>
                </header>
                <div id="collapse4" class="body">
                    <asp:ListView DataKeyNames="ID" ID="ListView1" runat="server"  DataSourceID="LinqDataSource1">
                       
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>Chưa có đơn hàng nào.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <tr class="<%# (int)Eval("Status") == 1 ? "bg-success" : "bg-default" %>">
                                <td>
                                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Eval("CreatedDate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ShipNameLabel" runat="server" Text='<%# Eval("ShipName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ShipMobileLabel" runat="server" Text='<%# Eval("ShipMobile") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ShipAddressLabel" runat="server" Text='<%# Eval("ShipAddress") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ShipEmailLabel" runat="server" Text='<%# Eval("ShipEmail") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                                </td>
                                <td>
                                    <a class="btn btn-default btn-sm" href="Edit.ashx?ID=<%# Eval("ID") %>">Edit Status</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="table-responsive">
                                <table class="table table-bordered "  >
                                <thead runat="server">
                                    <tr runat="server" >
                                        <th runat="server">ID</th>
                                        <th runat="server">Ngày đặt</th>
                                        <th runat="server">Tên KH</th>
                                        <th runat="server">SĐT</th>
                                        <th runat="server">Địa chỉ</th>
                                        <th runat="server">Email</th>
                                        <th runat="server">Status</th>
                                        <th runat="server"></th>
                                    </tr>
                                </thead>
                                <tbody runat="server" id="itemPlaceholderContainer">
                                     <tr id="itemPlaceholder" runat="server">
                                     </tr>
                                </tbody>
                                <tfoot runat="server">
                                    <tr runat="server">
                                        <td runat="server" colspan="8" class="text-center">
                                            <asp:DataPager QueryStringField="page" ID="DataPager1" runat="server">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-default btn-sm" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    <asp:NumericPagerField NumericButtonCssClass="btn btn-default btn-sm" CurrentPageLabelCssClass="btn btn-primary btn-sm"  />
                                                    <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-default btn-sm" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                            </div>
                            
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="Model.EF.OnlineShopDbContext" EntityTypeName="" OrderBy="Status, ID" TableName="Orders" EnableUpdate="True"></asp:LinqDataSource>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <!--End Datatables-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">

</asp:Content>
