using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using MedicalCrab.Core;

namespace MedicalCrab.Web.Areas.Api.Controllers
{
    public class UserController : Controller
    {

        MedicalCrab.Core.Services.UserSevice userService = new Core.Services.UserSevice();

        /// <summary>
        /// 登录操作
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public ActionResult Login(string username, string password)
        {
            if (userService.Login(username, password))
            {
                return this.SuccessJson("登录成功。");
            }
            return this.ErrorJson("登录失败。用户名或密码错误。");
        }

        /// <summary>
        /// 注册用户
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public ActionResult Register(MedicalCrab.Core.Models.User user)
        {
            try
            {
                if(ModelState.Count>0)
                {
                    throw new Exception(string.Join(",",ModelState.ToArray()));
                }
                userService.Register(user);
                return this.SuccessJson("登录成功。");
            }
            catch(Exception err)
            {
                return this.ErrorJson(err.Message);
            }

        }
    }
}
