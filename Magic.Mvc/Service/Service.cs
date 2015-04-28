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
        /// sql语句生成
        /// </summary>
        protected  SqlProvider Provider  { get; set; }

        /// <summary>
        /// 数据库操作
        /// </summary>
        protected DataServer DataServer { get; set; }

        /// <summary>
        /// 绑定的模型类型
        /// </summary>
        public Type ModelType { get; set; }

        public Service()
        {
            Provider=new SqlProvider();
            DataServer = new DataServer(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        }

        public Service(Type modeltype)
        {
            Check.IsNull(modeltype);
            this.ModelType = modeltype;
            Provider = new SqlProvider();
            DataServer = new DataServer(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        }


       

        /// <summary>
        /// 添加模型
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool Add(Model.Model model)
        {
            Check.IsNull(model);
            string sql = Provider.BuildInsertSQL(model);
            IDataParameter[] parameters = DataServer.GetParameters(model);
            return DataServer.Execute(sql, parameters) > 0;
        }

        /// <summary>
        /// 更新模型
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool Update(Model.Model model)
        {
            Check.IsNull(model);
            string sql = Provider.BuildUpdateSQL(model);
            IDataParameter[] parameters = DataServer.GetParameters(model);
            return DataServer.Execute(sql, parameters) > 0;
        }

        /// <summary>
        /// 删除模型
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool Delete(Model.Model model)
        {
            Check.IsNull(model);
            string sql = Provider.BuildDeleteSQL(model);
            IDataParameter[] parameters = DataServer.GetParameters(model);
            return DataServer.Execute(sql, parameters) > 0;
        }

        /// <summary>
        /// 获取模型
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
        public Model.Model GetModel(params object[] keys)
        {
            Check.IsNull(keys);
            string sql = Provider.BuildSelectSQL(ModelType, 1);
            IDataParameter[] parameters = DataServer.GetParameters(ModelType,keys);
            var dt = DataServer.Query(sql, parameters);
            return Provider.TableToModelList(ModelType,dt).FirstOrDefault();
        }

        public Model.Model GetModel(string where=null)
        {
            return GetModel(where, null);
        }

        public Model.Model GetModel(string where,string order)
        {
            string sql = Provider.BuildSelectSQL(ModelType, 1);
            if(!string.IsNullOrWhiteSpace(where))
            {
                sql += string.Format(" where {0} ", where);
            }

            if (!string.IsNullOrWhiteSpace(order))
            {
                sql += string.Format(" order by {0} ", order);
            }
            var dt = DataServer.Query(sql);
            return Provider.TableToModelList(ModelType, dt).FirstOrDefault();
        }


        public IEnumerable<Model.Model> GetModelList(string where)
        {
            return GetModelList(where, null);
        }

        public IEnumerable<Model.Model> GetModelList(string where,string order)
        {
            string sql = Provider.BuildSelectSQL(ModelType, 1);
            if (!string.IsNullOrWhiteSpace(where))
            {
                sql += string.Format(" where {0} ", where);
            }

            if (!string.IsNullOrWhiteSpace(order))
            {
                sql += string.Format(" order by {0} ", order);
            }
            var dt = DataServer.Query(sql);
            return Provider.TableToModelList(ModelType, dt);
        }

    }
}
