using SchoolManagement.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagement.Models.CommonFn;

namespace SchoolManagement.Admin
{
    public partial class AddClass : System.Web.UI.Page
    {
        //Commonfnx fn = new Commonfnx();

        SchoolCSDbContext db = new SchoolCSDbContext();  


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
            }

        }

        private void GetClass()
        {
            var classes = db.Classes.OrderBy(c => c.ClassId).ToList();

            var query = classes.Select((c, index) => new
            {
                SrNo = index + 1,
                c.ClassId,
                c.ClassName
            }).ToList();

            GridView1.DataSource = query;
            GridView1.DataBind();

        }

        protected void BNAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (db.Classes.FirstOrDefault(c => c.ClassName == TBClass.Text) != null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "errorModal", "showErrorModal('已經存在相同的課程名稱，請使用不同的名稱。');", true);
                    return;
                };

                Class newClass = new Class
                {
                    ClassName = TBClass.Text
                };

                db.Classes.Add(newClass);
                db.SaveChanges();

                lblMsg.Text = "添加成功!!!";
                lblMsg.CssClass = "alert alert-success";
                TBClass.Text = "";
                GetClass();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "errorModal", "showErrorModal('" + ex + "');", true);

            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}