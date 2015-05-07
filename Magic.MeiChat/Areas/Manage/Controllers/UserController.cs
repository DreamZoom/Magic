using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Magic.MeiChat.Areas.Manage.Controllers
{
    public class UserController : Magic.Mvc.Controller.Manage
    {
        //
        // GET: /Manage/User/

        public ActionResult Index()
        {
            return View();
        }

    }
}
