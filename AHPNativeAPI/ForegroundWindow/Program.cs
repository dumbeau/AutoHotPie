using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;
using Newtonsoft.Json;


namespace ForegroundWindow
{
    static class Program
    {
        [DllImport("user32.dll")]
        static extern IntPtr GetForegroundWindow();

        [DllImport("user32.dll")]
        static extern int GetWindowText(IntPtr hWnd, StringBuilder text, int count);
        
        [DllImport("user32.dll", SetLastError=true)]
        static extern uint GetWindowThreadProcessId(IntPtr hWnd, out uint lpdwProcessId);
        
        static void Main(string[] args)
        {
            Dictionary<string, string> fgWindowInfo = new Dictionary<string, string>();
            
            // Get the current foreground window handle
            IntPtr hWnd = GetForegroundWindow();

            // Get the current foreground window title
            StringBuilder title = new StringBuilder(256);
            GetWindowText(hWnd, title, title.Capacity);
            
            fgWindowInfo.Add("title", title.ToString());

            // Get the current foreground window processId
            uint pId;
            GetWindowThreadProcessId(hWnd, out pId);
            
            fgWindowInfo.Add("exePath", Process.GetProcessById((int)pId).MainModule?.FileName ?? "");
            
            // Print the information in json format
            Console.WriteLine(JsonConvert.SerializeObject(fgWindowInfo));
        }
    }
}