using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace Magic.Mvc.Model
{
    /// <summary>
    /// 模型基类
    /// </summary>
    public class Model : IModel
    {
        PropertyInfo[] getPrimaryKeys()
        {
            return ModelInfoProvider.getFiledsByAttribute(this.GetType(),typeof(KeyAttribute));
        }
        PropertyInfo getIdentify()
        {
            var fs = ModelInfoProvider.getFiledsByAttribute(this.GetType(), typeof(IdentifyAttribute));
            return fs.FirstOrDefault(); 
        }
    }
}
