using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Magic.Mvc.Model;
using System.Data;

namespace Magic.Mvc.Service
{
    public class Service : IService
    {
        /// <summary>
        /// 绑定的模型类型
        /// </summary>
        public Type ModelType { get; set; }

        public Service()
        {

        }

        public Service(Type modeltype)
        {
            Check.IsNull(modeltype);
            this.ModelType = modeltype;
        }




        /// <summary>
        /// 添加模型
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public virtual bool Add(Model.Model model)
        {
            Check.IsNull(model);
            string sql = SqlProviders.Current.BuildInsertSQL(model);
            IDataParameter[] parameters = DataAccessProvider.Current.GetParameters(model);

            return DataAccessProvider.Current.Execute(sql, parameters) > 0;
        }

        /// <summary>
        /// 更新模型
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public virtual bool Update(Model.Model model)
        {
            Check.IsNull(model);
            string sql = SqlProviders.Current.BuildUpdateSQL(model);
            IDataParameter[] parameters = DataAccessProvider.Current.GetParameters(model);
            return DataAccessProvider.Current.Execute(sql, parameters) > 0;
        }

        /// <summary>
        /// 删除模型
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public virtual bool Delete(Model.Model model)
        {
            Check.IsNull(model);
            string sql = SqlProviders.Current.BuildDeleteSQL(model);
            IDataParameter[] parameters = DataAccessProvider.Current.GetParameters(model);
            return DataAccessProvider.Current.Execute(sql, parameters) > 0;
        }

        /// <summary>
        /// 获取模型
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
        public virtual Model.Model GetModelByKeys(params object[] keys)
        {
            Check.IsNull(keys);
            string sql = SqlProviders.Current.BuildSelectSQL(ModelType, 1);
            IDataParameter[] parameters = DataAccessProvider.Current.GetParameters(ModelType, keys);
            var dt = DataAccessProvider.Current.Query(sql, parameters);
            return SqlProviders.Current.TableToModelList(ModelType, dt).FirstOrDefault();
        }
        public virtual Model.Model GetModelByID(string ID)
        {
            return GetModel(string.Format("ID={0}",ID));
        }
        public virtual Model.Model GetModel(string where = null)
        {
            return GetModel(where, null);
        }

        public virtual Model.Model GetModel(string where, string order)
        {
            string sql = SqlProviders.Current.BuildSelectSQL(ModelType, 1);
            if (!string.IsNullOrWhiteSpace(where))
            {
                sql += string.Format(" where {0} ", where);
            }

            if (!string.IsNullOrWhiteSpace(order))
            {
                sql += string.Format(" order by {0} ", order);
            }
            var dt = DataAccessProvider.Current.Query(sql);
            return SqlProviders.Current.TableToModelList(ModelType, dt).FirstOrDefault();
        }


        public virtual IEnumerable<Model.Model> GetModelList(string where)
        {
            return GetModelList(where, null);
        }

        public virtual IEnumerable<Model.Model> GetModelList(string where, string order)
        {
            string sql = SqlProviders.Current.BuildSelectSQL(ModelType, 1);
            if (!string.IsNullOrWhiteSpace(where))
            {
                sql += string.Format(" where {0} ", where);
            }
            if (!string.IsNullOrWhiteSpace(order))
            {
                sql += string.Format(" order by {0} ", order);
            }
            var dt = DataAccessProvider.Current.Query(sql);
            return SqlProviders.Current.TableToModelList(ModelType, dt);
        }


        /// <summary>
        /// 分页获取数据
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="order">排序</param>
        /// <param name="page">当前页数</param>
        /// <param name="pagesize">分页大小</param>
        /// <returns></returns>
        public virtual TabledList<Model.Model> GetModelList(string where, string order, int page, int pagesize)
        {
            string sql = SqlProviders.Current.BuildSelectSQL(ModelType);
            if (!string.IsNullOrWhiteSpace(where))
            {
                sql += " where " + where;
            }
            if (string.IsNullOrWhiteSpace(order))
            {

                order = "ID";
            }
            var countSql = SqlProviders.Current.CreateCountingSql(sql);
            var rcount = DataAccessProvider.Current.ExecuteSingle(countSql);
            int recordCount = rcount == null ? 0 : (int)rcount;


            sql = SqlProviders.Current.CreatePagingSql(recordCount, pagesize, page, sql, order);

            var dt = DataAccessProvider.Current.Query(sql);
            var ls = SqlProviders.Current.TableToModelList(ModelType, dt);
            TabledList<Model.Model> tabledList = new TabledList<Model.Model>(ls, ModelType, page, pagesize, recordCount);

            return tabledList;
        }
    }
}
