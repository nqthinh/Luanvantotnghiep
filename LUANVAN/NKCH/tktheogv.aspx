<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="tktheogv.aspx.cs" Inherits="NKCH.tktheogv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">THÔNG TIN TÌM KIẾM</div>
                <div class="panel-body">
                    <div class="form-horizontal group-border-dashed">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Tên đề tài cần tìm</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtTimKiem" class="form-control input-sm" runat="server" Width="100%" ></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-9">
                                <p class="text-right">
                                    <asp:Button ID="btnTim" runat="server" Text="Tìm kiếm" Width="103px" class="btn btn-space btn-primary" OnClick="btnTim_Click" />
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
                <div class="panel-heading panel-heading-divider">DANH SÁCH ĐỀ TÀI</div>
                <div class="row be-datatable-body">
                    <div class="col-sm-12">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnSelecting="SqlDataSource1_Selecting" ConnectionString='<%$ ConnectionStrings:connString %>' SelectCommand="TIMKIEMDETAI" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtTimKiem" PropertyName="Text" Name="DKDTTV_MANV" Type="String"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="gvDSHocVi" runat="server" class="table table-striped table-hover table-fw-widget" AutoGenerateColumns="False" DataKeyNames="DKDT_ID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gvDSGiangVien_SelectedIndexChanged" Width="100%">
                            <AlternatingRowStyle BackColor="White" BorderStyle="None" />
                            <Columns>
                                <asp:BoundField DataField="DKDT_ID" HeaderText="Mã" SortExpression="DKDT_ID" >
                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DKDT_TENDETAI" HeaderText="Tên đề tài" SortExpression="DKDT_TENDETAI" />
                                <asp:BoundField DataField="DKDT_TINHTRANG" HeaderText="Tình trạng" SortExpression="DKDT_TINHTRANG" ><ItemStyle HorizontalAlign="Left" Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DKDTTV_HOTEN" HeaderText="Thành viên" SortExpression="DKDTTV_HOTEN"><ItemStyle HorizontalAlign="Left" Width="20%" /></asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            
                            <RowStyle CssClass="table-hover" BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            
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
