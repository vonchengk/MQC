<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Product.master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="MQC.cavity.Detail" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu2").addClass("active");
            $("#subMenu2-2").addClass("active");
        });
    </script>
    <style>
        .hidden{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Product" runat="server">
    <%--    <form id="form1" runat="server">--%>
        <div class="form-group">
            <a type="button" class="btn btn-default" href="Search.aspx">
                <%--<span class="glyphicon glyphicon-arrow-left">--%>返回<%--</span>--%>
            </a>
        </div>
        <div class="form-group">
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="ID" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" >
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="Cid" HeaderText="ID" SortExpression="Cid">
                        <ItemStyle Width="100px" Height="30px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Mold" HeaderText="工装模具编号" SortExpression="Mold" >
                        <ItemStyle Width="100px" Height="30px"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Maktx" HeaderText="产品编号" SortExpression="Maktx">
                        <ItemStyle Width="100px" Height="30px"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Num" HeaderText="数据组(型腔数)" SortExpression="Num">
                        <ItemStyle Width="100px" Height="30px"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="PS" HeaderText="工装模具备注" SortExpression="PS">
                        <ItemStyle Width="100px" Height="30px"/>
                    </asp:BoundField>
                    <%--<asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="编辑"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>--%>
                    <asp:CommandField SelectText="修改" ShowSelectButton="True">
                        <ItemStyle Width="50px" ForeColor="#337AB7" />
                    </asp:CommandField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="if(confirm('是否确定删除？')){return true;}else{return false;}"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" CssClass="page" />
                <%--<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />--%>
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </div>
<%--    </form>--%>
</asp:Content>
