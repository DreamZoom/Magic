using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Magic.Mvc
{
    public class EqualAttribute : SearchAttribute
    {
        public override string getWhere(System.Reflection.PropertyInfo property, System.Web.HttpRequestBase request)
        {
            var value =getValue(property.Name,request);
            if(string.IsNullOrWhiteSpace(value)) return null;

            if (property.PropertyType == typeof(DateTime) || property.PropertyType == typeof(string))
            {
                return string.Format("[{0}] = '{1}'", property.Name, value);
            }
            return string.Format("[{0}] = {1}", property.Name, value);
        }
    }
}
