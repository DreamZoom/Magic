using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MedicalCrab.Core.Utility
{
    public static class Check
    {
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
