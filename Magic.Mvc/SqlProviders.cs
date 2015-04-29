using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Magic.Mvc
{
    public class SqlProviders
    {
        private static SqlProvider _provider = null;
        public static SqlProvider Current
        {
            get
            {
                if (_provider == null)
                {
                    _provider = new SqlProvider();
                }
                return _provider;
            }
            set
            {
                _provider = value;
            }
        }
    }
}
