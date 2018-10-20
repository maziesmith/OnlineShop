<%@ Page Title="Thông tin sản phẩm" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="OnlineShop.Admin.Pages.QLSanPham.Info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/validationEngine.jquery.min.css">
    <style>
        .form-control.col-lg-6 {
            width: 50% !important;
        }

        .labelInfo {
            padding-top: 7px;
        }
    </style>
    <style>
        /* Style the Image Used to Trigger the Modal */

        .popupImage {
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

            .popupImage:hover {
                opacity: 0.7;
            }
        /* The Modal (background) */

        .modal-Image {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 9999; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
        }
            /* Modal Content (Image) */

            .modal-Image .modal-content {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 300px;
                height: auto;
            }
            /* Caption of Modal Image (Image Text) - Same Width as the Image */

            .modal-Image #caption {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
                text-align: center;
                color: #ccc;
                padding: 10px 0;
                height: 150px;
            }
            /* Add Animation - Zoom in the Modal */

            .modal-Image .modal-content, .modal-Image #caption {
                -webkit-animation-name: zoom;
                -webkit-animation-duration: 0.6s;
                animation-name: zoom;
                animation-duration: 0.6s;
            }

        @-webkit-keyframes zoom {

            from {
                -webkit-transform: scale(0);
            }

            to {
                -webkit-transform: scale(1);
            }
        }

        @keyframes zoom {

            from {
                transform: scale(0);
            }

            to {
                transform: scale(1);
            }
        }
        /* The Close Button */

        .modal-Image .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: #f1f1f1;
            font-size: 40px;
            font-weight: bold;
            transition: 0.3s;
        }

            .modal-Image .close:hover,
            .modal-Image .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }
        /* 100% Image Width on Smaller Screens */

        @media only screen and (max-width: 700px) {

            .modal-Image .modal-content {
                width: 100%;
            }
        }
    </style>
    <link rel="stylesheet" href="/assets/client/css/popupimage/style.css" type="text/css" />

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
                    </div>
                    <!-- /.toolbar -->

                </header>
                <asp:FormView ValidateRequestMode="Disabled"  ItemType="Model.EF.Product" ID="frmViewSanPham" runat="server" RenderOuterTable="false"  DataSourceID="objSourceSanPham" OnItemUpdating="frmViewSanPham_ItemUpdating">
                    <EditItemTemplate>
                        <div id="collapse2" class="body">
                            <div class="form-horizontal" id="popup-validation">

                                <asp:HiddenField ID="maSPHidden" Value='<%# Bind("ID") %>' runat="server" />
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Tên sản phẩm</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="tenSPTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Name") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="suasp" ControlToValidate="tenSPTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên sản phẩm không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Sửa hình đại diện</label>
                                    <div class="col-lg-4">
                                        <asp:FileUpload ID="fileHinhDaiDien" CssClass="form-control" runat="server" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Mô tả</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="DescriptionTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Description") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="suasp" ControlToValidate="DescriptionTextBox" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mô tả không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Giá bán</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="PriceTextBox" TextMode="Number" CssClass="form-control" runat="server" Text='<%# Bind("Price") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="suasp" ControlToValidate="PriceTextBox" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Giá bán không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Số lượng tồn</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="QuantityTextBox" TextMode="Number" CssClass="form-control" runat="server" Text='<%# Bind("Quantity") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="suasp" ControlToValidate="QuantityTextBox" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Số lượng tồn không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Phân loại</label>
                                    <div class="col-lg-4">
                                        <asp:DropDownList ID="lstCategory"  CssClass="form-control" DataSourceID="objSourceCategory" DataValueField="ID" DataTextField="Name" SelectedValue='<%# Bind("CategoryID") %>' runat="server"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ValidationGroup="suasp" CssClass="text-danger" Display="Dynamic" ControlToValidate="lstCategory" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Bạn cần chọn phân loại của sản phẩm!"></asp:RequiredFieldValidator>
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
                                        <asp:LinkButton CssClass="btn btn-primary" ValidationGroup="suasp" ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Cập nhật" />
                                        &nbsp;<a href="Info.aspx?id=<%# Eval("ID") %>" class="btn btn-default">Trở về</a>
                                        <p>
                                            <br />
                                            <label class="label label-info">Lưu ý: Ấn Ctrl + F5 sau khi sửa hình để xóa cache trình duyệt.</label>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div id="collapse2" class="body">
                            <div class="form-horizontal" id="popup-validation">

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Mã SP</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="maSPLabel" runat="server" Text='<%# Bind("ID") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Tên SP</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="tenSPLabel" runat="server" Text='<%# Bind("Name") %>' />
                                    </div>
                                </div>

                                 <div class="form-group">
                                    <label class="control-label col-lg-4">Mô tả</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Hình đại diện</label>
                                    <div class="col-lg-4 labelInfo">
                                        <img class="popupImage hidden" alt="<%# Eval("Name") %>" id="popupImage" src="<%# Eval("Image") %>" />
                                        <a href="javascript:document.getElementById('popupImage').click()">Xem hình</a>
                                        <!-- The Modal -->
                                        <div id="modalShowImage" class="modal-Image">
                                            <!-- The Close Button -->
                                            <span class="close">&times;</span>
                                            <!-- Modal Content (The Image) -->
                                            <img class="modal-content" id="img01" src="#" />
                                            <!-- Modal Caption (Image Text) -->
                                            <div id="caption"></div>
                                        </div>
                                    </div>
                                </div>

                                 <div class="form-group">
                                    <label class="control-label col-lg-4">Giá bán</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
                                    </div>
                                </div>

                                 <div class="form-group">
                                    <label class="control-label col-lg-4">Số lượng tồn</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Bind("Quantity") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Mã phân loại</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="categoryIDLabel" runat="server" Text='<%# Bind("CategoryID") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Ngày đăng</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="ngayDangSPLabel" runat="server" Text='<%# Bind("CreatedDate") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Thành viên đăng</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Sửa gần đây</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="ModifiedDateLabel" runat="server" Text='<%# Bind("ModifiedDate") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Thành viên sửa</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="ModifiedByLabel" runat="server" Text='<%# Bind("ModifiedBy") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Trạng thái</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Nội dung</label>
                                    <div class="col-lg-4 labelInfo">
                                        <a class="text-primary" id="btnXemNoiDung" data-toggle="modal" href="#modalXemNoiDung"><i class="glyphicon glyphicon-eye-open"></i> Xem</a>
                                            <!-- Modal -->
                                            <div id="modalXemNoiDung" class="modal fade" role="dialog">
                                                <div class="modal-dialog modal-lg">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header bg-info">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Nội dung sản phẩm</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                          <asp:Label ID="DetailLabel" runat="server" Text='<%# Bind("Detail") %>' />
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <asp:Button ID="btnSua" CssClass="btn btn-primary" runat="server" Text="Sửa" CommandName="Edit" />
                                        <a href="Default.aspx" class="btn btn-default">Trở về</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <asp:ObjectDataSource ID="objSourceSanPham" TypeName="Model.Dao.ProductDao" runat="server" SelectMethod="ViewDetail" UpdateMethod="Edit">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
                <asp:FormParameter DbType="Int32" FormField="ID" Name="ID" />
                <asp:FormParameter DbType="String" FormField="Name" Name="Name" />
                <asp:FormParameter DbType="String" FormField="Description" Name="Description" />
                <asp:FormParameter DbType="Decimal" FormField="Price" Name="Price" />
                <asp:FormParameter DbType="Int32" FormField="Quantity" Name="Quantity" />
                <asp:FormParameter DbType="String" FormField="CategoryID" Name="CategoryID" />
                <asp:FormParameter DbType="String" FormField="Detail" Name="Detail" />
                <asp:FormParameter DbType="Boolean" FormField="Status" Name="Status" />
                <asp:Parameter DbType="String" Name="Image"   />
                <asp:SessionParameter DbType="String" SessionField="tkThanhVien" Name="ModifiedBy" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="objSourceCategory" runat="server" SelectMethod="ListAll" TypeName="Model.Dao.ProductCategoryDao"></asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/jquery.validationEngine.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/languages/jquery.validationEngine-en.min.js"></script>
    <script src="/Admin/assets/lib/jquery-validation/jquery.validate.js"></script>
    <script>
        $(function () {
            Metis.formValidation();
        });
    </script>
    <script>
        $(function () {
            // Event khi người dùng click vào hình ảnh có class popupImage
            $(".popupImage").click(function () {
                var modal = document.getElementById("modalShowImage");  // Tạo biến modal lấy ra element có Id  modalShowImage
                var captionText = document.getElementById("caption");  // Tạo biến captionText lấy ra từ element có Id caption
                var modalImg = document.getElementById("img01");   // Tạo biến modalImg lấy ra từ element có Id img01
                modal.style.display = "block";    // Hiển thị  popup
                modalImg.src = $(this).attr("src");  // Gán thuộc tính src của hình ảnh trong popup
                captionText.innerHTML = $(this).attr("alt");   // Gán giá trị cho caption theo thuộc tính alt của hình
            });
            // Event khi người dùng click nút Close popup
            $(".modal-Image .close").click(function () {
                var modal = document.getElementById("modalShowImage");
                modal.style.display = 'none';  // Ẩn popup
            });
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
