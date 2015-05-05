using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace Magic.Mvc
{
    public class ObjectFactory
    {
        /// <summary>
        /// 根据类名创建类
        /// </summary>
        /// <param name="className"></param>
        /// <param name="inhert"></param>
        /// <returns></returns>
        public static object Create(string className, Type inhert)
        {
            foreach (System.Reflection.Assembly assembly in System.AppDomain.CurrentDomain.GetAssemblies())
            {
                try
                {
                    if (assembly.GetName().Name == "Anonymously Hosted DynamicMethods Assembly") continue;

                    Type type = assembly.GetTypes().FirstOrDefault(m => m.Name.Equals(className, StringComparison.OrdinalIgnoreCase));
                    if (type != null && inhert.IsAssignableFrom(type))
                    {
                        return type;
                    }
                }
                catch
                {

                }


            }
            return null;
        }
    }
}
