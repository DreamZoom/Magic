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

            if (!ModelBinders.Binders.ContainsKey(typeof(Model.Model)))
            {
                ModelBinders.Binders.Add(typeof(Model.Model), new MagicModelBuilder());
            }


            var type = ObjectFactory.Create(ControllerName, typeof(Model.Model));
            Check.IsNull(type);
            ModelType = type;

            Service = new Service.Service(ModelType);

            this.PageSize = 20;
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

        public ActionResult Edit()
        {
            string where = this.GetPrimaryWhere(this.ModelType, Request);

            var model = Service.GetModel(where);
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


        public ActionResult Details()
        {
            string where = this.GetPrimaryWhere(this.ModelType, Request);

            var model = Service.GetModel(where);
            if (model == null)
            {
                return this.Error("信息错误，未找到记录。", Url.Action("List"));
            }
            return View(model);
        }

        /// <summary>
        /// 分页大小
        /// </summary>
        public int PageSize { get; set; }
        /// <summary>
        /// 显示列表 
        /// </summary>
        /// <param name="page"></param>
        /// <returns></returns>
        public ActionResult List(int page = 1)
        {
            string where = this.BindWhere(ModelType);
            string order = "ID";
            var list = Service.GetModelList(where, order, page, PageSize);//获取数据列表

            CreateActionLinks(list.ActionLinks);
            CreateBatchActionLinks(list.BatchActionLinks);
            CreateDataFormatter(list.DataFormatter);
            return View(list);
        }


        protected virtual void CreateActionLinks(Dictionary<string,string> links)
        {
            links.Add("编辑", Url.Action("Edit") + "?ID={ID}");
            links.Add("详情", Url.Action("Details") + "?ID={ID}");
            links.Add("删除", Url.Action("Delete") + "?ID={ID}");
        }

        protected virtual void CreateBatchActionLinks(Dictionary<string, string> links)
        {
            links.Add("创建", Url.Action("create"));
        }

        protected virtual void CreateDataFormatter(Dictionary<string, Func<object, object, string>> formatters)
        {

        }
        #endregion
    }
}
