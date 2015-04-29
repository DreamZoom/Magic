using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Magic.Mvc
{
    public class Config
    {
        public string this[string key]
        {
            get
            {
                return System.Configuration.ConfigurationManager.AppSettings[key] ?? "";
            }
            set
            {
                System.Configuration.ConfigurationManager.AppSettings[key] = value ?? "";
            }
        }
    }
}
