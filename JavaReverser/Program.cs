using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;
using System.IO.Compression;

namespace JavaReverser
{
    class Program
    {

        public enum  ReverseMode
        {
            Disassemble,
            Assemble
        }

        public static void copyAll(string strSource, string strTarget, string strBase)
        {            
            // Create directory if it does not exist (should never happen)
            if (!Directory.Exists(strTarget))
            {
                Directory.CreateDirectory(strTarget);
            }

            string strSub = strSource.Substring(strBase.Length); // Sub folder
            string strNewDirectory = strTarget + strSub;

            if(! Directory.Exists(strNewDirectory))
            {
                Directory.CreateDirectory(strNewDirectory);
            }

            // Copy files
            string[] files = Directory.GetFiles(strSource);

            foreach (string strFile in files)
            {
                Console.WriteLine(@"[+] Copying {0} -> {1} ...", strFile, strTarget);

                string strNewTarget = strTarget + strSub + "\\" + Path.GetFileName(strFile);

                File.Copy(strFile, strNewTarget, true);
            }

            // Copy each subfolder
            string[] strDirectories = Directory.GetDirectories(strSource);

            foreach (string strSub2 in strDirectories)
            {
                
                copyAll(strSub2, strTarget, strBase);
            }
        }

        static void Main(string[] args)
        {
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine("[This is my small Utility for speeding up using Krakatau (https://github.com/Storyyeller/Krakatau) to patch Java-class-files]");

            if(args.Length < 1)
            {
                Console.WriteLine("Usage assembly: JavaReverser.exe --assemble --jar c:\\jarfile.jar --input c:\\disassembled\\org\\path\\test.j");
                Console.WriteLine("Usage disassembly: JavaReverser.exe --jar c:\\jarfile.jar");
            }

            Console.ResetColor();

            string strJarFile = null;
            string strAssemblyFile = null;
            ReverseMode rmode = ReverseMode.Disassemble;

            string strWorkDir = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            string strOutputDir = strWorkDir + "\\output";

            string strPython = @"c:\python27\python.exe";
            string strDisassemble = @"C:\bin\Krakatau-master\disassemble.py";
            string strAssemble = @"C:\bin\Krakatau-master\assemble.py";

            for (int i=0; i < args.Length; i++)
            {
                if(args[i] == "--jar") // File to disassemble or assemble
                {                    
                    strJarFile = args[++i];
                }
                else if (args[i] == "--disassemble")
                {
                    rmode = ReverseMode.Disassemble;
                }
                else if (args[i] == "--assemble")
                {
                    rmode = ReverseMode.Assemble;
                }
                else if (args[i] == "--output")
                {
                    strOutputDir = args[++i];
                }
                else if (args[i] == "--input")
                {
                    strAssemblyFile = args[++i];
                }
                else if (args[i] == "--python")
                {
                    strPython = args[++i];
                }
                else if (args[i] == "--krakatau-disassembler")
                {
                    strDisassemble = args[++i];
                }
                else if (args[i] == "--krakatau-assembler")
                {
                    strAssemble = args[++i];
                }
            }

            Console.WriteLine("[+] Path to " + rmode.ToString() + ":" + strJarFile);

            AppExecute app = new AppExecute();

            Console.WriteLine("[+] Starting to " + rmode.ToString());

            if(rmode == ReverseMode.Assemble)
            {
                Random rnd = new Random();

                string strTempFolderOriginalClasses = Path.GetTempPath() + "krakatauclasses" + rnd.Next().ToString();
                string strTempFolderOutput = Path.GetTempPath() + "krakatauoutput" + rnd.Next().ToString();
                // python C:\bin\Krakatau-master\assemble.py -out %1 %2

                Console.WriteLine("[+] Assembling...");


                string strArgs = string.Format("{0} -out {1} {2}", strAssemble, strTempFolderOutput, strAssemblyFile);
                string strOutput2 = app.executeApp(strPython, strArgs, strWorkDir);

                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine(strOutput2);
                Console.ResetColor();

                Console.WriteLine("[+] Unpacking original jar to " + strTempFolderOriginalClasses + "...");

                using (FileStream zipToOpen = new FileStream(strJarFile, FileMode.Open))
                {
                    using (ZipArchive archive = new ZipArchive(zipToOpen, ZipArchiveMode.Update))
                    {
                        archive.ExtractToDirectory(strTempFolderOriginalClasses);
                    }
                }

                Console.WriteLine("[+] Merging with old JAR-file...");

                copyAll(strTempFolderOutput, strTempFolderOriginalClasses, strTempFolderOutput);


                Console.WriteLine("[+] Compressing to JAR...");

                string strTempFile = Path.GetTempFileName();
                if (File.Exists(strTempFile)) File.Delete(strTempFile);

                ZipFile.CreateFromDirectory(strTempFolderOriginalClasses, strTempFile);

                Console.WriteLine("[+] Replacing old JAR...");

                if(File.Exists(strJarFile)) // This will always be true
                {
                    File.Delete(strJarFile);
                }

                File.Move(strTempFile, strJarFile);

                Console.WriteLine("[+] Cleaning up...");
                Directory.Delete(strTempFolderOriginalClasses, true);
                Directory.Delete(strTempFolderOutput, true);


            }
            else
            {
                // python c:\bin\Krakatau-master\disassemble.py -out .\test1 U:\bundle.platform.jar
                string strArgs = string.Format("{0} -out {1} {2}", strDisassemble, strOutputDir, strJarFile);
                string strOutput2 = app.executeApp(strPython, strArgs, strWorkDir);

                Console.WriteLine(strOutput2);
            }


        }
    }
}
