<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="OnlineShop.Admin.Pages.QLHopThu.Delete" %>


<form id="form1" runat="server">
    <asp:repeater id="repeater" runat="server" datasourceid="LinqDataSource1" itemtype="Model.EF.Feedback">
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
    </asp:repeater>
                        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="Model.EF.OnlineShopDbContext" EntityTypeName="" OrderBy="Status desc, ID desc" TableName="Feedbacks"></asp:LinqDataSource>

</form>
