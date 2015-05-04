using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Magic.Mvc
{
    public class DataAccessProvider
    {
        private static DataAccess _executor = null;
        public static DataAccess Current
        {
            get
            {
                if (_executor == null)
                {
                    _executor = new DataAccess(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
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
