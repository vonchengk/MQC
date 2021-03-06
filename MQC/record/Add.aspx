<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Record.master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MQC.record.Add" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu4").addClass("active");
            $("#subMenu2-1").addClass("active");
        });
    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Record1" runat="server">
    <style>
        th{
          text-align:center;
        }
         .hidden{
            display:none;
        }
    </style>
    <div id="container1" class="container">
        <div class="col-md-5">
            <div class="row">
                <span id="Label1" class="col-md-3">送检批次</span>
                <asp:Label ID="LbBatch" CssClass="col-md-7" runat="server" Text=""></asp:Label>
            </div>
            <div class="row">
                <span id="Label2" class="col-md-3">产品编号</span>
                <asp:Label ID="LbMaktx" CssClass="col-md-7" runat="server" Text=""></asp:Label>
            </div>
            <div class="row">
                <span id="Label3" class="col-md-3">工装模具</span>
                <asp:Label ID="LbMold" CssClass="col-md-7" runat="server" Text=""></asp:Label>
            </div>
            <div class="row">
                <span id="Label4" class="col-md-3">日期</span>
                <asp:Label ID="LbDate" CssClass="col-md-7" runat="server" Text=""></asp:Label>
            </div>
            <div class="row">
                <span id="Label5" class="col-md-3">客户</span>
                <asp:Label ID="LbCustomer" CssClass="col-md-7" runat="server" Text="1111"></asp:Label>
            </div>
            <div class="row">
                <span id="Label6" class="col-md-3">检验规范</span>
                <asp:Label ID="LbStandard" CssClass="col-md-7" runat="server" Text="11111"></asp:Label>
            </div>
        </div>
       

        <div class="form-group col-md-7">
            <label>送检批次备注</label>
            <textarea id="TaPs" class="form-control" runat="server"></textarea>
        </div>
        <asp:Button ID="BtnPs" CssClass="btn btn-default" runat="server" Text="提交备注" OnClick="BtnPs_Click" />
     </div>

    <%--<div id="container3">
        <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" Text="检验完成" />
    </div>--%>

    <div id="container2" class="col-md-4">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="CavityNo" HeaderText="数据组(型腔号)" SortExpression="CavityNo" >
                    <HeaderStyle Width="60px" Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Height="30px" Width="60px" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Stamp" HeaderText="标记" SortExpression="Stamp">
                    <HeaderStyle Width="60px" Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Height="30px" Width="60px" HorizontalAlign="Center" VerticalAlign="Middle"/>
                </asp:BoundField>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" >
                <HeaderStyle Width="50px" Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle"/>
                <ItemStyle Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                </asp:CommandField>
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


    <div class="content col-md-7">
       <%-- <iframe id="iframe1" frameborder=0 runat="server"></iframe>--%>
        <div class="form-group">
            <asp:Label ID="LbCavity" CssClass="col-md-2" runat="server" Text=""></asp:Label>
            <div class="col-md-4">
                <asp:Button ID="BtnError" CssClass="btn btn-default" runat="server" Text="堵腔" OnClick="BtnError_Click" />
            </div>
            <%--<asp:Button ID="BtnSubmit" CssClass="btn btn-default" runat="server" Text="提交" />--%>
        </div>
        <div>
            <asp:GridView ID="GridView2" runat="server" DataKeyNames="RCId"  AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnRowEditing="GridView2_RowEditing" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowUpdating="GridView2_RowUpdating" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="型腔号" SortExpression="CavityNo">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CavityNo") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("CavityNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="id" SortExpression="RCId">
                        <EditItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("RCId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("RCId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="序号" SortExpression="No">
                        <EditItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("No") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("No") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                        <ItemStyle Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="检验类型" SortExpression="Type">
                        <EditItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                        <ItemStyle Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="检验内容" SortExpression="Content">
                        <EditItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Content") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Content") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                        <ItemStyle Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="检验工具" SortExpression="Tool">
                        <EditItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("Tool") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("Tool") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                        <ItemStyle Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="判定下限" SortExpression="L_Limit">
                        <EditItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("L_Limit") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("L_Limit") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                        <ItemStyle Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="判定上限" SortExpression="U_Limit">
                        <EditItemTemplate>
                            <asp:Label ID="Label15" runat="server" Text='<%# Bind("U_Limit") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("U_Limit") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                        <ItemStyle Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="检验结果" SortExpression="Result">
                        <EditItemTemplate>
                            <asp:HiddenField ID="HidResult" runat="server" Value='<%# Bind("Result") %>' />
                            <asp:TextBox ID="TbResult" runat="server" CssClass="form-control gridview-text-100"></asp:TextBox>
                            <asp:DropDownList ID="DdlResult" runat="server" CssClass="form-control gridview-text-100">
                                <asp:ListItem ></asp:ListItem>
                                <asp:ListItem >OK</asp:ListItem>
                                <asp:ListItem>NG</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LbResult" runat="server" Text='<%# Bind("Result") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="70px" Wrap="False" />
                        <ItemStyle Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="70px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="70px" Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="70px" Wrap="False" />
                    </asp:CommandField>
                    <asp:BoundField DataField="Batch"></asp:BoundField>
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
    </div>
</asp:Content>
