using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MedicalCrab.Core.Services
{
    public class DynamicService:Magic.Mvc.Service.Service
    {
        public UserSevice user = new UserSevice();
        public DynamicService() : base(typeof(Models.tDynamic)) { }


        /// <summary>
        /// 新增动态
        /// </summary>
        /// <param name="dynamic"></param>
        /// <returns></returns>
        public bool AddDynamic(Models.tDynamic dynamic,string username) 
        {
            var currentUser = user.getByUserName(username);

            if (null == currentUser) return false;
            dynamic.fUserId = currentUser.ID;
            dynamic.fImage = string.IsNullOrEmpty(dynamic.fImage) ? "" : dynamic.fImage;
            dynamic.fImageCount = string.IsNullOrEmpty(dynamic.fImage) ? 0 : dynamic.fImageCount;
            dynamic.fTag1 = string.IsNullOrEmpty(dynamic.fTag1) ? "" : dynamic.fTag1;
            dynamic.fTag2 = string.IsNullOrEmpty(dynamic.fTag1) ? "" : dynamic.fTag2;
            dynamic.fTag3 = string.IsNullOrEmpty(dynamic.fTag1) ? "" : dynamic.fTag3;
            dynamic.fTag4 = string.IsNullOrEmpty(dynamic.fTag1) ? "" : dynamic.fTag4;
            dynamic.fState = 1;
            dynamic.fDate = DateTime.Now;

            this.Add(dynamic);
            return true;
        }

        public List<MedicalCrab.Core.Models.tDynamic> GetDynamic() 
        {
            var list = this.GetModelList("");
            return (List<MedicalCrab.Core.Models.tDynamic>)list;
        }

    }
}
