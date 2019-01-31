using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace WBSupportCenter.vistas
{
    /// <summary>
    /// Descripción breve de fileUploader
    /// </summary>
    public class fileUploader : IHttpHandler
    {

        static string[] mediaExtensions = {
            ".PNG", ".JPG", ".JPEG", ".BMP", ".GIF", //etc
            ".WAV", ".MID", ".MIDI", ".WMA", ".MP3", ".OGG", ".RMA", //etc
            ".AVI", ".MP4", ".DIVX", ".WMV", //etc
        };

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            try
            {
                
                string dirFullPath = HttpContext.Current.Server.MapPath("~/imgBlog/");
                string[] files;
                int numFiles;
                files = System.IO.Directory.GetFiles(dirFullPath);
                numFiles = files.Length;
                numFiles = numFiles + 1;
                string str_image = "";

                foreach (string s in context.Request.Files)
                {
                    HttpPostedFile file = context.Request.Files[s];
                    string fileName = file.FileName;
                    string fileExtension = file.ContentType;

                    if (!string.IsNullOrEmpty(fileName))
                    {
                        if (IsMediaFile(fileName)) {
                            fileExtension = Path.GetExtension(fileName);
                            str_image = "CityExp_" + numFiles.ToString() + fileExtension;
                            string pathToSave_100 = HttpContext.Current.Server.MapPath("~/imgBlog/") + str_image;
                            file.SaveAs(pathToSave_100);
                        }else
                        {
                            str_image = "invalido";
                        }
                    }
                }
                //  database record update logic here  ()

                context.Response.Write(str_image);
            }
            catch (Exception ac)
            {
                context.Response.Write("error");
            }
        }

        static bool IsMediaFile(string path)
        {
            return -1 != Array.IndexOf(mediaExtensions, Path.GetExtension(path).ToUpperInvariant());
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}