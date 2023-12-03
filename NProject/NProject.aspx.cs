using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NProject
{
    public partial class NProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["UserName"] != null)
                {
                    SessionLabel.Text = "Session set: " + Session["UserName"].ToString();
                }


                if (Request.Cookies["UserName"] != null)
                {
                    CookieLabel.Text = "Cookie set: " + Request.Cookies["UserName"].Value;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlDataSource1.InsertParameters["ProjectName"].DefaultValue = TextBox1.Text;
            SqlDataSource1.InsertParameters["Budget"].DefaultValue = TextBox2.Text;
            SqlDataSource1.InsertParameters["Timeframe"].DefaultValue = TextBox3.Text;
            SqlDataSource1.InsertParameters["Area"].DefaultValue = TextBox4.Text;
            SqlDataSource1.Insert();
        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {

            SqlDataSource1.DeleteParameters["ProjectID"].DefaultValue = TextBox10.Text;
            SqlDataSource1.Delete();


        }



        protected void UpdateButton_Click(object sender, EventArgs e)
        {


            SqlDataSource1.UpdateParameters["ProjectID"].DefaultValue = TextBox5.Text;
            SqlDataSource1.UpdateParameters["ProjectName"].DefaultValue = TextBox6.Text;
            SqlDataSource1.UpdateParameters["Budget"].DefaultValue = TextBox7.Text;
            SqlDataSource1.UpdateParameters["Timeframe"].DefaultValue = TextBox8.Text;
            SqlDataSource1.UpdateParameters["Area"].DefaultValue = TextBox9.Text;
            SqlDataSource1.Update();


        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchText = TextBox9.Text.Trim();

            if (!string.IsNullOrEmpty(searchText))
            {

                string searchQuery = "SELECT [ProjectID], [ProjectName], [Budget], [Timeframe],[Area] FROM [Project] WHERE [ProjectID] LIKE '%' + @searchText + '%' OR [ProjectName] LIKE '%' + @searchText + '%' OR [Budget] LIKE '%' + @searchText + '%' OR [Timeframe] LIKE '%' + @searchText + '%' OR [Area] LIKE '%' + @searchText + '%'";
                SqlDataSource1.SelectCommand = searchQuery;
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("searchText", searchText);
                GridView1.DataBind();
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT [ProjectID], [ProjectName], [Budget], [Timeframe], [Area] FROM [Project]";
                GridView1.DataBind();
            }
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {

                string filename = System.IO.Path.GetFileName(FileUpload1.FileName);
                string folderPath = @"C:\Users\AHC\Desktop\test\";


                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath);
                }

                string filePath = folderPath + filename;
                FileUpload1.SaveAs(filePath);



                Response.Write("File uploaded successfully!");

            }
        }
        protected void SessionButton_Click(object sender, EventArgs e)
        {

            Session["UserName"] = "Ammar";
            SessionLabel.Text = "Session set: " + Session["UserName"].ToString();
        }

        protected void CookieButton_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("UserName");
            cookie.Value = "Kinani";
            cookie.Expires = DateTime.Now.AddMonths(1);
            Response.Cookies.Add(cookie);
            CookieLabel.Text = "Cookie set: " + cookie.Value;
        }
    }
}