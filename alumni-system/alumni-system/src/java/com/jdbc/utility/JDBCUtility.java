/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jdbc.utility;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author nurfa
 */
public class JDBCUtility {
    private static Connection con = null;

    private static final String DB_NAME = "ainalfa_alumni_module-db";
    private static final String HOST = "johnny.heliohost.org";
    private static final String PORT = "3306";
    private static final String[] USERNAMES = {
            "ainalfa_ainal",
            "ainalfa_ainal2",
            "ainalfa_ainal3",
            "ainalfa_ainal4"
        };
    private static final String[] PASSWORDS = {
            "ainal@123",
            "ainal2@123",
            "ainal3@123",
            "ainal4@123"
        };
        
    public static Connection getCon() {
        try {
            if(con == null || con.isClosed()) {
                con = createConnection();
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtility.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return con;
    }
    
    public static Connection createConnection() {
        Connection con = null;
        int i = 0;
        
        while(true) {
            try {
                 String url = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME + "?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
//                String url = "jdbc:mysql://localhost:3307/alumni_module-db?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
                String driver = "com.mysql.jdbc.Driver";

                Class.forName (driver);
                con = DriverManager.getConnection(url, USERNAMES[i], PASSWORDS[i]);
//                con = DriverManager.getConnection(url, "root", "");
                DatabaseMetaData dma = con.getMetaData ();
                System.out.println("\nConnected to " + dma.getURL());
                System.out.println("Driver       " + dma.getDriverName());
                System.out.println("Version      " + dma.getDriverVersion());
                System.out.println("Username     " + USERNAMES[i]);
                
                break;
            }
            catch (SQLException ex) {
                while (ex != null)
                {
                    System.out.println ("SQLState: " +
                                        ex.getSQLState ());
                    System.out.println ("Message:  " +
                                        ex.getMessage ());
                    System.out.println ("Vendor:   " +
                                        ex.getErrorCode ());
                    ex = ex.getNextException ();
                    System.out.println ("");
                }
                
                if(i + 1 == USERNAMES.length || i + 1 > USERNAMES.length) {
                    System.out.println("Connection to the database error");
                    break;
                }
                else i++;

            }
            catch (ClassNotFoundException ex) {
                System.out.println(ex);
                System.out.println("JDBC Connector not found");
                break;
            }
        }
        
        return con; 
 }
    
    public static void jdbcConClose() {
	JDBCUtility.con = null;
    }
    
    public  boolean jdbcInsert(String sqlInsert, Connection con)
    {
    	try
	{
            Statement insertStmt = con.createStatement();
            insertStmt.executeUpdate(sqlInsert);
            insertStmt.close();
            return true;
	}
	catch (SQLException ex)
	{
            while (ex != null)
            {
		System.out.println ("SQLState: " +
		ex.getSQLState ());
		System.out.println ("Message:  " +
		ex.getMessage ());
		System.out.println ("Vendor:   " +
		ex.getErrorCode ());
                ex = ex.getNextException ();
		System.out.println ("");
            }

            System.out.println(sqlInsert);
            return false;
	}
	catch (java.lang.Exception ex)
	{
            ex.printStackTrace ();
            return false;
	}
    }    
    
    public boolean jdbcUpdate(String sqlUpdate, Connection con)
    {
	try
	{
            Statement updateStmt = con.createStatement();
	    updateStmt.executeUpdate(sqlUpdate);
            updateStmt.close();
            return true;
	}
	catch (SQLException ex)
	{
            while (ex != null)
            {
                System.out.println ("SQLState: " +
		ex.getSQLState ());
		System.out.println ("Message:  " +
		ex.getMessage ());
		System.out.println ("Vendor:   " +
		ex.getErrorCode ());
		ex = ex.getNextException ();
		System.out.println ("");
            }

            return false;
	}
	catch (java.lang.Exception ex)
	{
            ex.printStackTrace ();
            return false;
	}
    }

    public boolean jdbcDelete(String sqlDelete, Connection con)
    {
        try
	{
            Statement deleteStmt = con.createStatement();
	    deleteStmt.executeUpdate(sqlDelete);
            deleteStmt.close();
            return true;
	}
	catch (SQLException ex)
	{
            while (ex != null)
            {
            	System.out.println ("SQLState: " +
		ex.getSQLState ());
                System.out.println ("Message:  " +
		ex.getMessage ());
		System.out.println ("Vendor:   " +
		ex.getErrorCode ());
		ex = ex.getNextException ();
		System.out.println ("");
            }

            return false;
	}
	catch (java.lang.Exception ex)
	{
            ex.printStackTrace ();
            return false;
	}
    }
}
