using System; 
using System.Text;
using System.Collections.Generic; 
using System.Data;
using Magic.Mvc.Model;
namespace MedicalCrab.Core.Models{
	 	//医院信息
		public class tPublicNum:Magic.Mvc.Model.Model
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
		/// 公众号
        /// </summary>		
		private string _fno;
        public string fNo
        {
            get{ return _fno; }
            set{ _fno = value; }
        }        
		/// <summary>
		/// 医院名称
        /// </summary>		
		private string _fname;
        public string fName
        {
            get{ return _fname; }
            set{ _fname = value; }
        }        
		/// <summary>
		/// 城市或者城市编号
        /// </summary>		
		private string _fcityno;
        public string fCityNo
        {
            get{ return _fcityno; }
            set{ _fcityno = value; }
        }        
		/// <summary>
		/// 具体地址
        /// </summary>		
		private string _faddress;
        public string fAddress
        {
            get{ return _faddress; }
            set{ _faddress = value; }
        }        
		/// <summary>
		/// 联系电话
        /// </summary>		
		private string _fphone;
        public string fPhone
        {
            get{ return _fphone; }
            set{ _fphone = value; }
        }        
		/// <summary>
		/// 头像
        /// </summary>		
		private string _fimage;
        public string fImage
        {
            get{ return _fimage; }
            set{ _fimage = value; }
        }        
		/// <summary>
		/// 简介
        /// </summary>		
		private string _fintroduce;
        public string fIntroduce
        {
            get{ return _fintroduce; }
            set{ _fintroduce = value; }
        }        
		/// <summary>
		/// 类型（0--医院OR1--企业）
        /// </summary>		
		private int _ftype;
        public int fType
        {
            get{ return _ftype; }
            set{ _ftype = value; }
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
		/// fBZ
        /// </summary>		
		private string _fbz;
        public string fBZ
        {
            get{ return _fbz; }
            set{ _fbz = value; }
        }        
		   
	}
}

