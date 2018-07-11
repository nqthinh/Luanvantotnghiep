<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="thoigiandangky.aspx.cs" Inherits="NKCH.thoigiandangky" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">QUẢN LÝ TRUY CẬP ĐĂNG KÝ ĐỀ TÀI</div>
                <div class="panel-body">
                    <div class="form-horizontal group-border-dashed">
                        <div class="form-group">  
                            <label class="col-sm-3 control-label">ID</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtid" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True" CausesValidation="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Ngày bắt đầu</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtngaybatdau" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtngaybatdau_CalendarExtender" TargetControlID="txtngaybatdau" ID="txtngaybatdau_CalendarExtender" TodaysDateFormat="dd/MM/yyyy" DaysModeTitleFormat="dd/MM/yyyy" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Ngày kết thúc</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtngayketthuc" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtngayketthuc_CalendarExtender" TargetControlID="txtngayketthuc" ID="txtngayketthuc_CalendarExtender" TodaysDateFormat="dd/MM/yyyy" DaysModeTitleFormat="dd/MM/yyyy" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9">
                                <p class="text-right">
                                    <asp:Button ID="btnthem" runat="server" Text="Thêm" Width="103px" class="btn btn-space btn-primary" CausesValidation="False" OnClick="btnthem_Click" />
                                    <asp:Button ID="btnluu" runat="server" Text="Lưu" Width="103px" class="btn btn-space btn-success" Visible="False" OnClick="btnluu_Click" />
                                    <asp:Button ID="btnxoa" runat="server" Text="Xóa" Width="103px" class="btn btn-space btn-danger hover" Visible="False" OnClick="btnxoa_Click" />
                                    <asp:Button ID="btnhuy" runat="server" Text="Hủy" Width="103px" class="btn btn-space btn-warning hover" Visible="False" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnhuy_Click" />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="panel panel-default panel-border-color panel-border-color-primary">
            <div class="panel-heading panel-heading-divider">THỜI GIAN ĐĂNG KÝ</div>
            <div class="row be-datatable-body">
                <div class="col-sm-12">
                    <asp:GridView ID="GVthoigiandangky" runat="server" DataSourceID="sqlthoigiandangky" AllowPaging="True" AllowSorting="True" CellPadding="4" GridLines="None" OnSelectedIndexChanged="gvDSGiangVien_SelectedIndexChanged" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                        HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" AutoGenerateColumns="False">
                        <Columns>
                            <asp:CommandField SelectText="Chọn" ControlStyle-CssClass="btn btn-space btn-danger" ShowSelectButton="True" ButtonType="Button" >
<ControlStyle CssClass="btn btn-space btn-danger"></ControlStyle>
                            </asp:CommandField>
                            <asp:BoundField DataField="TGDK_ID" HeaderText="ID" ReadOnly="True" SortExpression="TGDK_ID" />
                            <asp:BoundField DataField="TGDK_NGAYBATDAU" HeaderText="Ngày bắt đầu" SortExpression="TGDK_NGAYBATDAU" />
                            <asp:BoundField DataField="TGDK_NGAYKETTHUC" HeaderText="Ngày kết thúc" SortExpression="TGDK_NGAYKETTHUC" />
                        </Columns>

                        <HeaderStyle CssClass="header"></HeaderStyle>

                        <PagerStyle CssClass="pager"></PagerStyle>

                        <RowStyle CssClass="rows"></RowStyle>
                    </asp:GridView>
                </div>
            </div>
            <div class="panel-body">
                <asp:SqlDataSource ID="sqlthoigiandangky" runat="server" ConnectionString='<%$ ConnectionStrings:connString %>' DeleteCommand="THOIGIANDANGKY_DELETE" DeleteCommandType="StoredProcedure" InsertCommand="THOIGIANDANGKY_INSERT" InsertCommandType="StoredProcedure" SelectCommand="THOIGIANDANGKY_SELECT_ALL" SelectCommandType="StoredProcedure" UpdateCommand="THOIGIANDANGKY_UPDATE" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="txtid" Name="TGDK_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtngaybatdau" DbType="Date" Name="TGDK_NGAYBATDAU" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtngayketthuc" DbType="Date" Name="TGDK_NGAYKETTHUC" PropertyName="Text" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtid" Name="TGDK_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtngaybatdau" DbType="Date" Name="TGDK_NGAYBATDAU" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtngayketthuc" DbType="Date" Name="TGDK_NGAYKETTHUC" PropertyName="Text" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txtid" Name="TGDK_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtngaybatdau" DbType="Date" Name="TGDK_NGAYBATDAU" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtngayketthuc" DbType="Date" Name="TGDK_NGAYKETTHUC" PropertyName="Text" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
