<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="hocvi.aspx.cs" Inherits="NKCH.hocvi1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">THÔNG TIN HỌC VỊ</div>
                <div class="panel-body">
                    <div class="form-horizontal group-border-dashed">
                     
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Mã Học vị</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtHVID" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Tên Học Vị</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtHVTen" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Thông tin không được để trống" ControlToValidate="txtHVTen" ForeColor="Red"></asp:RequiredFieldValidator>
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
                <div class="panel-heading panel-heading-divider">DANH SÁCH HỌC VỊ</div>
                <div class="row be-datatable-body">
                    <div class="col-sm-12">
                        <asp:SqlDataSource ID="sqldsHocVi" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" DeleteCommand="HOCVI_DELETE" DeleteCommandType="StoredProcedure" InsertCommand="HOCVI_INSERT" InsertCommandType="StoredProcedure" SelectCommand="HOCVI_SELECT_ALL" SelectCommandType="StoredProcedure" UpdateCommand="HOCVI_UPDATE" UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="txtHVID" Name="HV_ID" PropertyName="Text" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtHVID" Name="HV_ID" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtHVTen" Name="HV_TEN" PropertyName="Text" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txtHVID" Name="HV_ID" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtHVTen" Name="HV_TEN" PropertyName="Text" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="gvDSHocVi" runat="server" 
                            AllowPaging="True" 
                            AllowSorting="True" 
                            GridLines="None" 
                            CssClass="mydatagrid" 
                            PagerStyle-CssClass="pager" 
                            HeaderStyle-CssClass="header" 
                            RowStyle-CssClass="rows" Width="100%" 
                            AutoGenerateColumns="False" 
                            DataKeyNames="HV_ID" 
                            DataSourceID="sqldsHocVi"  
                            ShowHeaderWhenEmpty="True" 
                            OnSelectedIndexChanged="gvDSGiangVien_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" BorderStyle="None" />
                            <Columns>
                                <asp:CommandField SelectText="Chọn" ControlStyle-CssClass="btn btn-space btn-danger" ButtonType="Button" ShowSelectButton="True">
                                    <ControlStyle CssClass="btn btn-space btn-danger"></ControlStyle>
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                </asp:CommandField>
                                <asp:BoundField DataField="HV_ID" HeaderText="Mã học vị" ReadOnly="True" SortExpression="HV_ID">
                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="HV_TEN" HeaderText="Tên học vị" SortExpression="HV_TEN">
                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                                </asp:BoundField >
                            </Columns>
                            <HeaderStyle CssClass="header"></HeaderStyle>

							<PagerStyle CssClass="pager"></PagerStyle>

							<RowStyle CssClass="rows"></RowStyle>
                          
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</asp:Content>
