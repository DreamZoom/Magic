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
        /// <summary>
        /// 注册用户
        /// </summary>
        /// <param name="user">用户信息</param>
        /// <returns></returns>
        public bool Register(Models.User user)
        {           
            this.Add(user);
            return true;
        }

        /// <summary>
        /// 添加用户
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public override bool Add(Models.User model)
        {
            var user = this.GetModel(string.Format("[UserName]={0}", model.UserName));
            if (model != null) throw new Exception("该账户已存在!");
            return base.Add(model);
        }

        /// <summary>
        /// 验证登录
        /// </summary>
        /// <param name="username">用户名</param>
        /// <param name="password">密码</param>
        /// <returns></returns>
        public bool Login(string username,string password)
        {
            var model = this.GetModel(string.Format("[UserName]={0} and [Password]={1}", username,password));
            return model != null;
        }
    }
}
