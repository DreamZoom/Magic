using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace MedicalCrab.Core.Models
{
    public class tDynamic:Magic.Mvc.Model.Model
    {
        //[Display(Name = "用户编码")]
        public string fUserId { get; set; }
        
        [Display(Name="动态内容")]
		public string fContent {get;set;}	
		
        [Display(Name="图片路径")]
        public string fImage{get;set;}		

        [Display(Name="图片数量")]
        public int 	fImageCount{get;set;}

        [Display(Name="标签一")]
        public string fTag1{get;set;}	
	
        [Display(Name="标签二")]
        public string fTag2{get;set;}	

        [Display(Name="标签三")]
        public string fTag3{get;set;}	
	
        [Display(Name="标签四")]
        public string fTag4{get;set;}

        [Display(Name = "创建日期")]
        public DateTime fDate{get;set;}

        //[Display(Name = "类型")]
        public int fType{get;set;}

        //[Display(Name = "状态")]
        public int fState { get; set; }	
    }
}
