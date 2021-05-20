<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Record.master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MQC.record.Search" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu4").addClass("active");
            $("#subMenu2-1").addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Record1" runat="server">
    <div class="form-group">
        <label id="Label1" class="col-md-2 control-label" runat="server">送检批次</label>
        <div id="DivBatch">
            <div class="col-md-3 has-feedback">
                <input id="TbBatch" type="text" class="form-control input-sm" runat="server" />
                <span  id="SpnBatch" class="form-control-feedback" aria-hidden="true"></span> 
            </div>
            <label id="LbBatch" class="col-md-2 control-label"></label>
        </div>
    </div>
    <div id="DivBtn" class="form-group">
        <div class="col-md-2 col-lg-offset-2">
            <asp:Button ID="SearchBatch" CssClass="btn btn-default" runat="server" Text="查询" OnClick="SearchBatch_Click" />
        </div>
    </div>
</asp:Content>
