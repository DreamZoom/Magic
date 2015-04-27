using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace Magic.Mvc.Model
{
    /// <summary>
    /// 模型信息提供类
    /// </summary>
    public class ModelInfoProvider
    {

        public static PropertyInfo[] getFiledsByAttribute(Type container, Type attributeType)
        {
            List<PropertyInfo> list = new List<PropertyInfo>();
            var propertys = container.GetProperties();
            foreach (var p in propertys)
            {
                var c = p.GetCustomAttributes(attributeType, false);
                if (c.Count() > 0)
                {
                    list.Add(p);
                }
            }
            return list.ToArray();
        }
    }
}
