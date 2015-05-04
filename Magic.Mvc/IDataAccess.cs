using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Magic.Mvc
{
    public interface IDataAccess
    {
        int Execute(string sql);

        int Execute(string sql, IDataParameter[] parameters);

        DataTable Query(string sql);

        DataTable Query(string sql, IDataParameter[] parameters);

        IDataParameter[] GetParameters(Model.Model model);
    }
}
