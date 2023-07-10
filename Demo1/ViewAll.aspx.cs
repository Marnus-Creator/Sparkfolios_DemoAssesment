using System;
using System.Data;
using System.Web.UI.WebControls;
using Demo1.DataAccess;

namespace Demo1
{
    public partial class ViewAll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateRepeater();
            }
        }

        private void populateRepeater()
        {
            DataTable dt = DataAcccessClass.People.getAll();
            DataView dv = dt.DefaultView;

            string sortBy = ddlSortBy.SelectedValue;

            switch (sortBy)
            {
                case "0": // Sort by Firstname
                    dv.Sort = "First Name";
                    break;
                case "1": // Sort by Lastname
                    dv.Sort = "Last Name";
                    break;
                case "2": // Sort by Date of Birth
                    dv.Sort = "Date of Birth";
                    break;
                default:
                    break;
            }

            rptAllPeople.DataSource = dv.ToTable();
            rptAllPeople.DataBind();
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "DeleteEntry")
            {
                int entryId = Convert.ToInt32(e.CommandArgument);
                bool deleteResult = DataAcccessClass.People.up_DeletePerson(entryId);

                if (deleteResult)
                {
                    populateRepeater();
                }
                else
                {
                    throw new Exception("Sorry, this record could not be deleted. If the problem persists, please contact our support team.");
                }
            }
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            populateRepeater();
        }

        protected void rptAllPeople_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                DropDownList ddlSortBy = (DropDownList)e.Item.FindControl("ddlSortBy");
                ddlSortBy.SelectedIndexChanged += ddlSortBy_SelectedIndexChanged;
            }
        }
    }
}
