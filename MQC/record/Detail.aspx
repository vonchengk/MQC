<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Record.master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="MQC.record.Detail" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu4").addClass("active");
            $("#subMenu2-1").addClass("active");
        });
    </script>
    <style>
        .hidden{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Record1" runat="server">
    <div class="form-group">
        <ul id="status" class="nav nav-pills" runat="server">
          <li id="LiWait" role="presentation" class="active" runat="server">
              <asp:LinkButton ID="WaitCheck" runat="server" OnClick="WaitCheck_Click">待检</asp:LinkButton>
          </li>
          <li id="LiCheck" role="presentation" runat="server">
              <asp:LinkButton ID="Checking" runat="server" OnClick="Checking_Click" >检验中</asp:LinkButton>
          </li>
          <li id="LiReturn" role="presentation" runat="server">
              <asp:LinkButton ID="Back" runat="server" OnClick="Back_Click" >不良退回</asp:LinkButton>
          </li>
          <li id="LiEnd" role="presentation" runat="server">
              <asp:LinkButton ID="Complete" runat="server" OnClick="Complete_Click" >已完成</asp:LinkButton>
          </li>
        </ul>
    </div>
    
   <div class="form-group">
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
           <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
                <HeaderStyle Width="40px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Id" SortExpression="Rid">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Rid") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Rid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="送检批次" SortExpression="Batch">
                <EditItemTemplate>
                    <asp:TextBox ID="TbBatch" runat="server" Text='<%# Bind("Batch") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LbBatch" runat="server" Text='<%# Bind("Batch") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="120px" Wrap="False" />
                <ItemStyle Width="120px" Wrap="False" />
            </asp:TemplateField>
            <asp:BoundField DataField="Maktx" HeaderText="产品" SortExpression="Maktx">
                <HeaderStyle Width="100px" Wrap="False" />
                <ItemStyle Width="100px" Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="Customer" HeaderText="客户" SortExpression="Customer">
                <HeaderStyle Width="80px" Wrap="False" />
                <ItemStyle Width="80px" Wrap="False" />
            </asp:BoundField>
            <asp:CommandField SelectText="输入数据" ShowSelectButton="True">
                <HeaderStyle Width="60px" Wrap="False" />
                <ItemStyle Width="60px" Wrap="False" ForeColor="#337AB7" />
            </asp:CommandField>
            <asp:BoundField DataField="Status" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="PS2" runat="server" CausesValidation="False" CommandName="PS2"  Text="反馈"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle Width="60px" Wrap="False" />
                <ItemStyle ForeColor="#337AB7" Width="60px" Wrap="False" />
            </asp:TemplateField>
        </Columns>
           <FooterStyle BackColor="#CCCCCC" />
           <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" CssClass="page" />
           <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
           <SortedAscendingCellStyle BackColor="#F1F1F1" />
           <SortedAscendingHeaderStyle BackColor="#808080" />
           <SortedDescendingCellStyle BackColor="#CAC9C9" />
           <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
   </div>
    
     <div class="form-group btn-group" role="group" >
        <asp:Button ID="BtnStart" CssClass="btn btn-default" runat="server" Text="开始检验" OnClick="BtnStart_Click" />
        <asp:Button ID="BtnReturn" CssClass="btn btn-default" runat="server" Text="不良退回" OnClick="BtnReturn_Click" />
        <asp:Button ID="BtnEnd" CssClass="btn btn-default" runat="server" Text="检验完成" OnClick="BtnEnd_Click" />
    </div>
</asp:Content>
