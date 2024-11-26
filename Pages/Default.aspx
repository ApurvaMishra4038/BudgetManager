<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BudgetManager.Pages.Default" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Budget Manager</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        /* General styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fb;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            width: 100%;
            box-sizing: border-box;
            text-align: center;
        }

        h1 {
            color: #333;
            font-size: 36px;
            margin-bottom: 30px;
        }

        a {
            display: inline-block;
            margin-bottom: 20px;
            padding: 12px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #45a049;
        }

        hr {
            margin: 30px 0;
            border: 0;
            border-top: 2px solid #eee;
        }

        h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 15px;
        }

        /* GridView Styling */
        .grid-container {
            margin-top: 20px;
            width: 100%;
            border-collapse: collapse;
        }

        .grid-container th, .grid-container td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
            color: #555;
        }

        .grid-container th {
            background-color: #f2f2f2;
            font-weight: bold;
            color: #333;
        }

        .grid-container tr:hover {
            background-color: #f1f1f1;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            h1 {
                font-size: 28px;
            }

            h2 {
                font-size: 20px;
            }

            a {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Budget Manager</h1>
            <a href="AddExpense.aspx">Add New Expense</a>
            <hr />
            <h2>Recent Expenses</h2>

            <%-- Display the success message if it exists in the query string --%>
            <asp:Literal ID="litSuccessMessage" runat="server" Visible="false"></asp:Literal>

            <asp:GridView ID="gvExpenses" runat="server" AutoGenerateColumns="false" CssClass="grid-container" EmptyDataText="No expenses found" OnRowEditing="gvExpenses_RowEditing" OnRowUpdating="gvExpenses_RowUpdating" OnRowCancelingEdit="gvExpenses_RowCancelingEdit" OnRowDeleting="gvExpenses_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="ExpenseID" HeaderText="ID" SortExpression="ExpenseID" Visible="false" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:MM/dd/yyyy}" />
        
                    <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" EditText="Edit" DeleteText="Delete" />
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <script type="text/javascript">
        function showAlertAndRedirect() {
            alert("Expense added successfully!");
            window.location.href = "Default.aspx"; // Reload the page after showing alert
        }
    </script>
</body>
</html>
