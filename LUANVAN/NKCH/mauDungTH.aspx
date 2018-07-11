<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mauDungTH.aspx.cs" Inherits="NKCH.mauDungTH" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	
    <style type="text/css">

h4
	{margin-bottom:.0001pt;
	text-indent:-1.0cm;
	page-break-after:avoid;
	font-size:13.0pt;
	font-family:VNI-Times;
            margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
        .auto-style1 {
            text-align: center;
        }
p.MsoBodyTextIndent
	{margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:Arial;
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style4 {
        }
        .auto-style5 {
        }
        .auto-style6 {
            height: 92px;
        }
        .auto-style7 {
            width: 521px;
            height: 23px;
        }
    </style>
	
</head>
<body>
    <form id="form1" runat="server">
       
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">UBND THÀNH PHỐ CẦN THƠ<b><br />
                    TRƯỜNG ĐẠI HỌC<br />
                    KỸ THUẬT - CÔNG NGHỆ CẦN THƠ</b></td>
                <td>
                    <div style="mso-element:frame;mso-element-frame-hspace:9.0pt;mso-element-wrap:
around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
margin;mso-element-left:center;mso-element-top:-.35pt;mso-height-rule:exactly">
                        <table align="center" cellpadding="0" cellspacing="0" hspace="0" vspace="0">
                            <tr>
                                <td align="left" style="padding-top:0cm;padding-right:9.0pt;
  padding-bottom:0cm;padding-left:9.0pt" valign="top">
                                    <h4 align="center" style="text-align:center;text-indent:0cm;mso-element:frame;
  mso-element-frame-hspace:9.0pt;mso-element-wrap:around;mso-element-anchor-vertical:
  paragraph;mso-element-anchor-horizontal:margin;mso-element-left:center;
  mso-element-top:-.35pt;mso-height-rule:exactly"><span style="mso-bidi-font-size:
  13.0pt;font-family:&quot;Times New Roman&quot;;letter-spacing:-.7pt">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<o:p></o:p></span></h4>
                                    <h4 align="center" style="text-align:center;text-indent:0cm;mso-element:frame;
  mso-element-frame-hspace:9.0pt;mso-element-wrap:around;mso-element-anchor-vertical:
  paragraph;mso-element-anchor-horizontal:margin;mso-element-left:center;
  mso-element-top:-.35pt;mso-height-rule:exactly"><!--[if gte vml 1]><v:line
   id="_x0000_s1026" style='position:absolute;left:0;text-align:left;z-index:1'
   from="42.6pt,15.6pt" to="222.6pt,15.6pt" xmlns:v="urn:schemas-microsoft-com:vml"/><![endif]--><![if !vml]><![endif]><span style="font-size:14.0pt;
  font-family:&quot;Times New Roman&quot;">Độc lập - Tự do - Hạnh phúc<o:p></o:p></span></h4>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="text-align: center"><span style="mso-bidi-font-weight:normal"><i style="mso-bidi-font-style:normal"><span style="font-size: 12.0pt; mso-bidi-font-size: 13.0pt; font-family: &quot;Times New Roman&quot;; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA; text-align: center;">Cần Thơ,
                    <asp:Label ID="lbNgay" runat="server" Text="lbNgay"></asp:Label>
                    </span></i></span></td>
            </tr>
        </table>
        <br />
        <br />

        <table style="width:100%;">
            <tr>
                <td style="text-align: center"><strong>ĐƠN XIN DỪNG THỰC HIỆN ĐỀ TÀI 
                    <br />
                    CẤP TRƯỜNG</strong></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: center"><strong><em>Kính gửi: </em>- Ban Giám Hiệu
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp; Phòng NCKH-HTQT-DA</strong></td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align: left"></td>
            </tr>
        </table>
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style7"><span style="font-size:13.0pt;font-family:&quot;Times New Roman&quot;;
mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-ansi-language:EN-US;
mso-fareast-language:EN-US;mso-bidi-language:AR-SA"><strong>- Họ tên chủ nhiệm đề tài:</strong>&nbsp;
                    <asp:Label ID="lbTenCN" runat="server" Text="lbTenCN"></asp:Label>
                    </span></td>
                <td class="auto-style2">&nbsp;MSCB:&nbsp;<asp:Label ID="lbMacb" runat="server" Text="lbMacb"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2"><span style="font-size:13.0pt;font-family:&quot;Times New Roman&quot;;
mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-ansi-language:EN-US;
mso-fareast-language:EN-US;mso-bidi-language:AR-SA"><strong>- Đơn vị:</strong>
                    <asp:Label ID="lbDonvi" runat="server" Text="lbDonvi"></asp:Label>
                    </span></td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2"><strong>- Tên đề tài:</strong>
                    <asp:Label ID="lbTenDT" runat="server" Text="lbTenDT"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="2"><span style="font-size:13.0pt;font-family:&quot;Times New Roman&quot;;
mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-ansi-language:EN-US;
mso-fareast-language:EN-US;mso-bidi-language:AR-SA"><strong>- Thời gian đăng ký thực hiện bắt đầu:</strong>
                    <asp:Label ID="lbNgayBD" runat="server" Text="lbNgayBD"></asp:Label>
                    </span></td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="2"><span style="font-size:13.0pt;font-family:&quot;Times New Roman&quot;;
mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-ansi-language:EN-US;
mso-fareast-language:EN-US;mso-bidi-language:AR-SA"><strong>- Kinh phí đã nhận:</strong>
                    <asp:Label ID="lbKinhphiNhan" runat="server" Text="lbKinhphiNhan"></asp:Label>
                    </span></td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="2">
                    <p class="MsoBodyTextIndent">
                        <span style="font-size:
13.0pt;font-family:&quot;Times New Roman&quot;;color:black">- Nay xin dừng thực hiện đề tài trên vì lý do:<o:p>
                        <asp:Label ID="lbLydo" runat="server" Text="lbLydo"></asp:Label>
                        </o:p></span>
                    </p>
                </td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="2"><span style="font-size:13.0pt;font-family:&quot;Times New Roman&quot;;
mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-ansi-language:EN-US;
mso-fareast-language:EN-US;mso-bidi-language:AR-SA">- Kinh phí phải hoàn lại (nếu có):&nbsp;
                    <asp:Label ID="lbKinhphiHoan" runat="server" Text="lbKinhphiHoan"></asp:Label>
                    </span></td>
            </tr>
        </table>
        <p>
            <br />
            <br />
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1"><b style="mso-bidi-font-weight:normal"><span style="font-size:13.0pt;font-family:&quot;Times New Roman&quot;;mso-fareast-font-family:
&quot;Times New Roman&quot;;color:black;mso-ansi-language:EN-US;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA">Ban Giám hiệu</span></b></td>
                    <td class="auto-style1"><b style="mso-bidi-font-weight:normal"><span style="font-size: 13.0pt; font-family: &quot;Times New Roman&quot;; mso-fareast-font-family: &quot;Times New Roman&quot;; color: black; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA; text-align: center;">Phòng NCKH-HTQT-DA<span style="mso-tab-count:
1">&nbsp; </span></span></b></td>
                    <td class="auto-style1"><b style="mso-bidi-font-weight:normal"><span style="font-size:13.0pt;font-family:&quot;Times New Roman&quot;;mso-fareast-font-family:
&quot;Times New Roman&quot;;color:black;mso-ansi-language:EN-US;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA">Chủ nhiệm Đề tài</span></b></td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="3"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td style="text-align: center">
                        <asp:Label ID="lbChuNhiem" runat="server" Text="lbChuNhiem"></asp:Label>
                    </td>
                </tr>
            </table>
        </p>
       
    </form>
</body>
</html>