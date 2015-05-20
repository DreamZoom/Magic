using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web;


namespace MedicalCrab.Core
{
    /// <summary>
    /// 文件上传目录
    /// </summary>
    public enum UploadDirectory
    {
        handimage //头像存储目录

    }

    /// <summary>
    /// 文件上传通用类
    /// </summary>
    public class Uploader
    {
        /// <summary>
        /// 保存文件
        /// </summary>
        /// <param name="filestream"></param>
        /// <param name="dir"></param>
        public static void Save(Stream filestream,UploadDirectory dir)
        {
            
        }

        public static string SaveUserHandImage(string username, string base64image)
        {
            MemoryStream stream = new MemoryStream(Convert.FromBase64String(base64image));
            Image img = Image.FromStream(stream);
            string filename = string.Format("/upload/{0}/{1}.{2}", UploadDirectory.handimage, username, img.RawFormat.ToString().ToLower());
            string fullfilename = HttpContext.Current.Server.MapPath(filename);
            img.Save(fullfilename, img.RawFormat);
            return filename;
        }

        public static string SaveUserHandImage(string username, HttpPostedFileBase file,int x,int y,int w,int h,int sw,int sh)
        {
            Image img = Image.FromStream(file.InputStream);
            int srcWidth = img.Size.Width, srcHeight = img.Size.Height;
            float saleX = sw / (float)srcWidth, saleY = sh / (float)srcHeight;

            float newW = srcWidth * saleX, newH = srcHeight * saleY;

            Bitmap b1 = new Bitmap((int)newW, (int)newH);
            Graphics g1 = Graphics.FromImage(b1);
            g1.DrawImage(img, new Rectangle(0, 0, (int)newW, (int)newH), new RectangleF(0, 0, srcWidth, srcHeight), GraphicsUnit.Pixel);

            
            Bitmap bmp = new Bitmap(w, h);
            Graphics g = Graphics.FromImage(bmp);
            g.DrawImage(b1, 0, 0, new RectangleF(x, y, w, h), GraphicsUnit.Pixel);

            string filename = string.Format("/upload/{0}/{1}.{2}", UploadDirectory.handimage, username, "jpg");
            string fullfilename = HttpContext.Current.Server.MapPath(filename);
            bmp.Save(fullfilename, ImageFormat.Jpeg);
            bmp.Dispose();
            img.Dispose();
            return filename;
        }
    }
}
