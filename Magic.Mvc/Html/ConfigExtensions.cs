using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace Magic.Mvc.Html
{
    public static class ConfigExtensions
    {
        #region Config 读取配置文件
        public static void Config(this HtmlHelper html, string key, string value)
        {
            new Config()[key] = value;
        }

        public static string Config(this HtmlHelper html, string key)
        {
            return new Config()[key];
        }
        #endregion
    }
}
