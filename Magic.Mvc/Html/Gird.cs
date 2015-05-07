using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Web.Mvc;
using System.Web.Mvc.Razor;
using System.Text.RegularExpressions;

namespace Magic.Mvc.Html
{
    public class Gird
    {
        /// <summary>
        /// 数据源
        /// </summary>
        public TabledList<Model.Model> Source { get; set; }

        /// <summary>
        /// 全局唯一标识
        /// </summary>
        public string GirdID { get; set; }

        /// <summary>
        /// 分页代码
        /// </summary>
        public string Pagers { get; set; }

        public bool ShowCheckBox { get; set; }

        public Gird(TabledList<Model.Model> Source)
        {
            Source.TableID = Guid.NewGuid().ToString();
            this.Source = Source;
        }

        /// <summary>
        /// 呈现表头
        /// </summary>
        /// <param name="writer"></param>
        public void ReaderHead(HtmlTextWriter writer)
        {
            writer.RenderBeginTag(HtmlTextWriterTag.Thead);
            writer.RenderBeginTag(HtmlTextWriterTag.Tr);

            var propertys = Source.ModelType.GetProperties();

            if (ShowCheckBox)
            {
                writer.RenderBeginTag(HtmlTextWriterTag.Th);
                writer.AddAttribute(HtmlTextWriterAttribute.Type, "checkbox");
                writer.AddAttribute(HtmlTextWriterAttribute.Name, "checkbox_all");
                writer.RenderBeginTag(HtmlTextWriterTag.Input);
                writer.RenderEndTag();
                writer.RenderEndTag();
            }
            foreach (var p in propertys)
            {
                if (p.GetCustomAttributes(typeof(GirdHiddenAttribute), false).Length > 0) continue;

                ModelMetadata metadata = ModelMetadataProviders.Current.GetMetadataForProperty(null, Source.ModelType, p.Name);
                writer.AddAttribute("data-field", p.Name);
                writer.RenderBeginTag(HtmlTextWriterTag.Th);
                writer.Write(metadata.DisplayName ?? p.Name);
                writer.RenderEndTag();
            }
            //操作列开始
            writer.RenderBeginTag(HtmlTextWriterTag.Th);
            writer.Write("操作");
            writer.RenderEndTag();//操作列结束

            writer.RenderEndTag();//end tr
            writer.RenderEndTag();
        }

        public void ReaderRow(HtmlTextWriter writer, Model.Model model)
        {
            var propertys = Source.ModelType.GetProperties();

            if (ShowCheckBox)
            {
                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                writer.AddAttribute(HtmlTextWriterAttribute.Type, "checkbox");
                writer.AddAttribute(HtmlTextWriterAttribute.Name, "checkbox_item");
                writer.AddAttribute(HtmlTextWriterAttribute.Value, model.Property(model.getIdentifyFiled()).ToString());
                writer.RenderBeginTag(HtmlTextWriterTag.Input);
                writer.RenderEndTag();
                writer.RenderEndTag();
            }
            foreach (var p in propertys)
            {
                if (p.GetCustomAttributes(typeof(GirdHiddenAttribute), false).Length > 0) continue;
                writer.RenderBeginTag(HtmlTextWriterTag.Td);

                var value = p.GetValue(model, null);
                string result = string.Format("{0}", value);
                if (Source.DataFormatter.ContainsKey(p.Name))
                {
                    result = Source.DataFormatter[p.Name].Invoke(value, model);
                }

                writer.Write(result);
                writer.RenderEndTag();
            }


            List<string> links = new List<string>();
            foreach (var kv in Source.ActionLinks)
            {
                string url = FormatFromModel(kv.Value, model);
                links.Add(string.Format("<a href=\"{1}\">{0}</a>", kv.Key, url));
            }

            writer.RenderBeginTag(HtmlTextWriterTag.Td);
            writer.Write(string.Join("|", links.ToArray()));
            writer.RenderEndTag();
        }

        private string FormatFromModel(string tempString, Model.Model model)
        {
            var propertys = model.GetType().GetProperties();
            Regex r = new Regex("{[a-z|0-9]*}");
            return r.Replace(tempString, (m) =>
            {
                var value =model.Property(m.Value.Trim('{','}'));
                if (value == null) return "";
                return value.ToString();
               
            });
        }

        private int GetShowColumns(Type modelType)
        {
            int count = 0;
            foreach (var p in modelType.GetProperties())
            {
                if (p.GetCustomAttributes(typeof(GirdHiddenAttribute), false).Length > 0) continue;
                count++;
            }
            return count;
        }

        public void ReaderRows(HtmlTextWriter writer)
        {
            writer.RenderBeginTag(HtmlTextWriterTag.Body);
            foreach (var row in Source)
            {
                writer.RenderBeginTag(HtmlTextWriterTag.Tr);
                ReaderRow(writer, row);
                writer.RenderEndTag();//end tr
            }

            if (Source.Count == 0)
            {
                writer.RenderBeginTag(HtmlTextWriterTag.Tr);
                writer.AddAttribute(HtmlTextWriterAttribute.Colspan, "" + (GetShowColumns(Source.ModelType)+1));
                writer.AddAttribute(HtmlTextWriterAttribute.Height, "200");
                writer.AddAttribute(HtmlTextWriterAttribute.Valign, "middle");
                writer.RenderBeginTag(HtmlTextWriterTag.Td);
                writer.Write("暂无数据。。。");
                writer.RenderEndTag();
                writer.RenderEndTag();//end tr
            }
            writer.RenderEndTag();
        }

        public void ReaderFooter(HtmlTextWriter writer)
        {

            List<string> links = new List<string>();
            foreach (var kv in Source.BatchActionLinks)
            {
                links.Add(string.Format("<a href=\"{1}\">{0}</a>", kv.Key, kv.Value));
            }
            writer.RenderBeginTag(HtmlTextWriterTag.Div);
            writer.Write(string.Join("|", links.ToArray()));
            writer.Write(Pagers);
            writer.RenderEndTag();
        }

     

        /// <summary>
        /// 呈现表格
        /// </summary>
        /// <returns></returns>
        public string Reader()
        {
            StringWriter sw = new StringWriter();
            HtmlTextWriter writer = new HtmlTextWriter(sw);

            //table 
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "table table-condensed table-hover table-striped");
            writer.AddAttribute(HtmlTextWriterAttribute.Id, Source.TableID);
            writer.RenderBeginTag(HtmlTextWriterTag.Table);


            ReaderHead(writer);//呈现表头

            ReaderRows(writer);//呈现数据
            writer.RenderEndTag();

            ReaderFooter(writer);
            return sw.ToString();
        }
    }
}
