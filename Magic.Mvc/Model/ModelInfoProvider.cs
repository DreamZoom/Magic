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
        /// <summary>
        /// 获取应用了特定特性的字段
        /// </summary>
        /// <param name="container">对象</param>
        /// <param name="attributeType">特性类型</param>
        /// <returns></returns>
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

        /// <summary>
        /// 获取对象对应属性值
        /// </summary>
        /// <param name="container">对象</param>
        /// <param name="propertyName">属性名称</param>
        /// <param name="indexs">索引参数（如果属性为索引化属性时）</param>
        /// <returns></returns>
        public static object getPropertyValue(object container, string propertyName, params object[] indexs)
        {
            Check.IsNull(container, propertyName);
            PropertyInfo p = container.GetType().GetProperty(propertyName);
            var indexParameters = p.GetIndexParameters();
            if (indexParameters.Count() == 0)
            {
                return p.GetValue(container, null);
            }
            else
            {
                return p.GetValue(container, indexs);
            }
        }

        /// <summary>
        /// 设置对象对应属性值
        /// </summary>
        /// <param name="container">对象</param>
        /// <param name="propertyName">属性名称</param>
        /// <param name="value">值</param>
        /// <param name="indexs">索引参数（如果属性为索引化属性时）</param>
        /// <returns></returns>
        public static bool setPropertyValue(object container, string propertyName, object value, params object[] indexs)
        {
            Check.IsNull(container, propertyName);
            PropertyInfo p = container.GetType().GetProperty(propertyName);
            var indexParameters = p.GetIndexParameters();
            try
            {
                if (indexParameters.Count() == 0)
                {
                    p.SetValue(container, value, null);
                }
                else
                {
                    p.SetValue(container, value, indexs);
                }
                return true;
            }
            catch
            {
                return false;
            }

        }
    }
}
