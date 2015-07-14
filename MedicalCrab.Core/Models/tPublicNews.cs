using System; 
using System.Text;
using System.Collections.Generic; 
using System.Data;
using Magic.Mvc.Model;
namespace MedicalCrab.Core.Models{
	 	//tPublicNews
		public class tPublicNews:Magic.Mvc.Model.Model
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
		/// fIndexNo
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
		private string _fpubilcnumid;
        public string fPubilcNumId
        {
            get{ return _fpubilcnumid; }
            set{ _fpubilcnumid = value; }
        }        
		/// <summary>
		/// fContent
        /// </summary>		
		private string _fcontent;
        public string fContent
        {
            get{ return _fcontent; }
            set{ _fcontent = value; }
        }        
		/// <summary>
		/// 状态(0--正常&&1--删除)
        /// </summary>		
		private int _fstate;
        public int fState
        {
            get{ return _fstate; }
            set{ _fstate = value; }
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

