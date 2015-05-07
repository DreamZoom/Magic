using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Magic.Mvc
{
    public class LikeAttribute: SearchAttribute
    {
        public override string getWhere(System.Reflection.PropertyInfo property, System.Web.HttpRequestBase request)
        {
            if (string.IsNullOrWhiteSpace(getValue(property.Name, request))) return "";

            if (property.PropertyType == typeof(DateTime) || property.PropertyType == typeof(string))
            {
                return string.Format("[{0}] like '{1}'", property.Name, getValue(property.Name, request));
            }
            return string.Format("[{0}] like {1}", property.Name, getValue(property.Name, request));
        }
    }
}
