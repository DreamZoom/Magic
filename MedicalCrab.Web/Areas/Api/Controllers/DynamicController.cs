using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Configuration;

namespace MedicalCrab.Web.Areas.Api.Controllers
{
    public class DynamicController : Controller
    {
        //
        // GET: /Api/Dynamic/

        MedicalCrab.Core.Services.DynamicService dynamicService = new Core.Services.DynamicService();
        private string ImagePath = ConfigurationManager.AppSettings.Get("ImagePath");

        public ActionResult Add(MedicalCrab.Core.Models.tDynamic dynamic,string username)
        {
            try 
            {
                if (!ModelState.IsValid)
                {
                    throw new Exception(string.Join(",", ModelState.ToArray()));
                }
                
                if (dynamicService.AddDynamic(dynamic, username))
                {
                    return this.SuccessJson("YES");
                }
                else {
                    return this.ErrorJson("NO");
                }
            }
            catch (Exception err) 
            {
                return this.ErrorJson(err.Message);
            }
        }


        public ActionResult GetList(int currentPage = 1, int pageSize = 30) 
        {
            pageSize = pageSize == 0 ? 30 : pageSize;

            var list = dynamicService.GetModelList("", " fDate DESC",currentPage,pageSize);
            var listCount = dynamicService.GetModelList("");
            if(null != list)
            {
                int totalPage = getTotalPages(listCount.Count(), pageSize);
                return this.SuccessJson(new { list = list,currentPage = currentPage, totalPage = totalPage }, "YES");
            }else{
                return this.ErrorJson("NoData");
            } 
        }

        public ActionResult updateFile(MedicalCrab.Core.Models.tDynamic dynamic,string username) 
        {
            Response.Charset = "UTF8";
            Response.ContentType = "text/plain";
            var files = Request.Files;
            string result = string.Empty;
            string fImage = string.Empty;
            if (null != files && files.Count > 0)
            {
                string root = Server.MapPath("\\");
                string path = this.createFolder(root,username);
                int count = 0;

                for(int i=1;i<=files.Count;i++)
                {
                    string oldName = files["Image" + i].FileName;
                    string newName = DateTime.Now.ToString("yyyyMMddHHmmssffff") + "." + oldName.Split('.')[1].ToString();

                    string paramPath = path + "\\" + newName;
                    files["Image" + i].SaveAs(paramPath);

                    fImage += paramPath;
                    if (count < files.Count - 1)
                    {
                        fImage += "|";
                    }
                    count++;
                }

                dynamic.fImage = fImage.Replace(root, ImagePath+"\\");
                dynamic.fImageCount = files.Count;

                if (dynamicService.AddDynamic(dynamic, username))
                {
                    return this.SuccessJson("YES");
                }
                else
                {
                    return this.ErrorJson("NO");
                }
            }
            else {
                return this.ErrorJson("NO");
            }
        }


        /// <summary>
        /// 根据用户名创建文件夹
        /// </summary>
        /// <param name="userName">用户名</param>
        /// <returns></returns>
        private string createFolder(string root,string userName)
        {
            string mainImage = root + "AllImages";

            if (!Directory.Exists(mainImage)) 
            {
                Directory.CreateDirectory(mainImage);
            }
            string newPath = mainImage +"\\"+userName.ToUpper();
            if (!Directory.Exists(newPath)) 
            {
                Directory.CreateDirectory(newPath);
            }

            string path = DateTime.Now.ToString("yyyyMMdd");
            string allPath = newPath + "\\" + path.Substring(0, 4) + "\\" + path.Substring(4, 2) + "\\" + path.Substring(6, 2);
            if (!Directory.Exists(allPath)) 
            {
                Directory.CreateDirectory(allPath);
            }
            return allPath;
        }

        #region 辅助函数
        /// <summary>
        /// 获取搜索总页数
        /// </summary>
        /// <param name="totalCount"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        private int getTotalPages(int totalCount, int pageSize)
        {
            if (0 == pageSize) return 1;

            int leave = totalCount % pageSize;
            int count = totalCount / pageSize;
            int totalPage = 0;

            if (0 == leave)
            {
                totalPage = count;
            }
            else
            {
                totalPage = count + 1;
            }

            return totalPage;
        }
        #endregion
    }
}
