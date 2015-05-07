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


        #region 操作提示

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

        public static ActionResult SuccessJson(this System.Web.Mvc.Controller controller,  string message)
        {
            return controller.SuccessJson(null, message);
        }
        public static ActionResult SuccessJson(this System.Web.Mvc.Controller controller,object data=null, string message="操作成功")
        {
            var result = new JsonResult();
            result.ContentEncoding = Encoding.Unicode;
            result.ContentType = "application/json";
            result.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            result.Data = new {
                result=true,
                message=message,
                data = data
            };
            return result;
        }

        public static ActionResult ErrorJson(this System.Web.Mvc.Controller controller, string message)
        {
            return controller.ErrorJson(null, message);
        }
        public static ActionResult ErrorJson(this System.Web.Mvc.Controller controller, object data = null, string message="操作失败")
        {
            var result = new JsonResult();
            result.ContentEncoding = Encoding.Unicode;
            result.ContentType = "application/json";
            result.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            result.Data = new
            {
                result = false,
                message = message,
                data = data
            };
            return result;
        }

        #endregion

        #region 根据模型获取参数
        public static string GetPrimaryWhere(this System.Web.Mvc.Controller controller, Type type,System.Web.HttpRequestBase request)
        {
            var propertys = Model.ModelInfoProvider.getFiledsByAttribute(type, typeof(Model.KeyAttribute));
            List<string> where = new List<string>();
            foreach (var p in propertys)
            {
                if (string.IsNullOrWhiteSpace(request[p.Name])) continue;
                where.Add(string.Format("[{0}]={1}", p.Name, request[p.Name]));
            }
            return string.Join(" and ",where);
        }

        #endregion

    }
}
