<%@ Page Title="Hộp thư website" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineShop.Admin.Pages.QLHopThu.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/css/dataTables.bootstrap.min.css">
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
                    <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                        <thead>
                            <tr>
                                <th class="text-center">
                                    <input id="checkall" type="checkbox" /></th>
                                <th>Mã số</th>
                                <th>Tên khách hàng</th>
                                <th>SĐT</th>
                                <th>Email</th>
                                <th>Địa chỉ</th>
                                <th>Nội dung</th>
                                <th>Ngày gửi</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                            <asp:Repeater ID="repeater" runat="server" DataSourceID="LinqDataSource1" ItemType="Model.EF.Feedback">
                                <ItemTemplate>
                                    <tr>
                                        <td class="text-center">
                                            <input class="check" type="checkbox" name="check" value="<%# Eval("ID") %>" />
                                        </td>
                                        <td>
                                            <%# Eval("ID") %>
                                        </td>
                                        <td>
                                            <b><%# Eval("Name") %></b>
                                        </td>
                                        <td>
                                            <%# Eval("Phone") %>
                                        </td>
                                        <td>
                                            <%# Eval("Email") %>
                                        </td>
                                        <td>
                                            <%# Eval("Address") %>
                                        </td>
                                        <td>
                                            <%# Eval("Content") %>
                                        </td>
                                        <td>
                                            <%# Eval("CreatedDate","{0:dd/MM/yyyy hh:mm tt}") %> 
                                        </td>
                                        <td>
                                            <%# Eval("Status") != null && (bool)Eval("Status") == true ? "<a href='#' class='btn btn-success btn-xs'>Đã xác nhận</a>" : "<a title='Click để xác nhận thư' href='Edit?ID="+Eval("ID")+"' class='btn btn-default btn-xs'>Chưa xác nhận</a>"  %>  
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td class="text-center">
                                    <button id="btnXoaThu" type="button" class="btn btn-danger btn-sm">Xóa thư</button>
                                </td>
                                <td colspan="8"></td>
                            </tr>
                        </tfoot>
                    </table>
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="Model.EF.OnlineShopDbContext" EntityTypeName="" OrderBy="Status desc, ID desc" TableName="Feedbacks"></asp:LinqDataSource>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <!--End Datatables-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script>
        $(function () {
            $("#checkall").change(function () {
                if ($(this).prop("checked") == true) {
                    $("input[name=check]").prop("checked", true);
                }
                else {
                    $("input[name=check]").prop("checked", false);
                }
            });
            $(document).on("click", "#btnXoaThu", function () {
                if (confirm('Xác nhận xóa các thư được chọn?') == true) {
                    var dsXoa = Array();
                    var check = $(".check:checkbox:checked");
                    if (check.size() > 0) {
                        $.each(check, function (index, element) {
                            dsXoa.push(element.value);
                        })
                        $.ajax({
                            url: "/Admin/Pages/QLHopThu/Delete",
                            method: "Post",
                            data: { "dsXoa": dsXoa },
                            success: function (html) {
                                $("#tbody").html(html);
                            },
                            error: function () {
                                console.log("error ajax!");
                            }
                        });
                    }
                }
            });
        });
    </script>
</asp:Content>
