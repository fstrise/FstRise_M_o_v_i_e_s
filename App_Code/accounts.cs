using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;

/// <summary>
/// Summary description for item
/// </summary>
public class item
{
    MySqlConnection connection;
    MySqlCommand command;

    public DataTable getItem()
    {
        DataTable dt = new DataTable();
        string mysqlstring = Connects.connStr;
        string mysqlcomstring =
            "Select * from item_source ";
        try
        {
            connection = new MySqlConnection(mysqlstring);
            command = connection.CreateCommand();
            MySqlDataAdapter msda;
            command.CommandText = mysqlcomstring;

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
    public item()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private int id;

    public int Id
    {
        get { return id; }
        set { id = value; }
    }
    private string title;

    public string Title
    {
        get { return title; }
        set { title = value; }
    }
    private string description;

    public string Description
    {
        get { return description; }
        set { description = value; }
    }
    private string author;

    public string Author
    {
        get { return author; }
        set { author = value; }
    }
    private string license;

    public string License
    {
        get { return license; }
        set { license = value; }
    }
    private int isfav;

    public int Isfav
    {
        get { return isfav; }
        set { isfav = value; }
    }
    private int isview;

    public int Isview
    {
        get { return isview; }
        set { isview = value; }
    }
    private string sdkversion;

    public string Sdkversion
    {
        get { return sdkversion; }
        set { sdkversion = value; }
    }
    private string linkdownload;

    public string Linkdownload
    {
        get { return linkdownload; }
        set { linkdownload = value; }
    }
    private string linkgithub;

    public string Linkgithub
    {
        get { return linkgithub; }
        set { linkgithub = value; }
    }
    private int type;

    public int Type
    {
        get { return type; }
        set { type = value; }
    }
    private int moderun;

    public int Moderun
    {
        get { return moderun; }
        set { moderun = value; }
    }
    private string urlimg;

    public string Urlimg
    {
        get { return urlimg; }
        set { urlimg = value; }
    }
    private int coderun;

    public int Coderun
    {
        get { return coderun; }
        set { coderun = value; }
    }
}