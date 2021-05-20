<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Product.master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MQC.check.Add" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu2").addClass("active");
            $("#subMenu2-3").addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Product" runat="server">
  <%--  <form id="form1" runat="server">--%>
         <div class="form-group">
            <label id="Label0" class="col-md-2 control-label">产品编号</label>
            <div class="col-md-3">
                <input id="TbMaktx" type="text" class="form-control input-sm" runat="server" readonly="true" />
            </div>
        </div>
        <div class="form-group">
            <label id="Label9" class="col-md-2 control-label">模具号</label>
            <div class="col-md-3">
                <input id="TbMold" type="text" class="form-control input-sm" runat="server" readonly="true" />
            </div>
        </div>
        <div class="form-group">
            <label id="Label1" class="col-md-2 control-label">序号</label>
            <div id="DivNo">
                <div class="col-md-3 has-feedback">
                    <input id="TbNo" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnNo" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbNo" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group">
            <label id="Label2" class="col-md-2 control-label">检验类型</label>
            <div id="DivType">
                <div class="col-md-3 has-feedback">
                    <input id="TbType" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnType" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbType" class="col-md-2 control-label"></label>
            </div>
            
        </div>
        <div class="form-group">
            <label id="Label3" class="col-md-2 control-label">检验内容</label>
            <div id="DivContent">
                <div class="col-md-3 has-feedback">
                    <input id="TbContent" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnContent" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbContent" class="col-md-2 control-label"></label>
            </div>
           
        </div>
        <div class="form-group">
            <label id="Label4" class="col-md-2 control-label">检验工具</label>
            <div id="DivTool">
                <div class="col-md-3 has-feedback">
                    <input id="TbTool" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnTool" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbTool" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group">
            <label id="Label5" class="col-md-2 control-label">图纸下公差</label>
            <div id="DivL_Toler">
                <div class="col-md-3 has-feedback">
                    <input id="TbL_Toler" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnL_Toler" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbL_Toler" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group">
            <label id="Label6" class="col-md-2 control-label">图纸上公差</label>
            <div id="DivU_Toler">
                <div class="col-md-3 has-feedback">
                    <input id="TbU_Toler" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnU_Toler" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbU_Toler" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group">
            <label id="Label7" class="col-md-2 control-label">特采下限</label>
            <div id="DivL_Limit1">
                <div class="col-md-3 has-feedback">
                    <input id="TbL_Limit1" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnL_Limit1" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbL_Limit1" class="col-md-2 control-label"></label>
            </div>
            
        </div>
        <div class="form-group">
            <label id="Label8" class="col-md-2 control-label">特采上限</label>
            <div id="DivU_Limit1">
                <div class="col-md-3 has-feedback">
                    <input id="TbU_Limit1" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnU_Limit1" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-2"></div>
            <div class="col-md-3 has-feedback">
                <asp:Button ID="CheckSave" CssClass="btn btn-default" runat="server" Text="保存" OnClick="Save_Click" />
            </div>
        </div>
 <%--   </form>--%>
</asp:Content>
