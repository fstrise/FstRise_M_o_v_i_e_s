using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for Connects
/// </summary>
public class Connects
{
    public static string connStr = ConfigurationManager.ConnectionStrings["Con_Movies"].ConnectionString;
    public static MySqlConnection stringConnect()
    {
        MySqlConnection conn = new MySqlConnection(connStr);
        return conn;
    }

    public Connects()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}