using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Reflection;

namespace Magic.Mvc.Controller
{
    public class Manage : System.Web.Mvc.Controller
    {
        public Service.Service Service { get; set; }

        /// <summary>
        /// 控制器名称
        /// </summary>
        public virtual string ControllerName
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

            if (this.Binders.ContainsKey(typeof(Model.IModel)))
            {
                this.Binders.Add(typeof(Model.IModel), new MagicModelBuilder());
            }


            var model = ObjectFactory.Create(ControllerName, typeof(Model.IModel));
            Check.IsNull(model);
            ModelType = model.GetType();

        }


        #region 基本操作
        public ActionResult Create()
        {

            ViewData.ModelMetadata = ModelMetadataProviders.Current.GetMetadataForType(null, ModelType);
            return View();
        }

        [HttpPost]
        public ActionResult Create(Model.Model model)
        {
            try
            {
                if (ModelState.IsValid && Service.Add(model))
                {
                    return this.Success("创建成功", Url.Action("List"));
                }

                ModelState.AddModelError("", "创建失败");

            }
            catch (Exception err)
            {
                ModelState.AddModelError("", err.Message);
            }

            return View(model);
        }

        public ActionResult Edit(string[] keys)
        {

            var model = Service.GetModel(keys);
            if (model == null)
            {
                return this.Error("信息错误，未找到记录。", Url.Action("List"));
            }
            return View(model);

        }

        [HttpPost]
        public ActionResult Edit(Model.Model model)
        {
            try
            {
                if (ModelState.IsValid && Service.Update(model))
                {
                    return this.Success("编辑成功", Url.Action("List"));
                }

                ModelState.AddModelError("", "编辑失败");

            }
            catch (Exception err)
            {
                ModelState.AddModelError("", err.Message);
            }

            return View(model);
        }


        public ActionResult Delete(string[] keys)
        {
            var model = Service.GetModel(keys);
            if (model == null)
            {
                return this.Error("信息错误，未找到记录。", Url.Action("List"));
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(string[] keys, bool confirm = true)
        {
            var model = Service.GetModel(keys);
            if (model == null)
            {
                return this.Error("信息错误，未找到记录。", Url.Action("List"));
            }

            try
            {

                if (Service.Delete(model))
                {
                    return this.Success("删除成功", Url.Action("List"));
                }

                ModelState.AddModelError("", "删除失败");

            }
            catch (Exception err)
            {
                ModelState.AddModelError("", err.Message);
            }

            return View(model);
        }
        #endregion
    }
}
