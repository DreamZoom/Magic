using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Reflection;

namespace Magic.Mvc
{
   public  interface ISearch
    {
       string getWhere(PropertyInfo property, HttpRequestBase request);
      
    }
}
