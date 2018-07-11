<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="danhsachdetai_quanly.aspx.cs" Inherits="NKCH.danhsachdetai_quanly" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">THÔNG TIN ĐỀ TÀI</div>
                <div class="panel-body">
                    <div class="form-horizontal group-border-dashed">
                        <div class="form-group">  
                            <label class="col-sm-3 control-label">Mã đề tài</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtid" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
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
                                    <asp:Button ID="btnDuyet" runat="server" Text="Duyệt" Width="103px" class="btn btn-space btn-danger hover" OnClick="btnDuyet_Click" />
									<asp:Button ID="btnHuyNop" runat="server" Text="Hủy Nộp" Width="103px" class="btn btn-space btn-success" OnClick="btnHuyNop_Click" />
                                    
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
				<div class="form-group">  
                            <div class="col-sm-12">
                                <asp:TextBox ID="txtTimKiem" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
                            </div>
							<hr />
							<div class="col-sm-12">
							<asp:Button ID="Button1" runat="server" Text="Tìm kiếm" Width="100%" class="btn btn-space btn-primary"  CausesValidation="False" />
							</div>
                        </div>
					
				<div class="row be-datatable-body">
					<div class="col-sm-12">
						<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" GridLines="None" CssClass="mydatagrid" PagerStyle-CssClass="pager"
							HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" AutoGenerateColumns="False" DataKeyNames="DKDT_ID" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
							<Columns>
								<asp:CommandField SelectText="Chọn" ControlStyle-CssClass="btn btn-space btn-danger" ShowSelectButton="True" ButtonType="Button" >
<ControlStyle CssClass="btn btn-space btn-danger"></ControlStyle>
								<ItemStyle Width="10%" />
								</asp:CommandField>
								<asp:BoundField DataField="DKDT_ID" HeaderText="Mã ĐT" ReadOnly="True" SortExpression="DKDT_ID" >
								<ItemStyle Width="15%" />
								</asp:BoundField>
								<asp:BoundField DataField="DKDT_TENDETAI" HeaderText="Tên đề tài" SortExpression="DKDT_TENDETAI" />
								<asp:BoundField DataField="DKDT_KINHPHI" HeaderText="Kinh phí" SortExpression="DKDT_KINHPHI" >
								<ItemStyle Width="10%" />
								</asp:BoundField>
								<asp:BoundField DataField="DKDT_NOP" HeaderText="Nộp" SortExpression="DKDT_NOP">
								<ItemStyle Width="10%" />
								</asp:BoundField>
								<asp:BoundField DataField="DKDT_TINHTRANG" HeaderText="Tình trạng" SortExpression="DKDT_TINHTRANG" >
								<ItemStyle Width="15%" />
								</asp:BoundField>
							</Columns>
							<HeaderStyle CssClass="header"></HeaderStyle>

							<PagerStyle CssClass="pager"></PagerStyle>

							<RowStyle CssClass="rows"></RowStyle>
						</asp:GridView>
						<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="DANGKYDETAI_SELECTALL_DETAINOP" SelectCommandType="StoredProcedure">
							<SelectParameters>
								<asp:ControlParameter ControlID="txtTimKiem" Name="DKDT_ID_TK" PropertyName="Text" Type="String" DbType="Object" DefaultValue="0" />
							</SelectParameters>
						</asp:SqlDataSource>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
