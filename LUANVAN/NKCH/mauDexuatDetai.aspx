<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mauDexuatDetai.aspx.cs" Inherits="NKCH.mauDexuatDetai" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<style type="text/css">
		.auto-style2 {
			width: 232px;
			text-align: center;
		}
		.auto-style3 {
			text-align: center;
		}
		.auto-style4 {
			width: 81px;
		}
		.auto-style6 {
			width: 402px;
		}
		.auto-style7 {
			height: 120px;
		}
		.auto-style8 {
			width: 402px;
			height: 120px;
		}
		.auto-style9 {
			width: 232px;
			height: 5px;
		}
		.auto-style10 {
			font-size: small;
		}
		.auto-style11 {
			text-align: right;
		}
		.auto-style12 {
			width: 81px;
			height: 5px;
		}
		.auto-style13 {
			text-align: right;
			height: 5px;
		}
		.auto-style14 {
			text-align: center;
			height: 57px;
		}
	    .auto-style15 {
            width: 100%;
            height: 159px;
        }
	</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        	<div>
				<table class="auto-style15">
					<tr>
						<td class="auto-style2"><span class="auto-style10">UBND THÀNH PHỐ CẦN THƠ
							</span>
							<br class="auto-style10" />
							<strong><span class="auto-style10">TRƯỜNG ĐẠI HỌC
							</span>
							<br class="auto-style10" />
							<span class="auto-style10">KỸ THUẬT – CÔNG NGHỆ CẦN THƠ</span></strong> </td>
						<td class="auto-style4">&nbsp;</td>
						<td class="auto-style11"><strong><span class="auto-style10">CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM
							</span>
							<br class="auto-style10" />
							<span class="auto-style10">Độc lập - Tự do - Hạnh phúc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> </strong></td>
					</tr>
					<tr>
						<td class="auto-style9"></td>
						<td class="auto-style12"></td>
						<td class="auto-style13"><em><span class="auto-style10">Cần Thơ, </span> <asp:Label ID="lbNgayThang" runat="server" Font-Italic="True" Text="lbNgayThang" CssClass="auto-style10"></asp:Label>
							</em></td>
					</tr>
					<tr>
						<td class="auto-style14" colspan="3" style="vertical-align: text-bottom"><strong>ĐỀ XUẤT ĐỀ TÀI KHOA HỌC VÀ CÔNG NGHỆ CẤP CƠ SỞ</strong></td>
					</tr>
				</table>
			</div>
			<p>
				<strong>1. Tên đề tài: 
				<asp:Label ID="lbTenDetai" runat="server" Text="lbTenDetai"></asp:Label>
				</strong></p>
			<p>
				<strong>2. Lĩnh vực nghiên cứu:</strong></p>
			<p>
				<asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="sqlLinhVuc" DataTextField="LV_TEN" DataValueField="LV_ID" OnDataBound="CheckBoxList1_DataBound" RepeatColumns="2">
				</asp:CheckBoxList>
				<asp:SqlDataSource ID="sqlLinhVuc" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="LINHVUC_NC_SELECT_ALL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
			</p>
        </div>
    	<p>
			<strong>3. Tính cấp thiết:</strong></p>
		<p>
			<asp:Label ID="lbTinhCapThiet" runat="server" Text="lbTinhCapThiet"></asp:Label>
		</p>
		<p>
			<strong>4. Mục tiêu: </strong>
		</p>
		<p>
			<asp:Label ID="lbMucTieu" runat="server" Text="lbMucTieu"></asp:Label>
		</p>
		<p>
			<strong>5. Nội dung chính: </strong>
		</p>
		<p>
			<asp:Label ID="lbNoiDung" runat="server" Text="lbNoiDung"></asp:Label>
		</p>
		<p>
			<strong>6. Sản phẩm và kết quả dự kiến: </strong>
		</p>
		<p>
			<asp:Label ID="lbSanPham" runat="server" Text="lbSanPham"></asp:Label>
		</p>
		<p>
			<strong>7. Hiệu quả dự kiến: </strong>
		</p>
		<p>
			<asp:Label ID="lbHieuQua" runat="server" Text="lbHieuQua"></asp:Label>
		</p>
		<p>
			<strong>8. Nhu cầu kinh phí dự kiến: </strong>
		</p>
		<ul>
			<li>Giờ nghiên cứu khoa học: 
				<asp:Label ID="lbNhuCauKinhPhi" runat="server" Text="lbNhuCauKinhPhi"/>
			</li>
			<li>Đề tài kinh phí: 
				<asp:Label ID="lbDeTaiKinhPhi" runat="server" Text="lbDeTaiKinhPhi"/>
			</li>
			<li>Ngân sách trường: 
				<asp:Label ID="lbNganSachTruong" runat="server" Text="lbNganSachTruong"/>
			</li>
			<li>Các nguồn kinh phí khác: 
				<asp:Label ID="lbCacNguonKPKhac" runat="server" Text="lbCacNguonKPKhac"/>
			</li>
		</ul>
		<p>
			<strong>9. Thời gian nghiên cứu dự kiến: </strong>
			<asp:Label ID="lbThoiGianNghienCuuDuKien" runat="server" Text="lbThoiGianNghienCuuDuKien"/>
		</p>
		<p>
			&nbsp;</p>
		<table style="width:100%;">
			<tr>
				<td>&nbsp;</td>
				<td class="auto-style6">&nbsp;</td>
				<td>
					<p class="auto-style3">
						<strong>Chủ nhiệm đề tài </strong>
					</p>
				</td>
			</tr>
			<tr>
				<td class="auto-style7"></td>
				<td class="auto-style8"></td>
				<td class="auto-style7"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td class="auto-style6">&nbsp;</td>
				<td class="auto-style3">
					<asp:Label ID="lbTenChuNhiemDetai" runat="server" Text="lbTenChuNhiemDetai"></asp:Label>
				</td>
			</tr>
		</table>
    </form>
</body>
</html>
