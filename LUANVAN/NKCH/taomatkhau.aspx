<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="taomatkhau.aspx.cs" Inherits="NKCH.taomatkhau" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">TẠO MẬT KHẨU</div>
                <div class="panel-body">
                    <div class="form-horizontal group-border-dashed">
                        <div class="form-group">  
                            <label class="col-sm-3 control-label">ID Đăng nhập</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtid" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True" CausesValidation="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Tài Khoản</label>
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddltaikhoan" class="form-control input-sm" runat="server" Width="100%" DataSourceID="sqldsCB" DataTextField="CB_HOTEN" DataValueField="CB_ID"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Mật khẩu</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtmatkhau" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9">
                                <p class="text-right">
                                    <asp:Button ID="btnthem" runat="server" Text="Thêm" Width="103px" class="btn btn-space btn-primary" CausesValidation="False" />
                                    <asp:Button ID="btnluu" runat="server" Text="Lưu" Width="103px" class="btn btn-space btn-success" Visible="False" />
                                    <asp:Button ID="btnxoa" runat="server" Text="Xóa" Width="103px" class="btn btn-space btn-danger hover" Visible="False"  />
                                    <asp:Button ID="btnhuy" runat="server" Text="Hủy" Width="103px" class="btn btn-space btn-warning hover" Visible="False"  CausesValidation="False" UseSubmitBehavior="False" />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="sqldsCB" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="CANBO_SELECT_ALL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <div class="col-md-12">
        <div class="panel panel-default panel-border-color panel-border-color-primary">
            <div class="panel-heading panel-heading-divider">DANH SÁCH NGƯỜI DÙNG</div>
            <div class="row be-datatable-body">
                <div class="col-sm-12">
                    <asp:GridView ID="GVNguoidung" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4" GridLines="None" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                        HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" AutoGenerateColumns="False" DataSourceID="sqldsDSND">
                        <Columns>
                            <asp:CommandField SelectText="Chọn" ControlStyle-CssClass="btn btn-space btn-danger" ShowSelectButton="True" ButtonType="Button" >
<ControlStyle CssClass="btn btn-space btn-danger"></ControlStyle>
                            </asp:CommandField>
                            <asp:BoundField DataField="DN_ID" HeaderText="ID" ReadOnly="True" SortExpression="DN_ID" />
                            <asp:BoundField DataField="CB_ID" HeaderText="Tài khoản" ReadOnly="True" SortExpression="CB_ID" />
                            <asp:BoundField DataField="CB_HOTEN" HeaderText="Họ và tên" SortExpression="CB_HOTEN" />
                            <asp:BoundField DataField="DN_MATKHAU" HeaderText="Mật khẩu" SortExpression="DN_MATKHAU" />
                        </Columns>

                        <HeaderStyle CssClass="header"></HeaderStyle>

                        <PagerStyle CssClass="pager"></PagerStyle>

                        <RowStyle CssClass="rows"></RowStyle>
                    </asp:GridView>
                </div>
            </div>
            <div class="panel-body">
                <asp:SqlDataSource ID="sqldsDSND" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="DANGNHAP_SELECT_ALL" DeleteCommand="DANGNHAP_DELETE" DeleteCommandType="StoredProcedure" InsertCommand="DANGNHAP_INSERT" InsertCommandType="StoredProcedure" UpdateCommand="DANGNHAP_UPDATE" UpdateCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32"></asp:Parameter>

                        <asp:ControlParameter ControlID="txtid" Name="DN_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddltaikhoan" Name="CB_ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtmatkhau" Name="DN_MATKHAU" PropertyName="Text" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32"></asp:Parameter>

                        <asp:ControlParameter ControlID="txtid" Name="DN_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddltaikhoan" Name="CB_ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtmatkhau" Name="DN_MATKHAU" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32"></asp:Parameter>

                        <asp:ControlParameter ControlID="txtid" Name="DN_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddltaikhoan" Name="CB_ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtmatkhau" Name="DN_MATKHAU" PropertyName="Text" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
