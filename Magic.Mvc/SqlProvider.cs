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
        public virtual string BuildInsertSQL(Model.Model model)
        {
            List<string> fileds = new List<string>();
            List<string> values = new List<string>();
            var propertys = model.GetType().GetProperties();
            var identity = model.getIdentify();
            foreach (var p in propertys)
            {
                if (!Magic.Mvc.Equals.IsNull(identity) && identity.Name == p.Name) continue;

                var notmaps = p.GetCustomAttributes(typeof(Model.NotMapingAttribute), false);
                if (notmaps != null && notmaps.Length > 0) continue;

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
        public virtual string BuildUpdateSQL(Model.Model model)
        {
            List<string> fileds = new List<string>();
            List<string> wheres = new List<string>();
            var propertys = model.GetType().GetProperties();
            var primarys = model.getPrimaryKeys();
            var identity = model.getIdentify();
            foreach (var p in propertys)
            {
                var notmaps = p.GetCustomAttributes(typeof(Model.NotMapingAttribute), false);
                if (notmaps != null && notmaps.Length > 0) continue;

                if (primarys.Any(m => m.Name == p.Name))
                {
                    wheres.Add(string.Format("[{0}]=@{0}", p.Name));
                }
                if (!Magic.Mvc.Equals.IsNull(identity) && identity.Name == p.Name) continue;

                fileds.Add(string.Format("[{0}]=@{0}", p.Name));

            }

            return string.Format(" UPDATE [{0}] SET {1} WHERE {2}", model.GetType().Name, string.Join(",", fileds.ToArray()), string.Join(" and ", wheres.ToArray()));
        }

        /// <summary>
        /// 生成删除语句
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public virtual string BuildDeleteSQL(Model.Model model)
        {
            List<string> wheres = new List<string>();
            var primarys = model.getPrimaryKeys();
            foreach (var p in primarys)
            {
                var notmaps = p.GetCustomAttributes(typeof(Model.NotMapingAttribute), false);
                if (notmaps != null && notmaps.Length > 0) continue;

                wheres.Add(string.Format("[{0}]=@{0}", p.Name));
            }

            return string.Format(" DELETE FROM [{0}]  WHERE {1}", model.GetType().Name, string.Join(" and ", wheres.ToArray()));
        }

        public virtual string BuildDeleteSQL(Type type)
        {
            return string.Format(" DELETE FROM [{0}] ", type.Name);
        }



        public virtual string BuildSelectSQL(Type type, int top = -1)
        {
            List<string> fileds = new List<string>();
            var propertys = type.GetProperties();
            foreach (var p in propertys)
            {
                var notmaps = p.GetCustomAttributes(typeof(Model.NotMapingAttribute), false);
                if (notmaps != null && notmaps.Length > 0) continue;

                fileds.Add(string.Format("[{0}]", p.Name));
            }
            string topString = "";

            if (top >= 0) topString = string.Format("TOP {0}", top);

            return string.Format(" SELECT {2} {1} FROM [{0}]", type.Name, string.Join(",", fileds.ToArray()), topString);
        }


        #region 分页处理方法
        /// <summary>
        /// 获取分页SQL语句，排序字段需要构成唯一记录
        /// </summary>
        /// <param name="_recordCount">记录总数</param>
        /// <param name="_pageSize">每页记录数</param>
        /// <param name="_pageIndex">当前页数</param>
        /// <param name="_safeSql">SQL查询语句</param>
        /// <param name="_orderField">排序字段，多个则用“,”隔开</param>
        /// <returns>分页SQL语句</returns>
        public string CreatePagingSql(int _recordCount, int _pageSize, int _pageIndex, string _safeSql, string _orderField)
        {
            //重新组合排序字段，防止有错误


            //计算总页数
            _pageSize = _pageSize <= 0 ? _recordCount : _pageSize;
            int pageCount = (_recordCount + _pageSize - 1) / _pageSize;

            //检查当前页数
            if (_pageIndex < 1)
            {
                _pageIndex = 1;
            }
            if (_pageIndex > pageCount)
            {
                _pageIndex = pageCount;
                _pageSize = 0;
            }
            int start=(_pageIndex-1)*_pageSize;
            int end =0;
            if((_recordCount-start)>=_pageSize){
                end=start+_pageSize;
            }
            else{
                end=_recordCount;
            }
            //        SELECT * FROM (
            //SELECT ROW_NUMBER() OVER(ORDER by UserName asc) AS rownumber,*                           
            //FROM (SELECT  [UserName],[Password] FROM [User]) T 
            //) TT WHERE rownumber BETWEEN 0 AND 0
            string sql = @"SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER By ID) AS rownumber,* FROM ({1}) T ) TT  WHERE rownumber BETWEEN {2} AND {3}";
            return string.Format(sql, _orderField, _safeSql, start, end);
        }

        /// <summary>
        /// 获取记录总数SQL语句
        /// </summary>
        /// <param name="_n">限定记录数</param>
        /// <param name="_safeSql">SQL查询语句</param>
        /// <returns>记录总数SQL语句</returns>
        public string CreateTopnSql(int _n, string _safeSql)
        {
            return string.Format(" SELECT TOP {0} * FROM ({1}) AS T ", _n, _safeSql);
        }

        /// <summary>
        /// 获取记录总数SQL语句
        /// </summary>
        /// <param name="_safeSql">SQL查询语句</param>
        /// <returns>记录总数SQL语句</returns>
        public string CreateCountingSql(string _safeSql)
        {
            return string.Format(" SELECT COUNT(1) AS RecordCount FROM ({0}) AS T ", _safeSql);
        }

        #endregion

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
                   if( table.Columns.Contains(p.Name))
                       p.SetValue(temp, dr[p.Name], null);
                }
                list.Add(temp);
            }

            return list;
        }
    }
}
