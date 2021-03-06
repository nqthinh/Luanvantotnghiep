﻿<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="danhsachthuyetminhdetai.aspx.cs" Inherits="NKCH.danhsachthuyetminhdetai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="row">
        <div class="col-md-12">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">THÔNG TIN THUYẾT MINH ĐỀ TÀI</div>
                <div class="panel-body">
                    <div class="form-horizontal group-border-dashed">
                        <div class="form-group">  
                            <label class="col-sm-3 control-label">Mã thuyết minh</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtid" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
						<div class="form-group">  
                            <label class="col-sm-3 control-label">Mã đề tài</label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtiddx" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
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
                                    <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" Width="103px" class="btn btn-space btn-success" OnClick="btnCapNhat_Click"/>
									<asp:Button ID="btnNop" runat="server" Text="Nộp" Width="103px" class="btn btn-space btn-danger hover" OnClick="btnNop_Click"  />
									<asp:Button ID="btngiahan" runat="server" Text="Gia Hạn" Width="103px" class="btn btn-space btn-warning hover"  CausesValidation="False" Visible="true" OnClick="btngiahan_Click" />
                                    <asp:Button ID="btndungthuchien" runat="server" Text="Dừng thực hiện" Width="103px" class="btn btn-space btn-success" Visible="true" OnClick="btndungthuchien_Click" />
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
				<div class="panel-heading panel-heading-divider">DANH SÁCH THUYẾT MINH ĐỀ TÀI</div>
				<div class="row be-datatable-body">
					<div class="col-sm-12">
						<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" GridLines="None" CssClass="mydatagrid" PagerStyle-CssClass="pager"
							HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" AutoGenerateColumns="False" DataKeyNames="DKDT_ID" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
							<Columns>
								<asp:CommandField SelectText="Chọn" ControlStyle-CssClass="btn btn-space btn-danger" ShowSelectButton="True" ButtonType="Button" >
<ControlStyle CssClass="btn btn-space btn-danger"></ControlStyle>
								<ItemStyle Width="10%" />
								</asp:CommandField>
								<asp:BoundField DataField="TMDT_ID" HeaderText="Mã TM" SortExpression="TMDT_ID" >
								<ItemStyle Width="15%" />
								</asp:BoundField>
								<asp:BoundField DataField="DKDT_ID" HeaderText="Mã ĐT" ReadOnly="True" SortExpression="DKDT_ID" >
								<ItemStyle Width="15%" />
								</asp:BoundField>
								<asp:BoundField DataField="TMDT_TENDETAI" HeaderText="Tên đề tài" SortExpression="DKDT_TENDETAI" />
								<asp:BoundField DataField="TMDT_NOP" HeaderText="Nộp" SortExpression="DKDT_NOP">
								<ItemStyle Width="10%" />
								</asp:BoundField>
								<asp:BoundField DataField="TMDT_TINHTRANG" HeaderText="Tình trạng" SortExpression="DKDT_TINHTRANG" >
								<ItemStyle Width="15%" />
								</asp:BoundField>
							</Columns>
							<HeaderStyle CssClass="header"></HeaderStyle>

							<PagerStyle CssClass="pager"></PagerStyle>

							<RowStyle CssClass="rows"></RowStyle>
						</asp:GridView>
						<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="THUYETMINHDETAI_SELECT_TV" SelectCommandType="StoredProcedure">
							<SelectParameters>
								<asp:SessionParameter Name="DKDT_IDCB" SessionField="MACB" Type="String" />
							</SelectParameters>
						</asp:SqlDataSource>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
