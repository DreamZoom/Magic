using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace Magic.Mvc.Model
{
    /// <summary>
    /// 模型接口 
    /// </summary>
    public interface IModel
    {
        /// <summary>
        /// 获取主键列
        /// </summary>
        /// <returns></returns>
        PropertyInfo[] getPrimaryKeys();

        /// <summary>
        /// 获取标示列
        /// </summary>
        /// <returns></returns>
        PropertyInfo getIdentify();

        /// <summary>
        /// 获取属性值
        /// </summary>
        /// <param name="propertyName"></param>
        /// <returns></returns>
        object Property(string propertyName);

        /// <summary>
        /// 设置属性值
        /// </summary>
        /// <param name="propertyName"></param>
        /// <param name="value"></param>
        void Property(string propertyName, object value);
    }
}
