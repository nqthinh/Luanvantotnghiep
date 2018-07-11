<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="NKCH.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div role="alert" class="alert alert-success alert-icon alert-dismissible">
                <div class="icon"><span class="mdi mdi-info-outline"></span></div>
                <div class="message">
                    <strong>
                        <asp:Label ID="lbthoigiandangky" runat="server" Text="" ForeColor="Red"></asp:Label></strong>
                </div>
            </div>
            <div class="main-content container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-default panel-table">
                            <div class="panel-heading">
                                DANH SÁCH ĐỀ TÀI NGHIÊN CỨU ĐÃ NỘP
                        <div class="tools"></div>
                            </div>
                            <div class="panel-body">
                                <asp:GridView ID="GVDSDetai" runat="server" AllowPaging="True" AllowSorting="True" GridLines="None" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" AutoGenerateColumns="False" DataKeyNames="DKDT_ID" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True">
                                    <Columns>
                                        <asp:BoundField DataField="DKDT_ID" HeaderText="Mã đề tài" SortExpression="DKDT_ID" ReadOnly="True"></asp:BoundField>
                                        <asp:BoundField DataField="DKDT_TENDETAI" HeaderText="Tên đề tài" SortExpression="DKDT_TENDETAI"></asp:BoundField>
                                        <asp:BoundField DataField="DKDT_KINHPHI" HeaderText="Kinh phí" SortExpression="DKDT_KINHPHI"></asp:BoundField>
                                        <asp:BoundField DataField="DKDT_NOP" HeaderText="Tình trạng" SortExpression="DKDT_NOP"></asp:BoundField>
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

            <div class="main-content container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-default panel-table">
                            <div class="panel-heading">
                                DANH SÁCH THUYẾT MINH ĐỀ TÀI ĐÃ NỘP
                        <div class="tools"></div>
                            </div>
                            <div class="panel-body">
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" GridLines="None" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" AutoGenerateColumns="False" DataKeyNames="DKDT_ID" DataSourceID="SqlDataSource2" ShowHeaderWhenEmpty="True">
                                    <Columns>
                                        <asp:BoundField DataField="TMDT_ID" HeaderText="Mã thuyết minh" SortExpression="TMDT_ID" ReadOnly="True"></asp:BoundField>
                                        <asp:BoundField DataField="DKDT_ID" HeaderText="Mã đề tài" SortExpression="DKDT_ID"></asp:BoundField>
                                        <asp:BoundField DataField="TMDT_TENDETAI" HeaderText="Tên đề tài" SortExpression="TMDT_TENDETAI"></asp:BoundField>
                                        <asp:BoundField DataField="TMDT_NOP" HeaderText="Nộp" SortExpression="TMDT_NOP"></asp:BoundField>
                                        <asp:BoundField DataField="TMDT_TINHTRANG" HeaderText="Trạng thái" SortExpression="TMDT_TINHTRANG">
                                        </asp:BoundField>
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

        </div>
    </div>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:connString %>' SelectCommand="DANGKYDETAI_SELECT_ALL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:connString %>' SelectCommand="THUYETMINHDETAI_SELECT_ALL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
