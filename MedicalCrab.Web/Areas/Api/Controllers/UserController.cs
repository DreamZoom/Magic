using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;

using System.Web.Http;
using System.Web.Mvc;
using MedicalCrab.Core;
using MedicalCrab.Core.Utility;
using System.Security.Cryptography;
using System.Text;

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
            var user = userService.Login(username, password);
            if (user != null)
            {
                byte[] result = Encoding.Default.GetBytes(username + DateTime.Now.ToString());
                MD5 md5 = new MD5CryptoServiceProvider();
                byte[] output = md5.ComputeHash(result);
                string token = BitConverter.ToString(output).Replace("-", "");
                return this.SuccessJson(new { user = user, token = token }, "登录成功。");
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
                HXRestApi api = new HXRestApi("YXA6SVlUUCWEEeWx_C8p0OTisQ", "YXA65l1CuWGQBgTVZZTrIf8TfS4gQA8", "imchat", "dreamzoom");
               
                if (!ModelState.IsValid)
                {
                    throw new Exception(string.Join(",", ModelState.ToArray()));
                }
                api.AccountCreate(user.UserName, "123456");

                userService.Register(user);
                return this.SuccessJson("注册成功。");
            }
            catch (Exception err)
            {
                return this.ErrorJson(err.Message);
            }

        }

        public ActionResult UserInfo(string username)
        {
           
            var model = userService.GetModel(string.Format("[UserName]='{0}'", username));
            if (model != null)
            {
                return this.SuccessJson(model, "获取用户信息成功。");
            }
            return this.ErrorJson("获取用户信息失败");
        }

        [System.Web.Mvc.HttpPost]
        public ActionResult Edit(string username, MedicalCrab.Core.Models.User user)
        {
            try
            {
                var u = userService.EditUser(username, user);
                return this.SuccessJson(u, "获取用户信息成功。");
            }
            catch (Exception err)
            {
                return this.ErrorJson(err.Message);
            }
        }

        /*
         * 记录地理信息
         * */
        MedicalCrab.Core.Services.PositionLogService positionService = new Core.Services.PositionLogService();
        public ActionResult UpdateLocation(MedicalCrab.Core.Models.PositionLog log)
        {
            try
            {
                //9d9a55bb-1572-49cb-8e68-44ce8e0945c7
                var pos = positionService.AddPosition(log);
                return this.SuccessJson(pos, "更新地理信息成功。");
            }
            catch (Exception err)
            {
                return this.ErrorJson(err.Message);
            }
        }

        [System.Web.Mvc.HttpPost]
        public string UploadHandImage(string username, int x, int y, int w, int h, int sw, int sh)
        {
            Response.Charset = "UTF8";
            string result = "";
            var file = Request.Files["upload_img"];
            if (file != null && file.ContentLength != 0)
            {
                try
                {
                    string filename = Uploader.SaveUserHandImage(username, file, x, y, w, h, sw, sh);
                    userService.SaveUserImage(username, filename);
                    result = filename;
                    return result;
                }
                catch (Exception err)
                {
                    result = "no";
                    return result;
                }

            }
            return result;
        }


        MedicalCrab.Core.Services.vUserFriendsService userFriendsService = new Core.Services.vUserFriendsService();
        /// <summary>
        /// 获取好友列表
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public ActionResult getFriends(string usernames)
        {
            
            try
            {
                var ls =usernames.Split(',');
                List<string> strList = new List<string>();
                foreach(var s in ls){
                    var s1 = string.Format("'{0}'",s);
                    strList.Add(s1);
                }

                var list = userService.GetModelList(string.Format("[UserName] in ({0})", string.Join(",",strList)));

                return this.SuccessJson(list, "获取好友列表成功。");
            }
            catch (Exception err)
            {
                return this.ErrorJson(err.Message);
            }
        }

        public ActionResult SearchUser(string username)
        {
            try
            {
                var list = userService.GetModelList(string.Format("[UserName] like '%{0}%'", username));

                return this.SuccessJson(list, "搜索好友成功。");
            }
            catch (Exception err)
            {
                return this.ErrorJson(err.Message);
            }
        }

        public ActionResult getUserImage(string username)
        {
            try
            {
                var u = userService.getByUserName(username);
                return File(Server.MapPath(u.UserImage), "jpeg/jpg");
            }
            catch (Exception err)
            {
                return Content("/upload/defult_user.jpg");
            }
        }
    }
}
