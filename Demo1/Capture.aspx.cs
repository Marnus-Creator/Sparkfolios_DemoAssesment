using Demo1.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo1
{
    public partial class Capture : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            PersonDTO newPers = new PersonDTO();

            newPers.firstName = txtFirstname.Text;
            newPers.lastName = txtLatsName.Text;
            newPers.dteDOB = DateTime.Parse(txtDOB.Text);
            newPers.txtEmailAddress = txtEmailAddress.Text;


            //Response.Write("<script> alert('Person Added'); </script>");

            if (Page.IsValid)    //ASP.NET Web Forms that is used to check the overall validity of the current page
            {
                try
                {
                    DataAccess.DataAcccessClass.People.addPerson(newPers);
                    lblMessage.Text = "Person added successfully";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error adding person: " + ex.Message;
                }
            }
        }


    }
}