<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Product.master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="MQC.check.Detail" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu2").addClass("active");
            $("#subMenu2-3").addClass("active");
        });
    </script>
    <style>
        .hidden{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Product" runat="server">
    <%--  <form id="form1" runat="server">--%>
        <div class="form-group">
            <a type="button" class="btn btn-default" href="Search.aspx">返回</a>
            <asp:Button ID="Add" CssClass="btn btn-default" runat="server" Text="新增检验项" OnClick="Add_Click" />
        </div>
        <div id="DivGrid" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CheckId"  OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="CheckId" HeaderText="Id" SortExpression="CheckId"  ReadOnly="true">
                <HeaderStyle Width="50px" Wrap="False" />
                <ItemStyle Width="50px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="序号" SortExpression="No">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbNo" runat="server" CssClass="form-control gridview-text-50"  Text='<%# Bind("No") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"  Text='<%# Bind("No") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="50px" Wrap="False" />
                    <ItemStyle Width="50px" Height="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="检验类型" SortExpression="Type">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbType" runat="server" CssClass="form-control" Text='<%# Bind("Type") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="100px" Wrap="False" />
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="检验内容" SortExpression="Content">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbContent" runat="server" CssClass="form-control" Text='<%# Bind("Content") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server"  Text='<%# Bind("Content") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="100px" Wrap="False" />
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="检验工具" SortExpression="Tool">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbTool" runat="server" CssClass="form-control" Text='<%# Bind("Tool") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Tool") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="100px" Wrap="False" />
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="图纸下公差" SortExpression="L_Toler">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbL_Toler" runat="server" CssClass="form-control" Text='<%# Bind("L_Toler") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("L_Toler") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="100px" Wrap="False" />
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="图纸上公差" SortExpression="U_Toler">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbU_Toler" runat="server" CssClass="form-control" Text='<%# Bind("U_Toler") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("U_Toler") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="100px" Wrap="False" />
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="特采下限" SortExpression="L_Limit1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbL_Limit1" runat="server" CssClass="form-control" Text='<%# Bind("L_Limit1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("L_Limit1") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="100px" Wrap="False" />
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="特采上限">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbU_Limit1" runat="server" CssClass="form-control" Text='<%# Bind("U_Limit1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server"  Text='<%# Bind("U_Limit1") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="100px" Wrap="False" />
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="判定下限" SortExpression="L_Limit2">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbL_Limit2" runat="server" CssClass="form-control" Text='<%# Bind("L_Limit2") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("L_Limit2") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="100px" Wrap="False" />
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="判定上限" SortExpression="U_Limit2">
                    <EditItemTemplate>
                        <asp:TextBox ID="TbU_Limit2" runat="server" CssClass="form-control" Text='<%# Bind("U_Limit2") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server"  Text='<%# Bind("U_Limit2") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="100px" Wrap="False" />
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButtonUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtonChange" runat="server" CausesValidation="False" CommandName="Edit" Text="修改"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="70px" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="if(confirm('是否确定删除？')){return true;}else{return false;}"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BorderStyle="None" Wrap="False" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Width="100px" Wrap="False" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" CssClass="page" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        </div>
<%--    </form>--%>
</asp:Content>
