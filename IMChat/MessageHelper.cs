using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.IO;

namespace IMChat
{
    public class MessageHelper
    {
        public static MedicalCrab.Core.Models.Message Json2Object(string ison)
        {
            JsonSerializer js=new JsonSerializer();
            JsonTextReader reader = new JsonTextReader(new StringReader(ison));
            var o = js.Deserialize < MedicalCrab.Core.Models.Message>(reader);
            return o as MedicalCrab.Core.Models.Message;
        }
    }
}
