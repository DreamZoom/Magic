using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Magic.Mvc
{
    public class DataExecutors
    {
        private static DataExecutor _executor = null;
        public static DataExecutor Current
        {
            get
            {
                if (_executor == null)
                {
                    _executor = new DataExecutor(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                }
                return _executor;
            }
            set
            {
                _executor = value;
            }
        }
    }
}
