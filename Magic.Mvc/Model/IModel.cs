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
        PropertyInfo[] getPrimaryKeys();
        PropertyInfo getIdentify();
    }
}
