<%@ Page Title="Thêm sản phẩm" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="OnlineShop.Admin.Pages.QLSanPham.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.theme.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/validationEngine.jquery.min.css">
    <style>
        .form-control.col-lg-6 {
            width: 50% !important;
        }
        .labelInfo{
            padding-top:7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
    <div class="col-lg-12">
        <div class="box">
            <header class="dark">
                <div class="icons"><i class="fa fa-info"></i></div>
                <h5><%: Page.Title %></h5>
                <!-- .toolbar -->
            <div class="toolbar">
              <nav style="padding: 8px;">
                  <a href="javascript:;" class="btn btn-default btn-xs collapse-box">
                      <i class="fa fa-minus"></i>
                  </a>
                  <a href="javascript:;" class="btn btn-default btn-xs full-box">
                      <i class="fa fa-expand"></i>
                  </a>
                  <a href="javascript:;" class="btn btn-danger btn-xs close-box">
                      <i class="fa fa-times"></i>
                  </a>
              </nav>
            </div>            <!-- /.toolbar -->

            </header>
                <asp:FormView ValidateRequestMode="Disabled" ID="frmCreateSanPham" DefaultMode="Insert" runat="server" RenderOuterTable="false" ItemType="Model.EF.Product"  DataSourceID="objSourceSanPham" OnItemInserting="frmCreateSanPham_ItemInserting"  >
                    <InsertItemTemplate>
                        <div id="collapse2" class="body">
                            <div class="form-horizontal" id="popup-validation">


                                <div class="form-group">
                                    <label class="control-label col-lg-4">Tên sản phẩm</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="tenSPTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Name") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="themsp" ControlToValidate="tenSPTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên sản phẩm không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Chọn hình đại diện</label>
                                    <div class="col-lg-4">
                                        <asp:FileUpload ID="fileHinhDaiDien" CssClass="form-control" runat="server" />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ValidationGroup="themsp" ControlToValidate="fileHinhDaiDien" ErrorMessage="Bạn chưa chọn hình đại diện!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Mô tả</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="DescriptionTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Description") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="themsp" ControlToValidate="DescriptionTextBox" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mô tả không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Giá bán</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="PriceTextBox" TextMode="Number" CssClass="form-control" runat="server" Text='<%# Bind("Price") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="themsp" ControlToValidate="PriceTextBox" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Giá bán không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Số lượng tồn</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="QuantityTextBox" TextMode="Number" CssClass="form-control" runat="server" Text='<%# Bind("Quantity") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="themsp" ControlToValidate="QuantityTextBox" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Số lượng tồn không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Phân loại</label>
                                    <div class="col-lg-4">
                                        <asp:DropDownList ID="lstCategory"  CssClass="form-control" DataSourceID="objSourceCategory" DataValueField="ID" DataTextField="Name" SelectedValue='<%# Bind("CategoryID") %>' runat="server"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ValidationGroup="themsp" CssClass="text-danger" Display="Dynamic" ControlToValidate="lstCategory" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Bạn cần chọn phân loại của sản phẩm!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                              
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Trạng thái</label>
                                    <div class="col-lg-4">
                                        <asp:CheckBox ID="StatusCheckBox" runat="server" Checked='<%# Bind("Status") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Nội dung</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox TextMode="MultiLine" ClientIDMode="Static" ID="DetailTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Detail") %>' />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <asp:LinkButton ValidationGroup="themsp" CssClass="btn btn-danger" ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Tạo mới" />
                                        &nbsp;<a href="Default.aspx" class="btn btn-default">Trở về</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </InsertItemTemplate>
                </asp:FormView>
        </div>
    </div>
    <asp:ObjectDataSource ID="objSourceSanPham" runat="server" SelectMethod="ViewDetail" TypeName="Model.Dao.ProductDao" InsertMethod="Create">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:FormParameter DbType="String" FormField="Name" Name="Name" />
                <asp:FormParameter DbType="String" FormField="Description" Name="Description" />
                <asp:FormParameter DbType="Decimal" FormField="Price" Name="Price" />
                <asp:FormParameter DbType="Int32" FormField="Quantity" Name="Quantity" />
                <asp:FormParameter DbType="String" FormField="CategoryID" Name="CategoryID" />
                <asp:FormParameter DbType="String" FormField="Detail" Name="Detail" />
                <asp:FormParameter DbType="Boolean" FormField="Status" Name="Status" />
                <asp:Parameter DbType="String" Name="Image"   />
                <asp:SessionParameter DbType="String" SessionField="tkThanhVien" Name="CreatedBy" />
            </InsertParameters>
    </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="objSourceCategory" runat="server" SelectMethod="ListAll" TypeName="Model.Dao.ProductCategoryDao"></asp:ObjectDataSource>
    <!-- /.col-lg-12 -->
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/jquery.validationEngine.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/languages/jquery.validationEngine-en.min.js"></script>
    <script src="/Admin/assets/lib/jquery-validation/jquery.validate.js"></script>
    <script>
        $(function ()
        {
           Metis.formValidation();
        });
    </script>
    <script src="/Admin/ckeditor/ckeditor.js"></script>
    <script src="/Admin/ckeditor/config.js"></script>
    <script src="/Admin/ckfinder/ckfinder.js"></script>
    <script>
        var editor = CKEDITOR.replace('DetailTextBox');
        CKFinder.setupCKEditor(editor, '/ckfinder/');
    </script>
</asp:Content>
