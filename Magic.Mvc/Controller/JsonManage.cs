using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Reflection;
namespace Magic.Mvc.Controller
{
    public class JsonManage : System.Web.Mvc.Controller
    {
        protected override void Initialize(System.Web.Routing.RequestContext requestContext)
        {
            base.Initialize(requestContext);
        }

       
        /*
         * 映射对应serviceapi
         * 
         * */ 
         public Service.Service Service { get; set; }

         public ActionResult Api(string apiname,object[] parms)
         {
             MethodInfo method = Service.GetType().GetMethod(apiname);

             method.Invoke(Service, parms);
             return View();
         }


    }
}
