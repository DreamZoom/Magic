using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace Magic.MeiChat.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(string[] key=null)
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";
            MailMessage mms = new MailMessage();
            //主题
            mms.Subject = "恭喜你收到来自我的邮件";
            mms.SubjectEncoding = Encoding.GetEncoding("gb2312");

            //内容
            mms.Body = "尊敬的美女你好，恭喜你收到来自我的邮件。";
            mms.BodyEncoding = Encoding.GetEncoding("gb2312");

            //附件
            //mms.Attachments.Add(new Attachment(@"D:\AspNetPager.dll"));

            //从哪发到哪
            mms.From = new MailAddress("1036199213@qq.com");
            mms.To.Add(new MailAddress("273054716@qq.com"));

            //用户名和密码
            SmtpClient smtp = new SmtpClient("smtp.qq.com", 25);
            smtp.Credentials = new NetworkCredential("1036199213", "xl@1992912");

            try
            {
               // smtp.Send(mms);
                ViewBag.Message ="发送成功";
            }
            catch (Exception ex)
            {
                ViewBag.Message=(ex.Message);

            }
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
