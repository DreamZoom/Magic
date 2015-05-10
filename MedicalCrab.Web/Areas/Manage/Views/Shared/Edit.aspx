<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Manage/Views/Shared/IFrame.Master" Inherits="System.Web.Mvc.ViewPage<Magic.Mvc.Model.Model>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    修改
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h1>修改
			<small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                Edit
            </small>
        </h1>
    </div>
    <!-- /.page-header -->
    <div class="col-md-8 col-md-offset-2 property-from">
        <%using (Html.BeginForm())
          { %>
        <%if (!ViewData.ModelState.IsValid)
          {%>
        <div class="warning">
            <%:Html.ValidationSummary() %>
        </div>

        <%} %>
        <%:Html.EditorForModel() %>
        <p>
            <input type="submit" value="修改" class="btn btn-success" /><i> </i><a href="<%:Url.Action("List") %>" class="btn btn-info">返回列表</a>
        </p>

        <%} %>
    </div>

</asp:Content>
