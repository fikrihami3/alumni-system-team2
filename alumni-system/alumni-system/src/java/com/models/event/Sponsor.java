/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.models.event;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jdbc.utility.JDBCUtility;

/**
 *
 * @author Amir Syafiq
 */
@WebServlet(name = "Sponsor", urlPatterns = {"/Sponsor"})
public class Sponsor extends HttpServlet{
        private Connection con;
        private String sqlStatement;
        PreparedStatement preparedStatementInsert = null;
        
        private String sponsorName;
	private String sponsorID;
	private String sponsorEmail;
	private String sponsorPhoneNum;
	private double sponsorAmt;
	private int eventID;
	private String sponsorImgProof;

    public String getSponsorName() {
        return sponsorName;
    }

    public void setSponsorName(String sponsorName) {
        this.sponsorName = sponsorName;
    }

    public String getSponsorID() {
        return sponsorID;
    }

    public void setSponsorID(String sponsorID) {
        this.sponsorID = sponsorID;
    }

    public String getSponsorEmail() {
        return sponsorEmail;
    }

    public void setSponsorEmail(String sponsorEmail) {
        this.sponsorEmail = sponsorEmail;
    }

    public String getSponsorPhoneNum() {
        return sponsorPhoneNum;
    }

    public void setSponsorPhoneNum(String sponsorPhoneNum) {
        this.sponsorPhoneNum = sponsorPhoneNum;
    }

    public double getSponsorAmt() {
        return sponsorAmt;
    }

    public void setSponsorAmt(double sponsorAmt) {
        this.sponsorAmt = sponsorAmt;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public String getSponsorImgProof() {
        return sponsorImgProof;
    }

    public void setSponsorImgProof(String sponsorImgProof) {
        this.sponsorImgProof = sponsorImgProof;
    }

	public Sponsor(){

	}

	public void finalize() throws Throwable {

	}

	/**
	 * 
	 * @param userName
	 * @param userID
	 * @param userEmail
	 * @param userPhoneNum
	 * @param eventSponsorAmt
	 * @param eventID
	 * @param sponsorImgProof
	 */
	public void addSponsor(String userName1, String userID, String userEmail, String userPhoneNum, double eventSponsorAmt, int eventID, InputStream sponsorImgProof, HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException{
            
            con = JDBCUtility.getCon();
            
            sqlStatement ="INSERT into sponsor(sponsorName, sponsorID, sponsorEmail, sponsorPhoneNum, sponsorAmt, eventID, sponsorImgProof) VALUES(?, ?, ?, ?, ?, ?, ?)";
          
            
        
            ArrayList<Sponsor> sponsorlist = new ArrayList<Sponsor>();
            Sponsor sponsor = new Sponsor(); 
            
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                preparedStatementInsert.setString(1, userName1);
                preparedStatementInsert.setString(2, userID);
                preparedStatementInsert.setString(3, userEmail);
                preparedStatementInsert.setString(4, userPhoneNum);
                preparedStatementInsert.setDouble(5, eventSponsorAmt);
                preparedStatementInsert.setInt(6, eventID);
                preparedStatementInsert.setBlob(7, sponsorImgProof);
                
                preparedStatementInsert.executeUpdate();
                preparedStatementInsert.close();

            }
            catch(SQLException ex) {
                System.out.println(ex.getMessage());
            } 
            catch (NullPointerException e) {
            try (PrintWriter out = response.getWriter()) {
                    out.println("SUCCESS!");
                } 
            }   
	}
}
