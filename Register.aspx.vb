Imports System.Data
Imports System.Globalization
Imports Oracle.ManagedDataAccess.Client

Public Class Register
    Inherits System.Web.UI.Page

    Private Const connectionString As String = "User Id=SYS;Password=system;Data Source=Aniket10;DBA Privilege=SYSDBA"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        Dim employeeNumber As String = txtEmployeeNumber.Text.Trim()
        Dim username As String = txtName.Text.Trim()
        Dim password As String = txtCreatePassword.Text.Trim()
        Dim confirmPassword As String = txtConfirmPassword.Text.Trim()
        Dim role As String = ddlRole.SelectedValue
        Dim userType As String = ddlUserType.SelectedValue

        ' Additional validation can be performed here before database operations

        If password <> confirmPassword Then
            lblMessage.Text = "Passwords do not match."
            lblMessage.ForeColor = System.Drawing.Color.Red
            Return
        End If

        If String.IsNullOrWhiteSpace(employeeNumber) OrElse String.IsNullOrWhiteSpace(username) OrElse String.IsNullOrWhiteSpace(password) OrElse String.IsNullOrWhiteSpace(role) OrElse String.IsNullOrWhiteSpace(userType) Then
            lblMessage.Text = "All fields are required."
            lblMessage.ForeColor = System.Drawing.Color.Red
            Return
        End If

        Dim employeeNumberInt As Integer
        If Not Integer.TryParse(employeeNumber, employeeNumberInt) Then
            lblMessage.Text = "Employee Number must be an integer."
            lblMessage.ForeColor = System.Drawing.Color.Red
            Return
        End If

        If RegisterUser(employeeNumberInt, username, password, role, userType) Then
            ' Registration successful
            lblMessage.Text = "Registration successful!"
            lblMessage.ForeColor = System.Drawing.Color.Green
        Else
            ' Registration failed
            lblMessage.Text = "Registration failed. Please try again."
            lblMessage.ForeColor = System.Drawing.Color.Red
        End If
    End Sub

    Private Function RegisterUser(employeeNumber As Integer, username As String, password As String, role As String, userType As String) As Boolean
        Dim isSuccess As Boolean = False

        Using connection As New OracleConnection(connectionString)
            Try
                connection.Open()
                Dim query As String = "INSERT INTO Users (EmployeeNumber, Username, Password, Role, UType) " &
                                      "VALUES (:employeeNumber, :Username, :Password, :Role, :userType)"
                Using command As New OracleCommand(query, connection)
                    command.Parameters.Add("EmployeeNumber", OracleDbType.Int32).Value = employeeNumber
                    command.Parameters.Add("Username", OracleDbType.Varchar2).Value = username
                    command.Parameters.Add("Password", OracleDbType.Varchar2).Value = password
                    command.Parameters.Add("Role", OracleDbType.Varchar2).Value = role
                    command.Parameters.Add("UType", OracleDbType.Varchar2).Value = userType

                    Dim rowsAffected As Integer = command.ExecuteNonQuery()
                    If rowsAffected > 0 Then
                        isSuccess = True
                    End If
                End Using
            Catch ex As Exception
                ' Handle exceptions
                lblMessage.Text = "An error occurred: " & ex.Message
                lblMessage.ForeColor = System.Drawing.Color.Red
                ' Log the exception (optional)
                ' LogError(ex)
            End Try
        End Using

        Return isSuccess
    End Function

    Protected Sub btnBackToLogin_Click(sender As Object, e As EventArgs) Handles btnBackToLogin.Click
        Response.Redirect("Login.aspx")
    End Sub

    ' Optional: Function to log errors (you might want to implement logging in a real-world application)
    ' Private Sub LogError(ex As Exception)
    '     ' Log the error details to a file, database, etc.
    ' End Sub
End Class
