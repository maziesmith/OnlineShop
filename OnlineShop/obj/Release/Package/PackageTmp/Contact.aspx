<%@ Page Title="Liên hệ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="OnlineShop.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    #mapCanvas{
      
        height:600px;
    }
</style>
   <div class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6">
                <h2>Thông tin liên hệ</h2>
               <p>Công ty CP Online Shop</p><p>Địa chỉ: Số 1 Quang Trung Hà Đông </p> <p>Điện thoại: 04 6523 5342</p>

                <br />
                <h2>Gửi thông tin</h2>
                <asp:Label ID="lblThongbao" Visible="False" runat="server" Font-Bold="True"></asp:Label>
                    <div class="form-group">
                        <label>Họ tên</label>
                        <input type="text" id="txtName" runat="server" class="form-control" />
                        &nbsp; <asp:RequiredFieldValidator CssClass="text-danger" Font-Bold="true" Display="Dynamic" ErrorMessage="Cần phải nhập tên!" ID="requiredName" runat="server" ValidationGroup="lienhe" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Điện thoại</label>
                        <input type="text" id="txtMobile" runat="server" class="form-control" />
                        &nbsp; <asp:RequiredFieldValidator CssClass="text-danger" Font-Bold="true" Display="Dynamic" ErrorMessage="Cần phải nhập điện thoại!" ID="requiredDienThoai" runat="server" ValidationGroup="lienhe" ControlToValidate="txtMobile"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Địa chỉ</label>
                        <input type="text" id="txtAddress" runat="server" class="form-control" />
                        &nbsp; <asp:RequiredFieldValidator CssClass="text-danger" Font-Bold="true" Display="Dynamic" ErrorMessage="Cần phải nhập địa chỉ!" ID="requiredAddress" runat="server" ValidationGroup="lienhe" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" id="txtEmail" runat="server" class="form-control" />
                        &nbsp; <asp:RequiredFieldValidator CssClass="text-danger" Font-Bold="true" Display="Dynamic" ErrorMessage="Cần phải nhập email!" ID="requiredEmail" runat="server" ValidationGroup="lienhe" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="text-danger" Font-Bold="true" Display="Dynamic" ErrorMessage="Email không đúng định dạng!" runat="server" ValidationGroup="lienhe" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label>Nội dung</label>
                        <textarea id="txtContent" class="form-control" runat="server"></textarea>
                        &nbsp; <asp:RequiredFieldValidator CssClass="text-danger" Font-Bold="true" Display="Dynamic" ErrorMessage="Cần phải nhập nội dung!" ID="RequiredFieldValidator1" runat="server" ValidationGroup="lienhe" ControlToValidate="txtContent"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Button ID="btnGui" runat="server" CssClass="btn btn-danger" ValidationGroup="lienhe" OnClick="btnGui_Click" Text="Gửi đi" />
            </div>
            <div class="col-md-6">
                <h2>Bản đồ</h2>
                <div class="map" id="mapCanvas">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.3577590103637!2d106.69232531418318!3d10.860370260609828!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175283c0260c69f%3A0x82344320b971e9ab!2zxJDhuqFpIEjhu41jIE5ndXnhu4VuIFThuqV0IFRow6BuaA!5e0!3m2!1svi!2s!4v1513333424336" width="100%" height="600" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>
<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptContent" runat="server">

</asp:Content>