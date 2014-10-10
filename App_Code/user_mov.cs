using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for user_mov
/// </summary>
public class user_mov
{
	public user_mov()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    MySqlConnection connection;
    MySqlCommand command;
    public String insertUser(string username, string email, string password, DateTime dob, string phone)
    {

        string mysqlstring = Connects.connStr;
        string mysqlcomstring =
            " INSERT INTO users (username,email,password,dob,phone,creationdate) VALUES (@username,@email,@password,@dob,@phone,now())";
        try
        {
            connection = new MySqlConnection(mysqlstring);
            command = connection.CreateCommand();
            command.Parameters.AddWithValue("@username", username);
            command.Parameters.AddWithValue("@email", email);
            command.Parameters.AddWithValue("@password", password);
            command.Parameters.AddWithValue("@dob", dob);
            command.Parameters.AddWithValue("@phone", phone);
            command.CommandText = mysqlcomstring;

            connection.Open();
            command.ExecuteNonQuery();
        }
        catch (MySqlException ex)
        {
            return "Error: " + ex.Message;
        }
        finally
        {
            connection.Close();
            command.Dispose();
        }

        return "OK";
    }
    public DataTable get_Users()
    {
        string mysqlstring = Connects.connStr;
        DataTable dt = new DataTable();
        string sqlcomstring = "SELECT * FROM users order by id desc;";
        try
        {
            connection = new MySqlConnection(mysqlstring);
            command = connection.CreateCommand();
            MySqlDataAdapter msda;
            command.CommandText = sqlcomstring;
            connection.Open();
            msda = new MySqlDataAdapter(command);
            msda.Fill(dt);
        }
        catch (MySqlException ex)
        {
        }
        finally
        {
            connection.Close();
            command.Dispose();
        }
        return dt;
    }
}