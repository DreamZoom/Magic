using System; 
using System.Text;
using System.Collections.Generic; 
using System.Data;
using Magic.Mvc.Model;
namespace MedicalCrab.Core.Models{
	 	//公众号关注表
		public class tPublicRelation:Magic.Mvc.Model.Model
	{
   		     
        ///// <summary>
        ///// Id
        ///// </summary>		
        //private string _id;
        //public string Id
        //{
        //    get{ return _id; }
        //    set{ _id = value; }
        //}        
		/// <summary>
		///  序号
        /// </summary>		
		private int _findexno;
        [IdentifyAttribute]
        public int fIndexNo
        {
            get{ return _findexno; }
            set{ _findexno = value; }
        }        
		/// <summary>
		/// 公众号ID
        /// </summary>		
		private string _fpublicnumid;
        public string fPublicNumId
        {
            get { return _fpublicnumid; }
            set { _fpublicnumid = value; }
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
		/// 状态(0--取消关注&&1--关注)
        /// </summary>		
		private int _fstate;
        public int fState
        {
            get{ return _fstate; }
            set{ _fstate = value; }
        }        
		/// <summary>
		/// 关注日期
        /// </summary>		
		private DateTime _faddtime;
        public DateTime fAddTime
        {
            get{ return _faddtime; }
            set{ _faddtime = value; }
        }        
		/// <summary>
		/// 最后一次更新关注日期时间
        /// </summary>		
		private DateTime _fupdatetime;
        public DateTime fUpdateTime
        {
            get{ return _fupdatetime; }
            set{ _fupdatetime = value; }
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

