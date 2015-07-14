using System; 
using System.Text;
using System.Collections.Generic; 
using System.Data;
namespace MedicalCrab.Core.Models{
	 	//vGetUserPublicNum
    public class vGetUserPublicNum : Magic.Mvc.Model.Model
	{
   		     
      	/// <summary>
		/// fUserId
        /// </summary>		
		private string _fuserid;
        public string fUserId
        {
            get{ return _fuserid; }
            set{ _fuserid = value; }
        }        
		/// <summary>
		/// fState
        /// </summary>		
		private int _fstate;
        public int fState
        {
            get{ return _fstate; }
            set{ _fstate = value; }
        }
        ///// <summary>
        ///// Id
        ///// </summary>		
        //private string _Id;
        //public string Id
        //{
        //    get { return _Id; }
        //    set { _Id = value; }
        //}        
		/// <summary>
		/// fIndexNo
        /// </summary>		
		private int _findexno;
        public int fIndexNo
        {
            get{ return _findexno; }
            set{ _findexno = value; }
        }        
		/// <summary>
		/// fNo
        /// </summary>		
		private string _fno;
        public string fNo
        {
            get{ return _fno; }
            set{ _fno = value; }
        }        
		/// <summary>
		/// fName
        /// </summary>		
		private string _fname;
        public string fName
        {
            get{ return _fname; }
            set{ _fname = value; }
        }        
		/// <summary>
		/// fCityNo
        /// </summary>		
		private string _fcityno;
        public string fCityNo
        {
            get{ return _fcityno; }
            set{ _fcityno = value; }
        }        
		/// <summary>
		/// fAddress
        /// </summary>		
		private string _faddress;
        public string fAddress
        {
            get{ return _faddress; }
            set{ _faddress = value; }
        }        
		/// <summary>
		/// fPhone
        /// </summary>		
		private string _fphone;
        public string fPhone
        {
            get{ return _fphone; }
            set{ _fphone = value; }
        }        
		/// <summary>
		/// fImage
        /// </summary>		
		private string _fimage;
        public string fImage
        {
            get{ return _fimage; }
            set{ _fimage = value; }
        }        
		/// <summary>
		/// fIntroduce
        /// </summary>		
		private string _fintroduce;
        public string fIntroduce
        {
            get{ return _fintroduce; }
            set{ _fintroduce = value; }
        }        
		/// <summary>
		/// fType
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

