Imports Oracle.ManagedDataAccess.Client
Imports System.Web.UI

Public Class login_new
    Inherits System.Web.UI.Page
    Private Const connectionString As String = "User Id=SYS;Password=system;Data Source=Aniket10;DBA Privilege=SYSDBA"

    Private Function ValidateLogin(username As String, password As String, userType As String) As Boolean
        Dim isValid As Boolean = False

        Using connection As New OracleConnection(connectionString)
            Try
                connection.Open()
                lblMessage.Text = "Database connection successful."
                Dim query As String = "SELECT COUNT(*) FROM Users WHERE Username = :username AND Password = :password AND UType = :userType"
                Using command As New OracleCommand(query, connection)
                    command.Parameters.Add(New OracleParameter("userName", username))
                    command.Parameters.Add(New OracleParameter("password", password))
                    command.Parameters.Add(New OracleParameter("UType", userType))

                    Dim result As Integer = Convert.ToInt32(command.ExecuteScalar())
                    If (result > 0) Then
                        isValid = True
                    End If
                End Using
            Catch ex As Exception
                lblMessage.ForeColor = System.Drawing.Color.Red
                lblMessage.Text = "An error occurred: " & ex.Message
            End Try
        End Using

        Return isValid
    End Function

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim username As String = txtUserName.Text
        Dim password As String = txtPassword.Text
        Dim userType As String = ddlUserType.SelectedValue

        'lblMessage.ForeColor = System.Drawing.Color.Black
        'lblMessage.Text = $"Attempting login with Username: {username}, Password: {password}, UserType: {userType}"

        If String.IsNullOrEmpty(userType) Then
            lblMessage.ForeColor = System.Drawing.Color.Red
            lblMessage.Text = "Please select a user type."
            Return
        End If

        If ValidateLogin(username, password, userType) Then
            lblMessage.ForeColor = System.Drawing.Color.Green
            lblMessage.Text = "Login successful!"

            Select Case userType
                Case "Employee"
                    Response.Redirect("Employee.aspx")
                Case "Doctor"
                    Response.Redirect("Doctors.aspx")
                Case "Admin"
                    Response.Redirect("Admin.aspx")
                Case Else
                    lblMessage.ForeColor = System.Drawing.Color.Red
                    lblMessage.Text = "Invalid user type selected."
            End Select
        Else
            lblMessage.ForeColor = System.Drawing.Color.Red
            lblMessage.Text = "Invalid username, password, or user type."
        End If
    End Sub

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        Response.Redirect("~/Register.aspx")
    End Sub
End Class
