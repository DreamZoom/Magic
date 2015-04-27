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

    }
}
