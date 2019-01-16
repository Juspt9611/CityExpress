﻿using System;
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
                        fileExtension = Path.GetExtension(fileName);
                        str_image = "CityExp_" + numFiles.ToString() + fileExtension;
                        string pathToSave_100 = HttpContext.Current.Server.MapPath("~/imgBlog/") + str_image;
                        file.SaveAs(pathToSave_100);
                    }
                }
                //  database record update logic here  ()

                context.Response.Write("http://localhost:29083/imgBlog/" + str_image);
            }
            catch (Exception ac)
            {

            }
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