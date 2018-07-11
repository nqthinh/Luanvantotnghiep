<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="danhsachgiahandetai.aspx.cs" Inherits="NKCH.danhsachgiahandetai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">THÔNG TIN ĐỀ TÀI CẦN GIA HẠN</div>
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
                                <asp:TextBox ID="txtidtm" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
						<div class="form-group">  
                            <label class="col-sm-3 control-label">Tên đề tài</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtTenDetai" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9">
                                <p class="text-right">
                                    <asp:Button ID="btnChiTiet" runat="server" Text="Chi tiết" Width="103px" class="btn btn-space btn-primary"  CausesValidation="False" OnClick="btnChiTiet_Click" />
									<asp:Button ID="btnXoa" runat="server" Text="Xóa" Width="103px" class="btn btn-space btn-warning hover" OnClick="btnXoa_Click" />
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
				<div class="panel-heading panel-heading-divider">DANH SÁCH ĐỀ TÀI CẦN GIA HẠN</div>
				<hr />
				<div class="row be-datatable-body">
					<div class="col-sm-12">
						<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" GridLines="None" CssClass="mydatagrid" PagerStyle-CssClass="pager"
							HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" AutoGenerateColumns="False" DataKeyNames="GHDT_ID,TMDT_ID" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
							<Columns>
								<asp:CommandField SelectText="Chọn" ControlStyle-CssClass="btn btn-space btn-danger" ShowSelectButton="True" ButtonType="Button" >
<ControlStyle CssClass="btn btn-space btn-danger"></ControlStyle>
								<ItemStyle Width="10%" />
								</asp:CommandField>
								<asp:BoundField DataField="GHDT_ID" HeaderText="ID" SortExpression="GHDT_ID" >
								</asp:BoundField>
								<asp:BoundField DataField="TMDT_ID" HeaderText="Mã TM" SortExpression="TMDT_ID" >
								</asp:BoundField>
								<asp:BoundField DataField="TMDT_TENDETAI" HeaderText="Tên đề tài" SortExpression="TMDT_TENDETAI" />
								<asp:BoundField DataField="GHDT_THOIGIANGIAHAN" HeaderText="Thời gian gia hạn" SortExpression="GHDT_THOIGIANGIAHAN">
								</asp:BoundField>
								<asp:BoundField DataField="GHDT_NOIDUNG" HeaderText="Nội dung" SortExpression="GHDT_NOIDUNG" >
								</asp:BoundField>
							    <asp:BoundField DataField="GHDT_LIDO" HeaderText="Lí do" SortExpression="GHDT_LIDO" />
							    <asp:BoundField DataField="GHDT_KINHPHIGIAHAN" HeaderText="Kinh phí gia hạn" SortExpression="GHDT_KINHPHIGIAHAN" />
							</Columns>
							<HeaderStyle CssClass="header"></HeaderStyle>

							<PagerStyle CssClass="pager"></PagerStyle>

							<RowStyle CssClass="rows"></RowStyle>
						</asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="GIAHANDETAI_SELECT_ALL" SelectCommandType="StoredProcedure" DeleteCommand="GIAHANDETAI_DELETE" DeleteCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="txtid" Name="GHDT_ID" PropertyName="Text" Type="String" />
                                <asp:Parameter Name="TMDT_ID" Type="String"></asp:Parameter>
                                <asp:Parameter Name="GHDT_THOIGIANGIAHAN" Type="String"></asp:Parameter>
                                <asp:Parameter Name="GHDT_NOIDUNG" Type="String"></asp:Parameter>
                                <asp:Parameter Name="GHDT_LIDO" Type="String"></asp:Parameter>
                                <asp:Parameter Name="GHDT_KINHPHIGIAHAN" Type="String"></asp:Parameter>
                            </DeleteParameters>
                        </asp:SqlDataSource>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
