using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace Magic.Mvc
{
    public class MagicModelBuilder : DefaultModelBinder
    {
        protected override object CreateModel(ControllerContext controllerContext, ModelBindingContext bindingContext, Type modelType)
        {
            var controller =controllerContext.Controller as Controller.Manage;
            if (controller != null)
            {
                bindingContext.ModelMetadata = ModelMetadataProviders.Current.GetMetadataForType(null, controller.ModelType);
            }
            return base.CreateModel(controllerContext, bindingContext, modelType);
        }
    }
}
