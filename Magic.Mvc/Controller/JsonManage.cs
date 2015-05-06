using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Reflection;
namespace Magic.Mvc.Controller
{
    public class JsonManage : System.Web.Mvc.Controller
    { /// <summary>
        /// 控制器名称
        /// </summary>
        public string ControllerName
        {
            get
            {
                return RouteData.Values["controller"].ToString();
            }
        }

        public Type ModelType { get; set; }

        protected override void Initialize(System.Web.Routing.RequestContext requestContext)
        {
            base.Initialize(requestContext);
            var model = ObjectFactory.Create(ControllerName, typeof(Model.IModel));
            Check.IsNull(model);
            ModelType = model.GetType();

            Service = new Service.Service(ModelType);
        }


        /*
         * 映射对应service
         * 
         * */
        public Service.Service Service { get; set; }


        #region 基本操作

        [HttpPost]
        public ActionResult Create(Model.Model model)
        {
            try
            {
                if (ModelState.IsValid && Service.Add(model))
                {
                    return this.SuccessJson("添加成功");
                }

                return this.ErrorJson("添加失败");

            }
            catch (Exception err)
            {
                return this.ErrorJson(err.Message);
            }
        }

        [HttpPost]
        public ActionResult Edit(Model.Model model)
        {
            try
            {
                if (ModelState.IsValid && Service.Update(model))
                {
                    return this.SuccessJson("编辑成功");
                }

                return this.ErrorJson("编辑失败");

            }
            catch (Exception err)
            {
                return this.ErrorJson(err.Message);
            }
        }

        public ActionResult GetModel(string[] keys)
        {
            var model = Service.GetModel(keys);
            if (model == null)
            {
                return this.ErrorJson("信息错误，未找到记录。");
            }
            return this.SuccessJson(model);
        }

        [HttpPost]
        public ActionResult Delete(string[] keys, bool confirm = true)
        {
            var model = Service.GetModel(keys);
            if (model == null)
            {
                return this.ErrorJson("信息错误，未找到记录。");
            }

            try
            {

                if (Service.Delete(model))
                {
                    return this.SuccessJson(model);
                }

                return this.ErrorJson("删除失败。");

            }
            catch (Exception err)
            {
                return this.ErrorJson( err.Message);
            }
        }
        #endregion


    }
}
