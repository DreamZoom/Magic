using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MedicalCrab.Web.Areas.Api.Controllers
{
    public class DynamicController : Controller
    {
        //
        // GET: /Api/Dynamic/

        MedicalCrab.Core.Services.DynamicService dynamicService = new Core.Services.DynamicService();

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


        public ActionResult GetList() 
        {
            var list = dynamicService.GetModelList("");
            if(null != list)
            {
                return this.SuccessJson(list, "YES");
            }else{
                return this.ErrorJson("NoData");
            } 
        }

    }
}
