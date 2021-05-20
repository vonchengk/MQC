<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Product.master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="MQC.product.Detail" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu2").addClass("active");
            $("#subMenu2-1").addClass("active");
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
    <script type="text/javascript">
        $("#subMenu2-1").addClass("active");
    </script>
        <div class="form-group">
            <a class="btn btn-default" href="Search.aspx">返回</a>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Pid" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                 <AlternatingRowStyle BackColor="#CCCCCC" />
                 <Columns>
                    
                     <asp:BoundField DataField="Pid" HeaderText="ID" SortExpression="Pid" ReadOnly="true">
                         <HeaderStyle Width="50px" Wrap="False" />
                         <ItemStyle Width="50px" />
                     </asp:BoundField>
                     <asp:TemplateField HeaderText="产品编号" SortExpression="Maktx">
                         <EditItemTemplate>
                         <%--    <asp:TextBox ID="TxtMaktx" runat="server" CssClass="form-control gridview-text-100" Text='<%# Bind("Maktx") %>'></asp:TextBox>--%>
                              <asp:Label ID="LabMaktx" runat="server" Text='<%# Bind("Maktx") %>'></asp:Label>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="LabMaktx" runat="server" Text='<%# Bind("Maktx") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle Width="100px" Wrap="False" />
                         <ItemStyle Width="100px" Height="40px" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Sap编号" SortExpression="Matnr">
                         <EditItemTemplate>
                             <asp:TextBox ID="TxtMatnr" runat="server" CssClass="form-control gridview-text-100" Text='<%# Bind("Matnr") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="LabMatnr" runat="server" Text='<%# Bind("Matnr") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle Width="100px" Wrap="False" />
                         <ItemStyle Width="100px" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="产品系列" SortExpression="Series">
                         <EditItemTemplate>
                             <asp:TextBox ID="TxtSeries" runat="server" CssClass="form-control gridview-text-100" Text='<%# Bind("Series") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="LabSeries" runat="server"  Text='<%# Bind("Series") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle Width="100px" Wrap="False" />
                         <ItemStyle Width="100px" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="客户" SortExpression="Customer">
                         <EditItemTemplate>
                             <asp:DropDownList ID="DdlCustomer" runat="server" CssClass="form-control gridview-text-100" Text='<%# Bind("Customer") %>' DataSourceID="LinqDataSourceToCustomer" DataValueField="Name"></asp:DropDownList>
                             <asp:LinqDataSource ID="LinqDataSourceToCustomer" runat="server" ContextTypeName="MQC.DbAppDataContext" EntityTypeName="" Select="new (Name)" TableName="Customer">
                             </asp:LinqDataSource>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="LabCustomer" runat="server"  Text='<%# Bind("Customer") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle Width="100px" Wrap="False" />
                         <ItemStyle Width="100px" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="检验规范" SortExpression="Standard">
                         <EditItemTemplate>
                             <asp:TextBox ID="TxtStandard" runat="server" CssClass="form-control gridview-text-100" Text='<%# Bind("Standard") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="LabStandard" runat="server"  Text='<%# Bind("Standard") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle Width="100px" Wrap="False" />
                         <ItemStyle Width="100px" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="规范版本" SortExpression="Version">
                         <EditItemTemplate>
                             <asp:TextBox ID="TxtVersion" runat="server" CssClass="form-control gridview-text-100" Text='<%# Bind("Version") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="LabVersion" runat="server"  Text='<%# Bind("Version") %>'></asp:Label>
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
                         <HeaderStyle Width="80px" />
                     </asp:TemplateField>
                     <asp:TemplateField ShowHeader="False">
                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="if(confirm('是否确定删除？')){return true;}else{return false;}"></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
                 <EditRowStyle BorderStyle="None" Wrap="False" />
                 <FooterStyle BackColor="#CCCCCC" />
                 <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Width="100px" Wrap="False" />
                 <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" CssClass="page"/>
                 <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                 <SortedAscendingCellStyle BackColor="#F1F1F1" />
                 <SortedAscendingHeaderStyle BackColor="#808080" />
                 <SortedDescendingCellStyle BackColor="#CAC9C9" />
                 <SortedDescendingHeaderStyle BackColor="#383838" />
             </asp:GridView>

        </div>
<%--    </form>--%>
</asp:Content>
