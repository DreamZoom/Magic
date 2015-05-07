using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Magic.Mvc;
using Magic.Mvc.Model;
using Magic.Mvc.Html;
using Webdiyer.WebControls.Mvc;
namespace System.Web.Mvc
{
    public static class GirdExtensions
    {
        public static MvcHtmlString Gird(this HtmlHelper helper, TabledList<Model> tabledList)
        {
            Gird gird = new Gird(tabledList);
            PagedList<Model> pagedlist = new PagedList<Model>(tabledList, tabledList.Page, tabledList.PageSize, tabledList.RecordCount);
            gird.Pagers = helper.Pager(pagedlist, new PagerOptions()
            {
                AutoHide = false,
                ContainerTagName = "span",
                CssClass = "pull-right"
            }).ToHtmlString();

            return new MvcHtmlString(gird.Reader());
        }

        public static MvcHtmlString Gird(this HtmlHelper helper, TabledList<Model> tabledList,bool showCheck)
        {
            Gird gird = new Gird(tabledList);
            PagedList<Model> pagedlist = new PagedList<Model>(tabledList, tabledList.Page, tabledList.PageSize, tabledList.RecordCount);
            gird.Pagers = helper.Pager(pagedlist, new PagerOptions()
            {
                AutoHide = false,
                ContainerTagName = "span",
                CssClass = "pull-right"
            }).ToHtmlString();

            gird.ShowCheckBox = showCheck;
            return new MvcHtmlString(gird.Reader());
        }
    }
}
