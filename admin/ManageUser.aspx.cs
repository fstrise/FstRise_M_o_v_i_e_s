using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ManageUser : System.Web.UI.Page
{
    user_mov objuser = new user_mov();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadDataUser();

        }
    }
    private void loadDataUser()
    {
        DataTable dtData = objuser.get_Users();
        RadGrid1.DataSource = dtData;
        RadGrid1.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        objuser.insertUser(txtUsername.Text, txtEmail.Text, txtPassword.Text, DateTime.Parse(txtDOB.SelectedDate.Value.ToShortDateString() + " " + DateTime.Now.ToLongTimeString()), txtPhone.Text);
        loadDataUser();
    }
    protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        DataTable dtData = objuser.get_Users();
        if (dtData.Rows.Count > 0)
        {
            RadGrid1.DataSource = dtData;
        }
    }
    public string valueStatus(string status)
    {
        if (status.Equals("True"))
            return "Active";
        else
            return "Suspend";
    }

}