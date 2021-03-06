<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Send.master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MQC.send.Add" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu3").addClass("active");
            $("#subMenu2-1").addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="SendMaster" runat="server">
    <div class="form-group">
            <label id="Label1" class="col-md-2 control-label">产品编号</label>
            <div id="DivMaktx">
                <div class="col-md-3 has-feedback">
                    <input id="TbMaktx" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnMaktx" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbMaktx" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group">
            <label id="Label2" class="col-md-2 control-label">工装模具号</label>
            <div id="DivMold">
                <div class="col-md-3 has-feedback">
                    <input id="TbMold" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnMold" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbMold" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-2"></div>
            <div class="col-md-3 has-feedback">
                <asp:Button ID="CreateBatch" CssClass="btn btn-default" runat="server" Text="创建" OnClick="CreateBatch_Click" />
            </div>
        </div>
</asp:Content>
