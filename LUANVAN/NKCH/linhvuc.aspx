<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="linhvuc.aspx.cs" Inherits="NKCH.linhvuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">LĨNH VỰC ĐỀ TÀI NGHIÊN CỨU KHOA HỌC</div>
                <div class="panel-body">
                    <div class="form-horizontal group-border-dashed">
                     
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Mã lĩnh vực</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtid" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Tên lĩnh vực</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtten" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Thông tin không được để trống" ControlToValidate="txtten" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9">
                                <p class="text-right">
                                    <asp:Button ID="btnthem" runat="server" Text="Thêm" Width="103px" class="btn btn-space btn-primary" OnClick="btnthem_Click" CausesValidation="False" />
                                    <asp:Button ID="btncapnhat" runat="server" Text="Lưu" Width="103px" class="btn btn-space btn-success" OnClick="btncapnhat_Click" Visible="False"  />
                                    <asp:Button ID="btnhuy" runat="server" Text="Hủy" Width="103px" class="btn btn-space btn-warning hover" OnClick="btnhuy_Click" Visible="False" CausesValidation="False" />
                                    <asp:Button ID="btnxoa" runat="server" Text="Xóa" Width="103px" class="btn btn-space btn-danger hover" OnClick="btnxoa_Click" Visible="False" CausesValidation="False" />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">DANH SÁCH LĨNH VỰC<asp:SqlDataSource ID="Sqldslinhvuc" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" DeleteCommand="LINHVUC_NC_DELETE" DeleteCommandType="StoredProcedure" InsertCommand="LINHVUC_NC_INSERT" InsertCommandType="StoredProcedure" SelectCommand="LINHVUC_NC_SELECT_ALL" SelectCommandType="StoredProcedure" UpdateCommand="LINHVUC_NC_UPDATE" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="txtid" Name="LV_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtten" Name="LV_TEN" PropertyName="Text" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtid" Name="LV_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtten" Name="LV_TEN" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txtid" Name="LV_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtten" Name="LV_TEN" PropertyName="Text" Type="String" />
                    </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="row be-datatable-body">
                    <div class="col-sm-12">
                        <asp:GridView ID="GVDSLinhvuc" runat="server" DataSourceID="Sqldslinhvuc" AllowPaging="True" AllowSorting="True" CellPadding="4" GridLines="None" CssClass="mydatagrid" PagerStyle-CssClass="pager"
HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="GVDSLinhvuc_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField SelectText="Chọn" ControlStyle-CssClass="btn btn-space btn-danger" ShowSelectButton="True" ButtonType="Button" >
<ControlStyle CssClass="btn btn-space btn-danger"></ControlStyle>
                            </asp:CommandField>
                            <asp:BoundField DataField="LV_ID" HeaderText="Mã lĩnh vực" ReadOnly="True" SortExpression="LV_ID" />
                            <asp:BoundField DataField="LV_TEN" HeaderText="Tên lĩnh vực" SortExpression="LV_TEN" />
                        </Columns>

                        <HeaderStyle CssClass="header"></HeaderStyle>

                        <PagerStyle CssClass="pager"></PagerStyle>

                        <RowStyle CssClass="rows"></RowStyle>
                    </asp:GridView>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</asp:Content>
