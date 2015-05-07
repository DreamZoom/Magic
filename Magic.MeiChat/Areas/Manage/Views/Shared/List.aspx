<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Manage/Views/Shared/IFrame.Master" Inherits="System.Web.Mvc.ViewPage<Magic.Mvc.TabledList<Magic.Mvc.Model.Model>>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Model.ModelMetadata.DisplayName %>列表
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h1><%: Model.ModelMetadata.DisplayName %>列表
			<small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                list
            </small>
        </h1>
    </div>
  
    <div>
        <%:Html.Search(Model.ModelType) %>
    </div>
    <%: Html.Gird(Model,true) %>
    
</asp:Content>


