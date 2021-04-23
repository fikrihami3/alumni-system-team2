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
@WebServlet(name = "Donor", urlPatterns = {"/Donor"})
public class Donor extends HttpServlet{
        private Connection con;
        private String sqlStatement;
        PreparedStatement preparedStatementInsert = null;
        
        private String donorName;
	private String donorID;
	private String donorEmail;
	private String donorPhoneNum;
	private double charityAmt;
	private int charityID;
	private String charityImgProof;

    public String getDonorName() {
        return donorName;
    }

    public void setDonorName(String donorName) {
        this.donorName = donorName;
    }

    public String getDonorID() {
        return donorID;
    }

    public void setDonorID(String donorID) {
        this.donorID = donorID;
    }

    public String getDonorEmail() {
        return donorEmail;
    }

    public void setDonorEmail(String donorEmail) {
        this.donorEmail = donorEmail;
    }

    public String getDonorPhoneNum() {
        return donorPhoneNum;
    }

    public void setDonorPhoneNum(String donorPhoneNum) {
        this.donorPhoneNum = donorPhoneNum;
    }

    public double getCharityAmt() {
        return charityAmt;
    }

    public void setCharityAmt(double charityAmt) {
        this.charityAmt = charityAmt;
    }

    public int getCharityID() {
        return charityID;
    }

    public void setCharityID(int charityID) {
        this.charityID = charityID;
    }

    public String getCharityImgProof() {
        return charityImgProof;
    }

    public void setCharityImgProof(String charityImgProof) {
        this.charityImgProof = charityImgProof;
    }

	public Donor(){

	}

	public void finalize() throws Throwable {

	}

	/**
	 * 
	 * @param userName
	 * @param userID
	 * @param userEmail
	 * @param userPhoneNum
	 * @param charityAmt
	 * @param charityID
	 * @param charityImgProof
	 */
	public void addDonor(String userName1, String userID, String userEmail, String userPhoneNum, double charityAmt, int charityID, InputStream charityImgProof, HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException{

            con = JDBCUtility.getCon();
            
            sqlStatement ="INSERT into donor(donorName, donorID, donorEmail, donorPhoneNum, charityAmt, charityID, charityImgProof) VALUES(?, ?, ?, ?, ?, ?, ?)";
          
            
        
            ArrayList<Donor> donorlist = new ArrayList<Donor>();
            Donor donor = new Donor(); 
            
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                preparedStatementInsert.setString(1, userName1);
                preparedStatementInsert.setString(2, userID);
                preparedStatementInsert.setString(3, userEmail);
                preparedStatementInsert.setString(4, userPhoneNum);
                preparedStatementInsert.setDouble(5, charityAmt);
                preparedStatementInsert.setInt(6, charityID);
                preparedStatementInsert.setBlob(7, charityImgProof);
                
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
