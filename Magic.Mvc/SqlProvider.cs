using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Magic.Mvc
{
    public class SqlProvider
    {
        /// <summary>
        /// 生成插入语句
        /// </summary>
        /// <param name="model">模型对象</param>
        /// <returns></returns>
        public string BuildInsertSQL(Model.Model model)
        {
            List<string> fileds = new List<string>();
            List<string> values = new List<string>();
            var propertys = model.GetType().GetProperties();
            var identity = model.getIdentify();
            foreach (var p in propertys)
            {
                if (!Magic.Mvc.Equals.IsNull(identity) && identity.Name == p.Name) continue;

                fileds.Add(string.Format("[{0}]", p.Name));
                values.Add(string.Format("@{0}", p.Name));
            }

            return string.Format(" INSERT INTO [{0}]({1}) VALUES({2}) ", model.GetType().Name, string.Join(",", fileds.ToArray()), string.Join(",", values.ToArray()));
        }

        /// <summary>
        /// 生成更新语句
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public string BuildUpdateSQL(Model.Model model)
        {
            List<string> fileds = new List<string>();
            List<string> wheres = new List<string>();
            var propertys = model.GetType().GetProperties();
            var primarys = model.getPrimaryKeys();
            var identity = model.getIdentify();
            foreach (var p in propertys)
            {
                if (primarys.Any(m => m.Name == p.Name))
                {
                    wheres.Add(string.Format("[{0}]=@{0}", p.Name));
                }
                if (!Magic.Mvc.Equals.IsNull(identity) && identity.Name == p.Name) continue;

                fileds.Add(string.Format("[{0}]=@{0}", p.Name));

            }

            return string.Format(" UPDATE [{0}] SET {1} WHERE {2}", model.GetType().Name, string.Join(",", fileds.ToArray()), string.Join(",", wheres.ToArray()));
        }

        /// <summary>
        /// 生成删除语句
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public string BuildDeleteSQL(Model.Model model)
        {
            List<string> wheres = new List<string>();
            var primarys = model.getPrimaryKeys();
            foreach (var p in primarys)
            {
                wheres.Add(string.Format("[{0}]=@{0}", p.Name));
            }

            return string.Format(" DELETE FROM [{0}]  WHERE {1}", model.GetType().Name, string.Join(",", wheres.ToArray()));
        }

        public string BuildDeleteSQL(Type type)
        {
            return string.Format(" DELETE FROM [{0}] ", type.Name);
        }



        public string BuildSelectSQL(Type type, int top = -1)
        {
            List<string> fileds = new List<string>();
            var propertys = type.GetProperties();
            foreach (var p in propertys)
            {
                fileds.Add(string.Format("[{0}]", p.Name));
            }
            string topString = "";

            if (top >= 0) topString = string.Format("TOP {0}", top);

            return string.Format(" SELECT {2} {1} FROM [{0}]", type.Name, string.Join(",", fileds.ToArray()), topString);
        }


        /// <summary>
        /// 获取sql参数
        /// </summary>
        /// <returns></returns>
        public virtual SqlParameter[] GetParameters(Model.Model model)
        {
            var propertys = model.GetType().GetProperties();

            List<SqlParameter> listSQLParamter = new List<SqlParameter>();
            foreach (var p in propertys)
            {
                listSQLParamter.Add(new SqlParameter() { ParameterName = p.Name, Value = p.GetValue(model, null) });
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
                listSQLParamter.Add(new SqlParameter() { ParameterName = p.Name, Value = keys[i] });
                i++;
            }
            return listSQLParamter.ToArray();
        }


        public virtual IEnumerable<Model.Model> TableToModelList(Type type, DataTable table)
        {
            List<Model.Model> list = new List<Model.Model>();
            Model.Model model = Activator.CreateInstance(type) as Model.Model;
            if (model == null)
            {
                throw new InvalidCastException();
            }

            foreach (DataRow dr in table.Rows)
            {
                var temp = model.Clone() as Model.Model;
                var propertys = type.GetProperties();
                foreach (var p in propertys)
                {
                    p.SetValue(temp, dr[p.Name], null);
                }
                list.Add(temp);
            }

            return list;
        }
    }
}
