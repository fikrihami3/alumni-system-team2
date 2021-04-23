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
@WebServlet(name = "Participant", urlPatterns = {"/Participant"})
public class Participant extends HttpServlet{
    
        private Connection con;
        private String sqlStatement;
        PreparedStatement preparedStatementInsert = null;
        
        private String participantName;
	private String participantID;
	private String participantEmail;
	private String participantPhoneNum;
	private int eventID;
	private String joinImgProof;

    public String getParticipantName() {
        return participantName;
    }

    public void setParticipantName(String participantName) {
        this.participantName = participantName;
    }

    public String getParticipantID() {
        return participantID;
    }

    public void setParticipantID(String participantID) {
        this.participantID = participantID;
    }

    public String getParticipantEmail() {
        return participantEmail;
    }

    public void setParticipantEmail(String participantEmail) {
        this.participantEmail = participantEmail;
    }

    public String getParticipantPhoneNum() {
        return participantPhoneNum;
    }

    public void setParticipantPhoneNum(String participantPhoneNum) {
        this.participantPhoneNum = participantPhoneNum;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public String getJoinImgProof() {
        return joinImgProof;
    }

    public void setJoinImgProof(String joinImgProof) {
        this.joinImgProof = joinImgProof;
    }     

	public Participant(){

	}

	public void finalize() throws Throwable {

	}

	/**
	 * 
	 * @param userName
	 * @param userID
	 * @param userEmail
	 * @param userPhoneNum
	 * @param eventID
	 * @param joinImgProof
	 */
	public void addParticipant(String userName1, String userID, String userEmail, String userPhoneNum, int eventID, InputStream joinImgProof, HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException{

            con = JDBCUtility.getCon();
            
            sqlStatement ="INSERT into participant(participantName, participantID, participantEmail, participantPhoneNum, eventID, joinImgProof) VALUES(?, ?, ?, ?, ?, ?)";
          
            
        
            ArrayList<Participant> participantlist = new ArrayList<Participant>();
            Participant participant = new Participant(); 
            
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                preparedStatementInsert.setString(1, userName1);
                preparedStatementInsert.setString(2, userID);
                preparedStatementInsert.setString(3, userEmail);
                preparedStatementInsert.setString(4, userPhoneNum);
                preparedStatementInsert.setInt(5, eventID);
                preparedStatementInsert.setBlob(6, joinImgProof);
                
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
