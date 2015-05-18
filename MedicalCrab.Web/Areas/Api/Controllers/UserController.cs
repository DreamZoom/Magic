using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using MedicalCrab.Core;
using System.Security.Cryptography;
using System.Text;  

namespace MedicalCrab.Web.Areas.Api.Controllers
{
    public class UserController : Controller
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
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
                byte[] result = Encoding.Default.GetBytes(username+DateTime.Now.ToString());
                MD5 md5 = new MD5CryptoServiceProvider();
                byte[] output = md5.ComputeHash(result);
                string token = BitConverter.ToString(output).Replace("-", "");
                return this.SuccessJson(new { token = token }, "登录成功。");
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
                log.Debug(user.UserName);
                if(!ModelState.IsValid)
                {
                    throw new Exception(string.Join(",",ModelState.ToArray()));
                }
                userService.Register(user);
                return this.SuccessJson("注册成功。");
            }
            catch(Exception err)
            {
                return this.ErrorJson(err.Message);
            }

        }


        public ActionResult UserInfo(string username)
        {
            log.Debug(username);
            var model = userService.GetModel(string.Format("[UserName]='{0}'",username));
            if (model != null)
            {
                return this.SuccessJson(model,"获取用户信息成功。");
            }
            return this.ErrorJson("获取用户信息失败");
        }

        public ActionResult UploadHandImage(string username)
        {
            return this.ErrorJson("获取用户信息失败");
        }
        
    }
}
