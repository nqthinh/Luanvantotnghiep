<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="danhsachdungthuchiendetai.aspx.cs" Inherits="NKCH.danhsachdungthuchiendetai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">THÔNG TIN ĐỀ TÀI CẦN DỪNG THỰC HIỆN</div>
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
				<div class="panel-heading panel-heading-divider">DANH SÁCH ĐỀ TÀI CẦN DỪNG THỰC HIỆN</div>
				<hr />
				<div class="row be-datatable-body">
					<div class="col-sm-12">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" GridLines="None" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                            HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" AutoGenerateColumns="False" DataKeyNames="DTH_ID,TMDT_ID" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="sqlDSDTH">
							<Columns>
								<asp:CommandField SelectText="Chọn" ControlStyle-CssClass="btn btn-space btn-danger" ShowSelectButton="True" ButtonType="Button" >
<ControlStyle CssClass="btn btn-space btn-danger"></ControlStyle>
								<ItemStyle Width="10%" />
								</asp:CommandField>
                                <asp:BoundField DataField="DTH_ID" HeaderText="ID" SortExpression="DTH_ID"></asp:BoundField>
                                <asp:BoundField DataField="TMDT_ID" HeaderText="Mã TM" SortExpression="TMDT_ID"></asp:BoundField>
                                <asp:BoundField DataField="TMDT_TENDETAI" HeaderText="Tên đề tài" SortExpression="TMDT_TENDETAI" />
                                <asp:BoundField DataField="DTH_LIDO" HeaderText="Lí do" SortExpression="DTH_LIDO"></asp:BoundField>
                                <asp:BoundField DataField="DTH_KINHPHIDANHAN" HeaderText="Kinh phí đã nhận" SortExpression="DTH_KINHPHIDANHAN"></asp:BoundField>
                                <asp:BoundField DataField="DTH_KINHPHIHOANLAI" HeaderText="Kinh phí hoàn lại" SortExpression="DTH_KINHPHIHOANLAI" />
							</Columns>
							<HeaderStyle CssClass="header"></HeaderStyle>

							<PagerStyle CssClass="pager"></PagerStyle>

							<RowStyle CssClass="rows"></RowStyle>
						</asp:GridView>
                        <asp:SqlDataSource ID="sqlDSDTH" runat="server" ConnectionString='<%$ ConnectionStrings:connString %>' DeleteCommand="DUNGTHUCHIENDETAI_DELETE" DeleteCommandType="StoredProcedure" SelectCommand="DUNGTHUCHIENDETAI_SELECT_ALL" SelectCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="txtid" Name="DTH_ID" PropertyName="Text" Type="String" />
                                <asp:Parameter Name="TMDT_ID" Type="String"></asp:Parameter>
                                <asp:Parameter Name="DTH_KINHPHIDANHAN" Type="String"></asp:Parameter>
                                <asp:Parameter Name="DTH_LIDO" Type="String"></asp:Parameter>
                                <asp:Parameter Name="DTH_KINHPHIHOANLAI" Type="String"></asp:Parameter>
                            </DeleteParameters>
                        </asp:SqlDataSource>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
