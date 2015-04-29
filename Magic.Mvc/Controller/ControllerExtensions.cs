using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace Magic.Mvc.Controller
{
    public static class ControllerExtensions
    {
        #region Config 读取配置文件
        public static void Config(this System.Web.Mvc.Controller controller,string key,string value)
        {
            new Config()[key]=value;
        }

        public static string Config(this System.Web.Mvc.Controller controller, string key)
        {
            return new Config()[key];
        }
        #endregion
    }
}
