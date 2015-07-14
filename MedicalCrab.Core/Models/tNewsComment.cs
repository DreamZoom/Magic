using System; 
using System.Text;
using System.Collections.Generic; 
using System.Data;
using Magic.Mvc.Model;
namespace MedicalCrab.Core.Models{
	 	//新闻评论表
		public class tNewsComment:Magic.Mvc.Model.Model
	{
   		     
      	/// <summary>
		/// Id
        /// </summary>		
        //private string _id;
        //public string Id
        //{
        //    get{ return _id; }
        //    set{ _id = value; }
        //}        
		/// <summary>
		/// 序号
        /// </summary>		
		private int _findexno;
        [IdentifyAttribute]
        public int fIndexNo
        {
            get{ return _findexno; }
            set{ _findexno = value; }
        }        
		/// <summary>
		/// 新闻ID
        /// </summary>		
		private string _fnewsid;
        public string fNewsId
        {
            get{ return _fnewsid; }
            set{ _fnewsid = value; }
        }        
		/// <summary>
		/// 用户ID
        /// </summary>		
		private string _fuserid;
        public string fUserId
        {
            get{ return _fuserid; }
            set{ _fuserid = value; }
        }        
		/// <summary>
		/// 评论
        /// </summary>		
		private string _fcomment;
        public string fComment
        {
            get{ return _fcomment; }
            set{ _fcomment = value; }
        }        
		/// <summary>
		/// 回复用户ID
        /// </summary>		
		private string _freplayid;
        public string fReplayId
        {
            get{ return _freplayid; }
            set{ _freplayid = value; }
        }        
		/// <summary>
		/// fAddTime
        /// </summary>		
		private DateTime _faddtime;
        public DateTime fAddTime
        {
            get{ return _faddtime; }
            set{ _faddtime = value; }
        }        
		/// <summary>
		/// 备注
        /// </summary>		
		private string _fbz;
        public string fBZ
        {
            get{ return _fbz; }
            set{ _fbz = value; }
        }        
		   
	}
}

