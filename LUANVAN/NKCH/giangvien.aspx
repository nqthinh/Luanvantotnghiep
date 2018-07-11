<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="giangvien.aspx.cs" Inherits="NKCH.giangvien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">THÔNG TIN GIẢNG VIÊN</div>
                <div class="panel-body">
                    <div class="form-horizontal group-border-dashed">
                        <div class="form-group">  
                            <label class="col-sm-3 control-label">Mã CB/GV</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtid" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True" CausesValidation="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Khoa</label>
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddlkhoa" class="form-control input-sm" runat="server" Width="100%" DataSourceID="sqldsKhoa" DataTextField="K_TEN" DataValueField="K_ID"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Học vị</label>
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddlhocvi" class="form-control input-sm" runat="server" Width="100%" DataSourceID="sqldsHocVi" DataTextField="HV_TEN" DataValueField="HV_ID"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Chức vụ</label>
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddlchucvu" class="form-control input-sm" runat="server" Width="100%" DataSourceID="Sqldschucvu" DataTextField="CV_TEN" DataValueField="CV_ID"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Họ và tên</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txthovaten" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Họ và tên không được để trống" ControlToValidate="txthovaten" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">CMND</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtcmnd" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="CMND không được để trống" ControlToValidate="txtcmnd" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Ngày cấp</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtngaycap" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ngày cấp không được để trống" ControlToValidate="txtngaycap" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Nơi cấp</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtnoicap" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Nơi cấp không được để trống" ControlToValidate="txtnoicap" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Email</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtemail" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email không được để trống" ControlToValidate="txtemail" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Điện thoại</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtsdt" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Điện thoại không được để trống" ControlToValidate="txtsdt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Vai trò</label>
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddlvaitro" CssClass="form-control input-sm" Width="100%" runat="server">
                                    <asp:ListItem>Cán bộ</asp:ListItem>
                                    <asp:ListItem>Giảng viên</asp:ListItem>
                                    <asp:ListItem>Admin</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9">
                                <p class="text-right">
                                    <asp:Button ID="btnthem" runat="server" Text="Thêm" Width="103px" class="btn btn-space btn-primary" OnClick="btnthem_Click" CausesValidation="False" />
                                    <asp:Button ID="btnluu" runat="server" Text="Lưu" Width="103px" class="btn btn-space btn-success" Visible="False" OnClick="btnluu_Click" />
                                    <asp:Button ID="btnxoa" runat="server" Text="Xóa" Width="103px" class="btn btn-space btn-danger hover" Visible="False" OnClick="btnxoa_Click" CausesValidation="False" />
                                    <asp:Button ID="btnhuy" runat="server" Text="Hủy" Width="103px" class="btn btn-space btn-warning hover" Visible="False" OnClick="btnhuy_Click" CausesValidation="False" UseSubmitBehavior="False" />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="sqldsKhoa" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="KHOA_SELECT_ALL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqldsHocVi" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="HOCVI_SELECT_ALL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Sqldschucvu" runat="server" ConnectionString='<%$ ConnectionStrings:connString %>' SelectCommand="CHUCVU_SELECT_ALL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <div class="col-md-12">
        <div class="panel panel-default panel-border-color panel-border-color-primary">
            <div class="panel-heading panel-heading-divider">DANH SÁCH GIẢNG VIÊN</div>
            <div class="row be-datatable-body">
                <div class="col-sm-12">
                    <asp:GridView ID="gvDSGiangVien" runat="server"  DataKeyNames="CB_ID,K_ID,HV_ID" DataSourceID="sqldsDSGiangVien" AllowPaging="True" AllowSorting="True" CellPadding="4" GridLines="None" OnSelectedIndexChanged="gvDSGiangVien_SelectedIndexChanged" CssClass="mydatagrid" PagerStyle-CssClass="pager"
HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" AutoGenerateColumns="False">
                        <Columns>
                            <asp:CommandField SelectText="Chọn" ControlStyle-CssClass="btn btn-space btn-danger" ShowSelectButton="True" ButtonType="Button" >
