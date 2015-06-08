using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IM.ConsoleServer
{
    class Program
    {
        static void Main(string[] args)
        {
            IMChat.WebChat wc = new IMChat.WebChat();
            wc.Start();
            Console.WriteLine("Press 'q' To Exit");

            while ('q' == Console.ReadKey().KeyChar)
            {

                wc.Close();
            }
        }
    }
}
