using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Reflection;

namespace Magic.Mvc
{
    /// <summary>
    /// 搜索属性(标识某字段是否可以用于搜索查询)
    /// </summary>
    public class SearchAttribute : Attribute, ISearch
    {
        /// <summary>
        /// 输入字段
        /// </summary>


        public SearchAttribute()
        {

        }

        public virtual string getWhere(PropertyInfo property, HttpRequestBase request)
        {
            return "";
        }

        public virtual string getValue(string propertyName, HttpRequestBase request)
        {
            if (string.IsNullOrWhiteSpace(request.Params[propertyName]))
            {
                return string.Empty;
            }
            return request.Params[propertyName];
        }

        public virtual string[] getInputFiles(PropertyInfo property)
        {
            List<string> InputFilds = new List<string>();
            InputFilds.Add(property.Name);
            return InputFilds.ToArray();
        }
    }
}