<ControlStyle CssClass="btn btn-space btn-danger"></ControlStyle>
                            </asp:CommandField>
                            <asp:BoundField DataField="CB_ID" HeaderText="ID" ReadOnly="True" SortExpression="CB_ID" />
                            <asp:BoundField DataField="CB_HOTEN" HeaderText="Họ và tên" SortExpression="CB_HOTEN" />
                            <asp:BoundField DataField="CB_CMND" HeaderText="CMND" SortExpression="CB_CMND" />
                            <asp:BoundField DataField="CB_NGAYCAPCMND" HeaderText="Ngày cấp" SortExpression="CB_NGAYCAPCMND" />
                            <asp:BoundField DataField="CB_NOICAPCMND" HeaderText="Nơi cấp" SortExpression="CB_NOICAPCMND" />
                            <asp:BoundField DataField="CB_SDT" HeaderText="Điện thoại" SortExpression="CB_SDT" />
                            <asp:BoundField DataField="CB_EMAIL" HeaderText="Email" SortExpression="CB_EMAIL" />
                            <asp:BoundField DataField="K_ID" HeaderText="K_ID" SortExpression="K_ID" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="K_TEN" HeaderText="Khoa" SortExpression="K_TEN" />
                            <asp:BoundField DataField="HV_ID" HeaderText="HV_ID" ReadOnly="True" SortExpression="HV_ID" Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="HV_TEN" HeaderText="Học vị" SortExpression="HV_TEN">
                            </asp:BoundField>
                            <asp:BoundField DataField="VAITRO" HeaderText="Vai trò" SortExpression="VAITRO" />
                            <asp:BoundField DataField="CV_ID" HeaderText="CV_ID" ReadOnly="True" SortExpression="CV_ID" Visible="False" />
                            <asp:BoundField DataField="CV_TEN" HeaderText="Chức vụ" SortExpression="CV_TEN" />
                        </Columns>

                        <HeaderStyle CssClass="header"></HeaderStyle>

                        <PagerStyle CssClass="pager"></PagerStyle>

                        <RowStyle CssClass="rows"></RowStyle>
                    </asp:GridView>
                </div>
            </div>
            <div class="panel-body">
                <asp:SqlDataSource ID="sqldsDSGiangVien" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="CANBO_SELECT_ALL" DeleteCommand="CANBO_DELETE" DeleteCommandType="StoredProcedure" InsertCommand="CANBO_INSERT" InsertCommandType="StoredProcedure" UpdateCommand="CANBO_UPDATE" UpdateCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:ControlParameter ControlID="txtid" Name="CB_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txthovaten" Name="CB_HOTEN" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtsdt" Name="CB_SDT" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtemail" Name="CB_EMAIL" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlkhoa" Name="K_ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlhocvi" Name="HV_ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlvaitro" Name="VAITRO" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlchucvu" Name="CV_ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtcmnd" Name="CB_CMND" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtngaycap" Name="CB_NGAYCAPCMND" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtnoicap" Name="CB_NOICAPCMND" PropertyName="Text" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:ControlParameter ControlID="txtid" Name="CB_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txthovaten" Name="CB_HOTEN" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtsdt" Name="CB_SDT" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtemail" Name="CB_EMAIL" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlkhoa" Name="K_ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlhocvi" Name="HV_ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlvaitro" Name="VAITRO" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlchucvu" Name="CV_ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtcmnd" Name="CB_CMND" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtngaycap" Name="CB_NGAYCAPCMND" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtnoicap" Name="CB_NOICAPCMND" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:ControlParameter ControlID="txtid" Name="CB_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txthovaten" Name="CB_HOTEN" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtsdt" Name="CB_SDT" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtemail" Name="CB_EMAIL" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlkhoa" Name="K_ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlhocvi" Name="HV_ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlvaitro" Name="VAITRO" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlchucvu" Name="CV_ID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtcmnd" Name="CB_CMND" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtngaycap" Name="CB_NGAYCAPCMND" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtnoicap" Name="CB_NOICAPCMND" PropertyName="Text" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
