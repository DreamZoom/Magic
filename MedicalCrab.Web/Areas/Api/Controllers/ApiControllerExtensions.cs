using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text;

namespace MedicalCrab.Web.Areas.Api.Controllers
{
    public static class ApiControllerExtensions
    {
        public static ActionResult SuccessJson(this System.Web.Mvc.Controller controller, string message)
        {
            return controller.SuccessJson(null, message);
        }
        public static ActionResult SuccessJson(this System.Web.Mvc.Controller controller, object data = null, string message = "操作成功")
        {
            var result = new JsonResult();
            result.ContentEncoding = Encoding.Unicode;
            result.ContentType = "application/json";
            result.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            result.Data = new
            {
                result = true,
                message = message,
                data = data
            };
            return result;
        }

        public static ActionResult ErrorJson(this System.Web.Mvc.Controller controller, string message)
        {
            return controller.ErrorJson(null, message);
        }
        public static ActionResult ErrorJson(this System.Web.Mvc.Controller controller, object data = null, string message = "操作失败")
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
    }
}