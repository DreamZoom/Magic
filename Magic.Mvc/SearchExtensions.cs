using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Magic.Mvc;
using System.ComponentModel.DataAnnotations;
namespace System.Web.Mvc
{
    public static class SearchExtensions
    {
        /// <summary>
        /// 在后台组合where 条件
        /// </summary>
        /// <param name="controller"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static string BindWhere(this System.Web.Mvc.Controller controller, Type type)
        {
            List<string> wherelist = new List<string>();//where 列表

            var propertys = type.GetProperties();
            foreach (var p in propertys)
            {
                object[] alist = p.GetCustomAttributes(typeof(SearchAttribute), false);
                if (alist.Length > 0)
                {
                    SearchAttribute sa = alist[0] as SearchAttribute;
                    if (sa == null) continue;
                    string w = sa.getWhere(p, controller.Request);
                    if (string.IsNullOrWhiteSpace(w)) continue;
                    wherelist.Add(w);//获取类型绑定的search对象
                }
            }

            return string.Join(" AND ", wherelist.ToArray());
        }

        /// <summary>
        /// 在网页呈现搜索模块
        /// </summary>
        /// <param name="helper"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static string Search(this System.Web.Mvc.HtmlHelper helper, Type type)
        {
            return Search(helper,type,null);
        }

        /// <summary>
        /// 创建搜索框
        /// </summary>
        /// <param name="helper"></param>
        /// <param name="type"></param>
        /// <param name="parms"></param>
        /// <returns></returns>
        public static string Search(this System.Web.Mvc.HtmlHelper helper, Type type,object parms)
        {
            List<string> plist = new List<string>();//可查询属性 列表
            UrlHelper UrlHelper = new System.Web.Mvc.UrlHelper(helper.ViewContext.RequestContext);

            var propertys = type.GetProperties();
            foreach (var p in propertys)
            {
                object[] alist = p.GetCustomAttributes(typeof(SearchAttribute), false);
                if (alist.Length > 0)
                {
                    SearchAttribute sa = alist[0] as SearchAttribute;
                    if (sa == null) continue;

                    var ls = sa.getInputFiles(p);
                    StringBuilder sb = new StringBuilder();
                    foreach (var l in ls)
                    {
                        var value = sa.getValue(p.Name, helper.ViewContext.HttpContext.Request);
                        var displayname = ((DisplayAttribute[])p.GetCustomAttributes(typeof(DisplayAttribute), false)).FirstOrDefault();
                        sb.Append(string.Format("<label for='{0}' >{2}</label><input type='text' name='{0}' id='{0}' value='{1}' >", p.Name, value, displayname.Name));
                    }
                    plist.Add(string.Format("<span>{0}</span>", sb.ToString()));//获取类型绑定的search对象
                }
            }

            if (plist.Count == 0) return "";
            string actionName = helper.ViewContext.RouteData.Values["action"].ToString();
            string result = string.Format("<div class='query-content'><form action='{0}' name='form-{1}' id='form-{1}'> {2} <span><input type='submit' value='查询'></span><form></div>", UrlHelper.Action(actionName, parms), type.Name, string.Join("", plist.ToArray()));
            return result;
        }
    }
}
