<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="khoa.aspx.cs" Inherits="NKCH.khoa1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">THÔNG TIN KHOA</div>
                <div class="panel-body">
                    <div class="form-horizontal group-border-dashed">
                     
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Mã Khoa</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtMaKhoa" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Tên Khoa</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtTenKhoa" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Thông tin không được để trống" ControlToValidate="txtTenKhoa" ForeColor="Red"></asp:RequiredFieldValidator>
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
                <div class="panel-heading panel-heading-divider">DANH SÁCH KHOA</div>
                <div class="row be-datatable-body">
                    <div class="col-sm-12">
                        
                        <asp:SqlDataSource ID="SqldsKhoa" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>"  DeleteCommand="KHOA_DELETE" DeleteCommandType="StoredProcedure" InsertCommand="KHOA_INSERT" 
                          InsertCommandType="StoredProcedure" SelectCommand="KHOA_SELECT_ALL"
                          SelectCommandType="StoredProcedure" UpdateCommand="KHOA_UPDATE" UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="txtMaKhoa" Name="K_ID" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtTenKhoa" Name="K_TEN" PropertyName="Text" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtMaKhoa" Name="K_ID" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtTenKhoa" Name="K_TEN" PropertyName="Text" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txtMaKhoa" Name="K_ID" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtTenKhoa" Name="K_TEN" PropertyName="Text" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GVDSKhoa" runat="server" DataSourceID="SqldsKhoa" AllowPaging="True" AllowSorting="True" CellPadding="4" GridLines="None" CssClass="mydatagrid" PagerStyle-CssClass="pager"
HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="GVDSKhoa_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField SelectText="Chọn" ControlStyle-CssClass="btn btn-space btn-danger" ShowSelectButton="True" ButtonType="Button" >
<ControlStyle CssClass="btn btn-space btn-danger"></ControlStyle>
                            </asp:CommandField>
                            <asp:BoundField DataField="K_ID" HeaderText="Mã khoa" ReadOnly="True" SortExpression="K_ID" />
                            <asp:BoundField DataField="K_TEN" HeaderText="Tên khoa" SortExpression="K_TEN" />
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
