<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddExpense.aspx.cs" Inherits="BudgetManager.Pages.AddExpense" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Expense</title>
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        /* Basic form styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fb;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            font-size: 16px;
        }

        h1 {
            font-size: 30px;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-size: 16px;
            color: #555;
            margin-bottom: 8px;
            display: block;
        }

        input[type="text"], input[type="number"], input[type="date"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            color: #555;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group input {
            width: 100%;
        }

        /* Responsive design */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            h1 {
                font-size: 24px;
            }

            input[type="submit"] {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Expense</h1>
        <form runat="server">
            <div class="form-group">
                <label for="txtCategory">Category:</label>
                <asp:TextBox ID="txtCategory" runat="server" required="true" CssClass="form-control" /><br />
            </div>

            <div class="form-group">
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" required="true" CssClass="form-control" /><br />
            </div>

            <div class="form-group">
                <label for="txtAmount">Amount:</label>
                <asp:TextBox ID="txtAmount" runat="server" required="true" type="number" CssClass="form-control" /><br />
            </div>

            <div class="form-group">
                <label for="txtDate">Date:</label>
                <asp:TextBox ID="txtDate" runat="server" required="true" type="date" CssClass="form-control" /><br />
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Add Expense" OnClick="btnSubmit_Click" CssClass="form-control" />
        </form>
    </div>

    <script>
        // Handle the redirect and alert on success
        function showAlertAndRedirect() {
            alert('Expense Added Successfully!');
            window.location.href = 'Default.aspx'; // Redirect to the main page
        }
    </script>
</body>
</html>
