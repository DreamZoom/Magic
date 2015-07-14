using System; 
using System.Text;
using System.Collections.Generic; 
using System.Data;
namespace MedicalCrab.Core.Services{
	 	//公众号关注表
    /// <summary>
    /// takeCare -- 关注;untakeCare --取消关注
    /// </summary>
    public enum PublicRelationState 
    { 
        takeCare,
        untakeCare
    }
		public class tPublicRelation:Magic.Mvc.Service.Service
	{
            public UserSevice userSevice = new UserSevice();
            public tPublicRelation() : base(typeof(Models.tPublicRelation)) 
            { }

            /// <summary>
            /// 根据公众号和用户ID返回关注关系纪录
            /// </summary>
            /// <param name="fPublicNumId">公众号</param>
            /// <param name="fUserId">用户ID</param>
            /// <returns></returns>
            public Models.tPublicRelation GetModelByPU(string fPublicNumId, string fUserId) 
            {
                return this.GetModel(string.Format(" fPublicNumId = '{0}' and fUserId='{1}'", fPublicNumId, fUserId)) as Models.tPublicRelation;
            }

            /// <summary>
            /// 关注公众号
            /// </summary>
            /// <param name="fPublicNumId">公众号ID</param>
            /// <param name="userName">用户名</param>
            /// <returns></returns>
            public bool AddAttention(string fPublicNumId,string userName) 
            {
                bool Flag = true;

                if (!string.IsNullOrEmpty(userName)&&!string.IsNullOrEmpty(fPublicNumId))
                {
                    Models.User mUser = userSevice.getByUserName(userName);

                    if (null != mUser)
                    {
                        Models.tPublicRelation mRelation = this.GetModelByPU(fPublicNumId,mUser.ID);

                        //已经存在关注信息则更新，若不存在则新建
                        if (null != mRelation)
                        {
                            mRelation.fState = (int)PublicRelationState.takeCare;
                            mRelation.fUpdateTime = DateTime.Now;

                            Flag = this.Update(mRelation);
                        }
                        else {
                            mRelation = new Models.tPublicRelation();
                            mRelation.fPublicNumId = fPublicNumId;
                            mRelation.fUserId = mUser.ID;
                            mRelation.fState = (int)PublicRelationState.takeCare;
                            mRelation.fAddTime = DateTime.Now;
                            mRelation.fUpdateTime = DateTime.Now;
                            mRelation.fBZ = string.Empty;

                            Flag = this.Add(mRelation);
                        }

                    }
                    else
                    {
                        Flag = false;
                    }
                }
                else {
                    Flag = false;
                }

                return Flag;
            }

            /// <summary>
            /// 公众号取消关注
            /// </summary>
            /// <param name="fPublicNumId"></param>
            /// <param name="userName"></param>
            /// <returns></returns>
            public bool CancelAttention(string fPublicNumId, string userName) 
            {
                bool Flag = true;

                if (!string.IsNullOrEmpty(userName) && !string.IsNullOrEmpty(fPublicNumId))
                {
                    Models.User mUser = userSevice.getByUserName(userName);

                    if (null != mUser)
                    {
                        Models.tPublicRelation mRelation = this.GetModelByPU(fPublicNumId, mUser.ID);

                        //已经存在则取消关注,否则不能取消
                        if (null != mRelation)
                        {
                            mRelation.fState = (int)PublicRelationState.untakeCare;
                            mRelation.fUpdateTime = DateTime.Now;

                            Flag = this.Update(mRelation);
                        }
                        else
                        {
                            Flag = false;
                        }

                    }
                    else
                    {
                        Flag = false;
                    }
                }
                else
                {
                    Flag = false;
                }

                return Flag;
            }
		   
	}
}

