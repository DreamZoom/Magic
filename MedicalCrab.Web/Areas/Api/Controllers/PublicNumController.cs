using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MedicalCrab.Core.Models;

namespace MedicalCrab.Web.Areas.Api.Controllers
{
    public class PublicNumController : Controller
    {
        //
        // GET: /Api/PublicNum/
        MedicalCrab.Core.Services.tPublicRelation publicRelationService = new Core.Services.tPublicRelation();
        MedicalCrab.Core.Services.tPublicNum publicNumService = new Core.Services.tPublicNum();
        MedicalCrab.Core.Services.UserSevice userService = new Core.Services.UserSevice();
        MedicalCrab.Core.Services.vGetUserPublicNum getUserPublicNumService = new Core.Services.vGetUserPublicNum();
        MedicalCrab.Core.Services.tPublicNews publicNewsService = new Core.Services.tPublicNews();

        public ActionResult Index()
        {
            return View();
        }

        #region 公众号关系
        /// <summary>
        /// 关注公众号
        /// </summary>
        /// <param name="fPublicNumId">公众号ID</param>
        /// <param name="userName">用户名</param>
        /// <returns></returns>
        public ActionResult AddAttention(string fPublicNumId, string userName) 
        {
            if (publicRelationService.AddAttention(fPublicNumId, userName))
            {
                return this.SuccessJson("YES");
            }
            else {
                return this.ErrorJson("NO");
            }
        }

        /// <summary>
        /// 取消关注公众号
        /// </summary>
        /// <param name="fPublicNumId">公众号ID</param>
        /// <param name="userName">用户名</param>
        /// <returns></returns>
        public ActionResult CancelAttention(string fPublicNumId, string userName) 
        {
            if (publicRelationService.CancelAttention(fPublicNumId, userName))
            {
                return this.SuccessJson("YES");
            }
            else {
                return this.ErrorJson("NO");
            }
        }
        #endregion


        #region 公众号呈现

        /// <summary>
        /// 根据用户获取公众号列表
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="currentPage"></param>
        /// <param name="pageSize">默认为30一组,若为0时则罗列全部</param>
        /// <returns></returns>
        public ActionResult GetPublicNumList(string userName,int currentPage = 1,int pageSize = 30) 
        {
            string errCode = string.Empty;
            try
            {
                if (!string.IsNullOrEmpty(userName))
                {
                    User user = userService.getByUserName(userName);
                    if (null != user)
                    {
                        if (0 == pageSize)
                        {
                            var list = getUserPublicNumService.GetModelList(string.Format(" fUserId ='{0}'", user.ID), "fIndexNo");
                            return this.SuccessJson(new { list = list });
                        }
                        else
                        {
                            var list = getUserPublicNumService.GetModelList(string.Format(" fUserId ='{0}'", user.ID), " fIndexNo", currentPage, pageSize);
                            var listCount = getUserPublicNumService.GetModelList(string.Format(" fUserId ='{0}'", user.ID), " fIndexNo");
                            int totalPage = getTotalPages(listCount.Count(), pageSize);
                            return this.SuccessJson(new { list = list, currentPage = currentPage, totalPage = totalPage });
                        }
                    }
                    else
                    {
                        return this.ErrorJson("UserNull");
                    }
                }
                return this.ErrorJson("UserNameError");
            }
            catch (Exception ex) {
                return this.ErrorJson(ex.Message);
            }   
        }

        public ActionResult SearchPublicNumList(string searchKey,int currentPage = 1,int pageSize = 30) 
        {
            if (!string.IsNullOrEmpty(searchKey)) 
            {
                var list = publicNumService.GetModelList(string.Format(" fName LIKE '%{0}%'",searchKey), " fIndexNo", currentPage, pageSize);
                var listCount = publicNumService.GetModelList(string.Format(" fName LIKE '%{0}%'", searchKey));
                int totalPage = getTotalPages(listCount.Count(), pageSize);

                return this.SuccessJson(new { list = list,currentPage = currentPage ,totalPage = totalPage });
            }
            return this.ErrorJson("NoSearchKey");
        }

        /// <summary>
        /// 根据ID获取公众号的详细主页面信息
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public ActionResult GetPublicNumById(string Id,string userName) 
        {
            if (!string.IsNullOrEmpty(Id) && !string.IsNullOrEmpty(userName))
            {
                var publicNum = publicNumService.GetModel(string.Format(" fIndexNo = {0}", Id));
                var user = userService.getByUserName(userName);

                if (null != publicNum)
                {
                    if (null != user)
                    {
                        string where = string.Format(" fIndexNo = {0} AND fUserId = '{1}'", Id, user.ID);
                        var models = getUserPublicNumService.GetModel(where) as MedicalCrab.Core.Models.vGetUserPublicNum;
                        if (null != models)
                        {
                            var state = models.fState == 0 ? true : false;
                            return this.SuccessJson(new { model = publicNum, fState = state });
                        }
                        else
                        {
                            return this.SuccessJson(new { model =publicNum, fState = false });
                        }
                    }
                    else
                    {
                        return this.ErrorJson("UserNull");
                    }
                }
                else
                {
                    return this.ErrorJson("NotFind");
                }
            }
            else
            {
                return this.ErrorJson("paramErr");
            }
        }


        /// <summary>
        /// 获取用户是否关注某个公众号(暂时不用)
        /// </summary>
        /// <param name="Id"></param>
        /// <param name="userName"></param>
        /// <returns></returns>
        public ActionResult GetUserPublicRelation(string Id, string userName) 
        {
            if (!string.IsNullOrEmpty(Id) && !string.IsNullOrEmpty(userName))
            {
                var user = userService.getByUserName(userName);
                if (null != user)
                {
                    string where = string.Format(" fIndexNo = {0} AND fUserId = '{1}'",Id,user.ID);
                    var model = getUserPublicNumService.GetModel(where) as MedicalCrab.Core.Models.vGetUserPublicNum;
                    if (null != model)
                    {
                        var state = model.fState == 0 ? true : false;
                        return this.SuccessJson(new { fState = state });
                    }
                    else {
                        return this.SuccessJson(new { fState = false});
                    }
                }
                else {
                    return this.ErrorJson("UserNull");
                }
            }
            else {
                return this.ErrorJson("paramErr");
            }
        }
        #endregion

        #region 公众号新闻列表
        public ActionResult GetPublicNews(string fPublicNumId, int currentPage = 1, int pageSize = 30) 
        {
            if (!string.IsNullOrEmpty(fPublicNumId)) 
            {
                string sqlWhere = string.Format(" fPubilcNumId = '{0}'",fPublicNumId);
                var list = publicNewsService.GetModelList(sqlWhere," fAddTime DESC",currentPage,pageSize);
            }
            return this.ErrorJson("ss");
        }
        #endregion

        #region 辅助函数
        /// <summary>
        /// 获取搜索总页数
        /// </summary>
        /// <param name="totalCount"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        private int getTotalPages(int totalCount,int pageSize) 
        {
            if (0 == pageSize) return 1;

            int leave = totalCount % pageSize;
            int count = totalCount / pageSize;
            int totalPage = 0;

            if (0 == leave)
            {
                totalPage = count;
            }
            else {
                totalPage = count + 1;
            }

            return totalPage;
        }
        #endregion
    }
}
