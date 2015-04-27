using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Magic.Mvc
{
    /// <summary>
    /// 检测器
    /// </summary>
    public class Check
    {
        /// <summary>
        /// 检测值为空
        /// </summary>
        /// <param name="value"></param>
        public static void IsNull(object value){
            if (null == value) throw new NullReferenceException();
        }
        public static void IsNull(params object[] values)
        {
            if (values.Any(m => m == null)) throw new NullReferenceException();
        }

        /// <summary>
        /// 如果对象为空，则赋值默认值
        /// </summary>
        /// <typeparam name="T">值类型</typeparam>
        /// <param name="obj">值</param>
        /// <param name="defaultValue">默认值</param>
        /// <returns></returns>
        public static T IsNullOrDefault<T>(T obj, T defaultValue)
        {
            if (null == obj)
                return defaultValue;
            return obj;
        }
    }
}
