<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Magic.MeiChat.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function Reload(data) {
            if (data.result) {
                alert(data.message);
            }
            else {
                alert(data.message);
            }
        }
    </script>
    <h2>Index</h2>
    <div id="upload-body">
        <div id="returnData" style="display: none"></div>
        <% using (Ajax.BeginForm("Create", "User",
    new AjaxOptions
    {
        InsertionMode = InsertionMode.Replace,
        HttpMethod = "Post",
        //UpdateTargetId = "returnData", 
        OnSuccess = "Reload(data)",
        OnFailure = "DisplayError(data)"
    }))
           {%>

        <fieldset>
            <legend>no fresh to upload data</legend>
            <%:Html.EditorForModel() %>

            <input type="submit" value="Submit" />
        </fieldset>
        <%}%>
    </div>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
