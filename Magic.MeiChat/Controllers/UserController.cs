using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Magic.MeiChat.Controllers
{
    public class UserController : Magic.Mvc.Controller.JsonManage
    {
        //
        // GET: /User/

        public ActionResult Index()
        {
            return View();
        }

    }
}
