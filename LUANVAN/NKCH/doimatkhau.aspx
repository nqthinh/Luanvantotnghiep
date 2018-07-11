<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="doimatkhau.aspx.cs" Inherits="NKCH.doimatkhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">THAY ĐỔI MẬT KHẨU ĐĂNG NHẬP</div>
                <div class="panel-body">
                    <div class="form-horizontal group-border-dashed">
                        <div class="form-group">  
                            <label class="col-sm-3 control-label">Tài khoản</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txttk" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Mật khẩu hiện tại</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtmkht" class="form-control input-sm" runat="server" Width="100%" ReadOnly="False"></asp:TextBox><asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Mật khẩu mới</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtmkm" class="form-control input-sm" runat="server" Width="100%" ReadOnly="False"></asp:TextBox><asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Nhập lại mật khẩu</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtnhaplaimk" class="form-control input-sm" runat="server" Width="100%" ReadOnly="False"></asp:TextBox><asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9">
                                <p class="text-right">
                                    <asp:Button ID="btnluu" runat="server" Text="Lưu" Width="103px" class="btn btn-space btn-success" Visible="True" OnClick="btnluu_Click" />
                                    <asp:Button ID="btnhuy" runat="server" Text="Hủy" Width="103px" class="btn btn-space btn-warning hover" Visible="True" OnClick="btnhuy_Click" />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:connString %>' SelectCommand="CANBO_SELECT_ALL" SelectCommandType="StoredProcedure" UpdateCommand="DANGNHAP_DOIMATKHAU" UpdateCommandType="StoredProcedure">
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtnhaplaimk" Name="DN_MATKHAU" PropertyName="Text" Type="String" />
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:ControlParameter ControlID="txtmkht" Name="MATKHAUCU" PropertyName="Text" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
