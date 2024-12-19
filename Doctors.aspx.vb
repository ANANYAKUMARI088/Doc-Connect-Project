Imports System.Data
Imports Oracle.ManagedDataAccess.Client

Public Class Doctors
    Inherits System.Web.UI.Page

    Private Const connectionString As String = "User Id=SYS;Password=system;Data Source=Aniket10;DBA Privilege=SYSDBA"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnViewProfile_Click(sender As Object, e As EventArgs)
        Dim doctorID As String = txtDoctorID.Text.Trim()
        Dim doctorName As String

        If Not String.IsNullOrEmpty(doctorID) Then
            LoadDoctorProfile(doctorID)
            If Not String.IsNullOrEmpty(doctorName) Then
                LoadDoctorAppointments(doctorName)
            End If
        End If
    End Sub

    Private Sub LoadDoctorProfile(doctorID As String)
        Dim query As String = "SELECT Name, Specialisation, PhoneNo FROM Doctors WHERE ID = :DoctorID"

        Using conn As New OracleConnection(connectionString)
            Using cmd As New OracleCommand(query, conn)
                cmd.Parameters.Add(New OracleParameter("DoctorID", doctorID))
                conn.Open()

                Using reader As OracleDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        lblDoctorProfile.Text = "Doctor Name: " & reader("Name").ToString() & "<br />" &
                                                "Specialisation: " & reader("Specialisation").ToString() & "<br />" &
                                                "Phone No: " & reader("PhoneNo").ToString()
                    Else
                        lblDoctorProfile.Text = "No doctor found with ID: " & doctorID
                    End If
                End Using
            End Using
        End Using
    End Sub

    Private Sub LoadDoctorAppointments(DoctorName)
        Dim query As String = "SELECT AppointmentID, DependentName, AppointmentDate FROM Appointments,Doctors WHERE Name = :DoctorName"

        Using conn As New OracleConnection(connectionString)
            Using cmd As New OracleCommand(query, conn)
                cmd.Parameters.Add(New OracleParameter("Name", DoctorName))
                conn.Open()

                Using adapter As New OracleDataAdapter(cmd)
                    Dim appointments As New DataTable()
                    adapter.Fill(appointments)
                    gvAppointments.DataSource = appointments
                    gvAppointments.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub btnUpdateAppointment_Click(sender As Object, e As EventArgs)
        Dim appointmentID As String = txtAppointmentID.Text.Trim()
        Dim newAppointmentNumber As String = txtNewAppointmentNumber.Text.Trim()

        If Not String.IsNullOrEmpty(appointmentID) AndAlso Not String.IsNullOrEmpty(newAppointmentNumber) Then
            UpdateAppointment(appointmentID, newAppointmentNumber)
        End If
    End Sub

    Private Sub UpdateAppointment(appointmentID As String, newAppointmentNumber As String)
        Dim query As String = "UPDATE Appointments SET AppointmentNumber = :NewAppointmentNumber WHERE AppointmentID = :AppointmentID"

        Using conn As New OracleConnection(connectionString)
            Using cmd As New OracleCommand(query, conn)
                cmd.Parameters.Add(New OracleParameter("AppointmentID", appointmentID))
                cmd.Parameters.Add(New OracleParameter("NewAppointmentNumber", newAppointmentNumber))
                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    Protected Sub gvAppointments_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Text = (e.Row.RowIndex + 1).ToString()
        End If
    End Sub
End Class
