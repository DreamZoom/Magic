using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace Magic.Mvc
{
    public class MagicModelBuilder : DefaultModelBinder
    {
        public override object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var controller = controllerContext.Controller as Controller.Manage;
            if (controller != null)
            {
                bindingContext.ModelMetadata = new ModelMetadata(new DataAnnotationsModelMetadataProvider(), null, null, controller.ModelType, bindingContext.ModelMetadata.PropertyName);// ModelMetadataProviders.Current.GetMetadataForType(null, controller.ModelType);
            }
            return base.BindModel(controllerContext, bindingContext);
        }
    }
}
