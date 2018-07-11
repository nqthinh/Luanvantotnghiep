<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="giahandetai.aspx.cs" Inherits="NKCH.giahandetai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div role="alert" class="alert alert-success alert-icon alert-dismissible">
                <div class="icon"><span class="mdi mdi-info-outline"></span></div>
                <div class="message">
                    <strong>
                        <asp:Label ID="lb1" runat="server" Text="Lưu ý: Theo quy định của phòng Nghiên cứu Khoa học, mỗi đề tài nghiên cứu chỉ được phép gia hạn 2 lần, mỗi lần không quá 14 ngày." ForeColor="Red"></asp:Label></strong>
                </div>
            </div>
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">
                    THÔNG TIN XIN GIA HẠN ĐỀ TÀI
                    <br />
                    <div style="padding: 10px 0px 0px 0px;">
                        <p class="text-left">
                            <asp:Button ID="btnluu" runat="server" Text="Lưu thông tin" class="btn btn-space btn-success" OnClick="btnluu_Click" />
                            <asp:Button ID="btndanhsach" runat="server" Text="Đến danh sách đề tài" class="btn btn-space btn-danger hover" OnClick="btndanhsach_Click" />
                        </p>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal group-border-dashed">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">ID</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtid" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Mã Thuyết minh</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtmathuyetminh" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Tên đề tài</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txttendetai" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Thời gian gia hạn đề tài</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txttggh" class="form-control input-sm" runat="server" Width="100%" ReadOnly="False"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Nội dung phần xin gia hạn</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtnoidung" class="form-control input-sm" runat="server" Width="100%" ReadOnly="False" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Lí do</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtlido" class="form-control input-sm" runat="server" Width="100%" ReadOnly="False" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Kinh phí theo phần gia hạn</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtkinhphi" class="form-control input-sm" runat="server" Width="100%" ReadOnly="False"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <asp:SqlDataSource ID="sqldskhoa" runat="server" ConnectionString='<%$ ConnectionStrings:connString %>' SelectCommand="KHOA_SELECT_ALL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqldscanbo" runat="server" ConnectionString='<%$ ConnectionStrings:connString %>' SelectCommand="CANBO_SELECT_ALL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
