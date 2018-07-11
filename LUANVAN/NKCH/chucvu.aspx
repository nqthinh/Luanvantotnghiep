<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="chucvu.aspx.cs" Inherits="NKCH.chucvu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">THÔNG TIN CHỨC VỤ</div>
                <div class="panel-body">
                    <div class="form-horizontal group-border-dashed">
                     
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Mã chức vụ</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtid" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Tên chức vụ</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtten" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Thông tin không được để trống" ControlToValidate="txtten" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9">
                                <p class="text-right">
                                    <asp:Button ID="btnthem" runat="server" Text="Thêm" Width="103px" class="btn btn-space btn-primary" OnClick="btnthem_Click" CausesValidation="False" />
                                    <asp:Button ID="btnluu" runat="server" Text="Lưu" Width="103px" class="btn btn-space btn-success" OnClick="btncapnhat_Click" Visible="False"  />
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
                <div class="panel-heading panel-heading-divider">DANH SÁCH CHỨC VỤ</div>
                <div class="row be-datatable-body">
                    <div class="col-sm-12">                     
                        <asp:SqlDataSource ID="Sqldschucvu" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" DeleteCommand="CHUCVU_DELETE" DeleteCommandType="StoredProcedure" InsertCommand="CHUCVU_INSERT"
                            InsertCommandType="StoredProcedure" SelectCommand="CHUCVU_SELECT_ALL"
                            SelectCommandType="StoredProcedure" UpdateCommand="CHUCVU_UPDATE" UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="txtid" Name="CV_ID" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtten" Name="CV_TEN" PropertyName="Text" Type="String" />

                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtid" Name="CV_ID" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtten" Name="CV_TEN" PropertyName="Text" Type="String" />

                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txtid" Name="CV_ID" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtten" Name="CV_TEN" PropertyName="Text" Type="String" />

                            </UpdateParameters>
                        </asp:SqlDataSource>

                        <asp:GridView ID="gvchucvu" runat="server" DataSourceID="Sqldschucvu" AllowPaging="True" AllowSorting="True" CellPadding="4" GridLines="None" CssClass="mydatagrid" PagerStyle-CssClass="pager"
HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="gvchucvu_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField SelectText="Chọn" ControlStyle-CssClass="btn btn-space btn-danger" ShowSelectButton="True" ButtonType="Button" >
<ControlStyle CssClass="btn btn-space btn-danger"></ControlStyle>
                            </asp:CommandField>
                            <asp:BoundField DataField="CV_ID" HeaderText="ID" ReadOnly="True" SortExpression="CV_ID" />
                            <asp:BoundField DataField="CV_TEN" HeaderText="Chức vụ" SortExpression="CV_TEN" />
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
