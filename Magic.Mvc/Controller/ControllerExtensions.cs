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


        public static ActionResult Success(this System.Web.Mvc.Controller controller, string message, string returnUrl, int inteval = 5)
        {
            var result = new ViewResult()
            {
                 ViewName = "Success"
            };
            result.ViewBag.Message = message;
            result.ViewBag.ReturnUrl = returnUrl;
            result.ViewBag.Interval = inteval;
            return result;
        }

        public static ActionResult Error(this System.Web.Mvc.Controller controller, string message, string returnUrl, int inteval = 5)
        {
            var result = new ViewResult()
            {
                ViewName = "Error"
            };
            result.ViewBag.Message = message;
            result.ViewBag.ReturnUrl = returnUrl;
            result.ViewBag.Interval = inteval;
            return result;
        }
    }
}
