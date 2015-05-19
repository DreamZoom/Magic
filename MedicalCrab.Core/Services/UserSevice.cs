using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MedicalCrab.Core.Services
{
    /// <summary>
    /// 用户服务
    /// </summary>
    public class UserSevice : Magic.Mvc.Service.Service
    {

        public UserSevice()
            :base(typeof(Models.User))
        {

        }
        /// <summary>
        /// 注册用户
        /// </summary>
        /// <param name="user">用户信息</param>
        /// <returns></returns>
        public bool Register(Models.User user)
        {
            user.Address = "";
            user.Phone = "";
            user.RegTime = DateTime.Now;
            user.SignDiscription = "";
            user.UserImage = "";
            this.Add(user);
            return true;
        }

        /// <summary>
        /// 添加用户
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public override bool Add(Magic.Mvc.Model.Model model)
        {
            var m = model as Models.User;
            if (m == null) throw new ArgumentNullException();
            var user = this.GetModel(string.Format("[UserName]='{0}'", m.UserName));
            if (user != null) throw new Exception("该账户已存在!");
            return base.Add(model);
        }

        /// <summary>
        /// 验证登录
        /// </summary>
        /// <param name="username">用户名</param>
        /// <param name="password">密码</param>
        /// <returns></returns>
        public Models.User Login(string username,string password)
        {
            var model = this.GetModel(string.Format("[UserName]='{0}' and [Password]='{1}'", username, password)) as Models.User;
            return model;
        }

        public Models.User getByUserName(string username)
        {
            return this.GetModel(string.Format("[UserName]='{0}'", username)) as Models.User;
        }

        public void SaveUserImage(string username,string filename)
        {
            var user = this.getByUserName(username);
            if (user == null) throw new Exception("获取用户信息失败");

            user.UserImage = filename;
            this.Update(user);
        }
    }
}
