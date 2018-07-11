<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="dungthuchiendetai.aspx.cs" Inherits="NKCH.dungthuchiendetai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">
                    THÔNG TIN XIN DỪNG THỰC HIỆN ĐỀ TÀI
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
                            <label class="col-sm-3 control-label">Mã thuyết minh</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtmadetai" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Tên đề tài</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txttendetai" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Lí do</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtlido" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Kinh phí đã nhận</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtkinhphidanhan" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Kinh phí hoàn lại (nếu có)</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtkinhphihoanlai" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </asp:Content>
