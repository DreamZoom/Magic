using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Magic.Mvc
{
    public class Equals
    {
        public static bool IsNull(object obj)
        {
            if (null == obj) return true;
            return false;
        }

        public static bool NotNullEquals(object obj1,object obj2)
        {
            if (null == obj1 || null==obj2) return false;
            return obj1.Equals(obj2);
        }
    }
}
