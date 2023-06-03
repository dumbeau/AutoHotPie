using System.Collections;
using Gma.System.MouseKeyHook;

namespace WinNative;

internal static class Program
{
    
    /**
     * The program listen to 
     */
    private static void Main(string[] args)
    {
        Hashtable? filter = null;

        if (args.Length == 1)
        {
            filter = new Hashtable();

            // Remove redundant characters and add the shortcut string to filter
            foreach (var shortcut in args[0].Replace(" ", "").Replace("\"", "").Replace("'", "").Split(","))
                filter.Add(Combination.FromString(shortcut).ToString(), true);
        }

        Hook.GlobalEvents().KeyDown += (sender, e) => LogEvent(false, e, filter);
        Hook.GlobalEvents().MouseDown += (sender, e) => LogEvent(false, e, filter);
        Hook.GlobalEvents().MouseUp += (sender, e) => LogEvent(true, e);
        Hook.GlobalEvents().KeyUp += (sender, e) => LogEvent(true, e);
        Application.Run(new ApplicationContext());
    }

    private static void LogEvent(bool isKeyUp, KeyEventArgs e, Hashtable? filter = null)
    {
        var keyString = e.Modifiers.ToString().Replace(", ", "+") + "+" + e.KeyCode;

        if (filter != null && !filter.Contains(keyString)) return;

        if (isKeyUp)
        {
            Console.WriteLine("KEY_UP" + "," + e.KeyCode);
        }
        else
        {
            Console.WriteLine("KEY_DOWN" + "," + keyString);
        }
    }
    
    private static void LogEvent(bool isMouseUp, MouseEventArgs e, Hashtable? filter = null)
    {
        var keyString = e.Button.ToString();

        if (filter != null && !filter.Contains(keyString)) return;

        if (isMouseUp)
        {
            Console.WriteLine("MOUSE_UP" + "," + e.Button);
        }
        else
        {
            Console.WriteLine("MOUSE_DOWN" + "," + e.Button);
        }
    }
}