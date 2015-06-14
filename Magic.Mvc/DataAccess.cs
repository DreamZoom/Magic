using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Magic.Mvc
{
    public class DataAccess 
    {

        public string ConnectionString { get; set; }

        public SqlConnection Connection { get; set; }
        public DataAccess(string connectionString)
        {
            this.ConnectionString = connectionString;
            this.Connection = new SqlConnection(ConnectionString);
        }

        public virtual object ExecuteSingle(string sql)
        {
            CheckConnection();
            using (SqlCommand cmd = new SqlCommand(sql, Connection))
            {
                return cmd.ExecuteScalar();
            }
        }

        public virtual object ExecuteSingle(string sql, IDataParameter[] parameters)
        {
            CheckConnection();
            using (SqlCommand cmd = new SqlCommand(sql, Connection))
            {
                return cmd.ExecuteScalar();
            }
        }

        public virtual int Execute(string sql)
        {
            CheckConnection();
            using (SqlCommand cmd = new SqlCommand(sql, Connection))
            {
                return cmd.ExecuteNonQuery();
            }
        }

        public virtual int Execute(string sql, IDataParameter[] parameters)
        {
            CheckConnection();
            using (SqlCommand cmd = new SqlCommand(sql, Connection))
            {
                InitCommandParameter(cmd, parameters);
                return cmd.ExecuteNonQuery();
            }
        }

        public virtual DataTable Query(string sql)
        {
            CheckConnection();
            DataSet ds = new DataSet();
            using (SqlCommand cmd = new SqlCommand(sql, Connection))
            {
                SqlDataAdapter command = new SqlDataAdapter(cmd);
                command.Fill(ds, "ds");       
            }

            if (ds.Tables.Count == 0) return null;
            return ds.Tables[0];
        }

        public virtual DataTable Query(string sql, IDataParameter[] parameters)
        {
            CheckConnection();
            DataSet ds = new DataSet();
            using (SqlCommand cmd = new SqlCommand(sql, Connection))
            {
                InitCommandParameter(cmd, parameters);
                SqlDataAdapter command = new SqlDataAdapter(cmd);
                command.Fill(ds, "ds");
            }

            if (ds.Tables.Count == 0) return null;
            return ds.Tables[0];
        }

        protected void CheckConnection()
        {
            Check.IsNull(Connection);

            if (Connection.State == ConnectionState.Closed)
            {
                Connection.Open();
            }
        }

        protected void InitCommandParameter(IDbCommand command, IDataParameter[] parameters)
        {
            Check.IsNull(parameters);
            foreach (var p in parameters)
            {
                command.Parameters.Add(p);
            }
        }

        /// <summary>
        /// 获取sql参数
        /// </summary>
        /// <returns></returns>
        public virtual IDataParameter[] GetParameters(Model.Model model)
        {
            var propertys = model.GetType().GetProperties();

            List<IDataParameter> listSQLParamter = new List<IDataParameter>();
            foreach (var p in propertys)
            {
                listSQLParamter.Add(new SqlParameter() { ParameterName = p.Name, Value = model.Property(p.Name) });
            }
            return listSQLParamter.ToArray();
        }

        /// <summary>
        /// 获取sql参数
        /// </summary>
        /// <returns></returns>
        public virtual SqlParameter[] GetParameters(Type type, params object[] keys)
        {

            var propertys = Model.ModelInfoProvider.getFiledsByAttribute(type, typeof(Model.KeyAttribute));
            List<SqlParameter> listSQLParamter = new List<SqlParameter>();
            if (propertys.Count() != keys.Count()) throw new ArgumentException("参数个数与主键个数不匹配");
            int i = 0;
            foreach (var p in propertys)
            {
                listSQLParamter.Add(new SqlParameter() { ParameterName = p.Name, Value = Convert.ChangeType(keys[i],p.PropertyType) });
                i++;
            }
            return listSQLParamter.ToArray();
        }

    }
}
