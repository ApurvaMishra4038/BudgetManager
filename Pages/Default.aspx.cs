using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BudgetManager.Pages
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadExpenses();
            }
        }

        // Method to load expenses from database
        private void LoadExpenses()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BudgetDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Expense ORDER BY Date DESC", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvExpenses.DataSource = dt;
                gvExpenses.DataBind();
            }
        }

        // Edit button handler
        protected void gvExpenses_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvExpenses.EditIndex = e.NewEditIndex;
            LoadExpenses(); // Reload the data with the selected row in edit mode
        }

        // Update button handler
        protected void gvExpenses_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int expenseId = Convert.ToInt32(gvExpenses.DataKeys[e.RowIndex].Value); // Get the ID of the expense
            string category = ((TextBox)gvExpenses.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string description = ((TextBox)gvExpenses.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            decimal amount = Convert.ToDecimal(((TextBox)gvExpenses.Rows[e.RowIndex].Cells[3].Controls[0]).Text);
            DateTime date = Convert.ToDateTime(((TextBox)gvExpenses.Rows[e.RowIndex].Cells[4].Controls[0]).Text);

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BudgetDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Expense SET Category = @Category, Description = @Description, Amount = @Amount, Date = @Date WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Amount", amount);
                cmd.Parameters.AddWithValue("@Date", date);
                cmd.Parameters.AddWithValue("@Id", expenseId);

                conn.Open();
                cmd.ExecuteNonQuery();
                gvExpenses.EditIndex = -1;
                LoadExpenses(); // Reload the data
            }
        }

        // Cancel button handler
        protected void gvExpenses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvExpenses.EditIndex = -1;
            LoadExpenses();
        }

        // Delete button handler
        protected void gvExpenses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        { 
            int expenseId = Convert.ToInt32(gvExpenses.DataKeys[e.RowIndex].Value); 

            
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BudgetDB"].ConnectionString;

           
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                
                string query = "DELETE FROM Expense WHERE ExpenseID = @ExpenseID";

                
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ExpenseID", expenseId); 

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery(); 

                    
                    LoadExpenses(); 
                }
                catch (Exception ex)
                {
                    
                    Response.Write("Error: " + ex.Message);
                }
            }
        }

    }
}
