using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace BudgetManager.Pages
{
    public partial class AddExpense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // No need to load anything initially
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            // If there's a success message, show the alert
            if (Request.QueryString["success"] == "true")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "showAlertAndRedirect();", true);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get the form data from the TextBox controls
            string category = txtCategory.Text;
            string description = txtDescription.Text;
            decimal amount = Convert.ToDecimal(txtAmount.Text);
            DateTime date = Convert.ToDateTime(txtDate.Text);

            // Debugging output to check values
            // Response.Write($"Category: {category}, Description: {description}, Amount: {amount}, Date: {date}");

            // Add the expense to the database
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BudgetDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Expense (Category, Description, Amount, Date) VALUES (@Category, @Description, @Amount, @Date)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Amount", amount);
                cmd.Parameters.AddWithValue("@Date", date);

                try
                {
                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        // On successful insertion, show success message and redirect to Default.aspx
                        Response.Redirect("Default.aspx?success=true");
                    }
                    else
                    {
                        // If no rows were inserted
                        Response.Write("Error: No rows inserted");
                    }
                }
                catch (Exception ex)
                {
                    // Log error details
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}
