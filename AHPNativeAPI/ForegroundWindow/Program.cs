using System.Diagnostics;
using System.Drawing.Imaging;
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

            string exePath = Process.GetProcessById((int)pId).MainModule?.FileName ?? "";
            fgWindowInfo.Add("exePath", exePath);
            
            Icon? icon = Icon.ExtractAssociatedIcon(exePath);
            if (icon == null)
            {
                fgWindowInfo.Add("iconBase64", "");
            }
            else
            {
                
                using (var ms = new MemoryStream())
                {    
                    icon.ToBitmap().Save(ms, ImageFormat.Png);
                    
                    string base64Icon = Convert.ToBase64String(ms.ToArray());
                    
                    fgWindowInfo.Add("iconBase64", base64Icon);
                }

            }

            
            // Print the information in json format
            Console.WriteLine(JsonConvert.SerializeObject(fgWindowInfo));
        }
    }
}