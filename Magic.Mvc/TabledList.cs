using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace Magic.Mvc
{
    public class TabledList<T> : List<T>
    {
        public string TableID { get; set; }

        /// <summary>
        /// 当前页
        /// </summary>
        public int Page { get; set; }

        /// <summary>
        /// 分页大小
        /// </summary>
        public int PageSize { get; set; }

        /// <summary>
        /// 总记录数
        /// </summary>
        public int RecordCount { get; set; }

        /// <summary>
        /// 总页数
        /// </summary>
        public int PageCount { get; set; }

        /// <summary>
        /// 数据项类型
        /// </summary>
        public Type ModelType { get; set; }

        /// <summary>
        /// 数据过滤器
        /// </summary>
        public Dictionary<string, Func<object, object, string>> DataFormatter { get; set; }

        /// <summary>
        /// 数据项元数据
        /// </summary>
        public ModelMetadata ModelMetadata { get; set; }

        /// <summary>
        /// 行操作链接
        /// </summary>
        public Dictionary<string,string> ActionLinks { get; set; }

        /// <summary>
        /// 表格操作链接
        /// </summary>
        public Dictionary<string, string> BatchActionLinks { get; set; }


        public TabledList(IEnumerable<T> list,Type type, int page, int pagesize, int recordcount)
        {
            this.AddRange(list);

            this.ModelType = type;
            this.Page = page;
            this.PageSize = pagesize;
            this.RecordCount = recordcount;
            this.PageCount = recordcount / pagesize + ((recordcount % pagesize) == 0 ? 0 : 1);

            this.ModelMetadata = ModelMetadataProviders.Current.GetMetadataForType(null, type);

            this.BatchActionLinks = new Dictionary<string, string>();
            this.ActionLinks = new Dictionary<string, string>();
            this.DataFormatter = new Dictionary<string, Func<object, object, string>>();
        }
    }
}
