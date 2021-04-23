/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.models.event;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.google.gson.Gson;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import com.jdbc.utility.JDBCUtility;

/**
 *
 * @author Amir Syafiq
 */
@WebServlet(name = "Charity", urlPatterns = {"/Charity"})
public class Charity extends HttpServlet{
        private Connection con;
        private String sqlStatement;
        PreparedStatement preparedStatementInsert = null;
        
        private String charityTitle;
	private String charityImage;
	private String charityDescription;
	private double charityTargetAmt;
	private double charityGatheredAmt;
	private int charityID;
	private String charityDateline;
	private String charityAccBank;
	private String charityAccNumber;
	private String charityAccName;
        private byte charityImage2[];

    public Charity(String charityTitle, byte[] charityImage2, String charityDescription, double charityTargetAmt, double charityGatheredAmt, int charityID, String charityDateline, String charityAccBank, String charityAccNumber, String charityAccName) {
        this.charityTitle = charityTitle;
        this.charityImage2 = charityImage2;
        this.charityDescription = charityDescription;
        this.charityTargetAmt = charityTargetAmt;
        this.charityGatheredAmt = charityGatheredAmt;
        this.charityID = charityID;
        this.charityDateline = charityDateline;
        this.charityAccBank = charityAccBank;
        this.charityAccNumber = charityAccNumber;
        this.charityAccName = charityAccName;
        
    }

    public String getCharityTitle() {
        return charityTitle;
    }

    public void setCharityTitle(String charityTitle) {
        this.charityTitle = charityTitle;
    }

    public String getCharityImage() {
        return charityImage;
    }

    public void setCharityImage(String charityImage) {
        this.charityImage = charityImage;
    }

    public String getCharityDescription() {
        return charityDescription;
    }

    public void setCharityDescription(String charityDescription) {
        this.charityDescription = charityDescription;
    }

    public double getCharityTargetAmt() {
        return charityTargetAmt;
    }

    public void setCharityTargetAmt(double charityTargetAmt) {
        this.charityTargetAmt = charityTargetAmt;
    }

    public double getCharityGatheredAmt() {
        return charityGatheredAmt;
    }

    public void setCharityGatheredAmt(double charityGatheredAmt) {
        this.charityGatheredAmt = charityGatheredAmt;
    }

    public int getCharityID() {
        return charityID;
    }

    public void setCharityID(int charityID) {
        this.charityID = charityID;
    }

    public byte[] getCharityImage2() {
        return charityImage2;
    }

    public void setCharityImage2(byte[] charityImage2) {
        this.charityImage2 = charityImage2;
    }

    public String getCharityDateline() {
        return charityDateline;
    }

    public void setCharityDateline(String charityDateline) {
        this.charityDateline = charityDateline;
    }

    public String getCharityAccBank() {
        return charityAccBank;
    }

    public void setCharityAccBank(String charityAccBank) {
        this.charityAccBank = charityAccBank;
    }

    public String getCharityAccNumber() {
        return charityAccNumber;
    }

    public void setCharityAccNumber(String charityAccNumber) {
        this.charityAccNumber = charityAccNumber;
    }

    public String getCharityAccName() {
        return charityAccName;
    }

    public void setCharityAccName(String charityAccName) {
        this.charityAccName = charityAccName;
    }      

	public Charity(){

	}

	public void finalize() throws Throwable {

	}

	/**
	 * 
	 * @param charityTitle
	 * @param charityDescription
	 * @param charityDateline
	 * @param charityTargetAmt
	 * @param charityImage
	 * @param charityID
	 * @param charityAccBank
	 * @param charityAccNumber
	 * @param charityAccName
	 */
	public void createCharity(String charityTitle, String charityDescription, String charityDateline, double charityTargetAmt, InputStream charityImage, String charityAccBank, String charityAccNumber, String charityAccName, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

            con = JDBCUtility.getCon();
        
            sqlStatement = "INSERT INTO charity(charityTitle, charityImage, charityDescription, charityTargetAmt, charityDateline, charityAccBank, charityAccNumber, charityAccName) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            boolean insertSuccess = false;
            
            try {
                //InputStream eventImage = part.getInputStream();
                preparedStatementInsert = con.prepareStatement(sqlStatement);


                preparedStatementInsert.setString(1, charityTitle);
                preparedStatementInsert.setBlob(2, charityImage);
                preparedStatementInsert.setString(3, charityDescription);
                preparedStatementInsert.setDouble(4, charityTargetAmt);
                preparedStatementInsert.setString(5, charityDateline);
                preparedStatementInsert.setString(6, charityAccBank);
                preparedStatementInsert.setString(7, charityAccNumber);
                preparedStatementInsert.setString(8, charityAccName);
                
                /*try (PrintWriter out = response.getWriter()) {
                    out.println(eventSponsor);
                }*/
                
                // execute insert SQL stetement
                preparedStatementInsert.executeUpdate();
                
                if (preparedStatementInsert != null)
                {
                    //insertSuccess = true;
                    String message = "Data added successfully";
                    HttpSession session = request.getSession();
                    session.setAttribute("alertMsg", message);
                    preparedStatementInsert.close();
                } 
                else
                {
                    String message = "Data added unsuccessful";
                    HttpSession session = request.getSession();
                    session.setAttribute("alertMsg", message);
                    preparedStatementInsert.close();
                }
            }
            catch(SQLException ex) {
                System.out.println(ex.getMessage());
            }  
	}

	/**
	 * 
	 * @param charityID
	 */
	public void deleteCharity(int charityID, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

            con = JDBCUtility.getCon();
        
            sqlStatement = "DELETE FROM charity WHERE (charityID = ?)";
            
            try {
                //InputStream eventImage = part.getInputStream();
                preparedStatementInsert = con.prepareStatement(sqlStatement);


                preparedStatementInsert.setInt(1, charityID);
            
                // execute insert SQL stetement
                preparedStatementInsert.executeUpdate();
                
                if (preparedStatementInsert != null)
                {
                    preparedStatementInsert.close();
                  
                    //insertSuccess = true;
                    String message = "Data deleted successfully";
                    HttpSession session = request.getSession();
                    session.setAttribute("alertMsg", message);
                    preparedStatementInsert.close();
                } 
                else
                {
                    String message = "Data deleted unsuccessful";
                    HttpSession session = request.getSession();
                    session.setAttribute("alertMsg", message);
                    preparedStatementInsert.close();
                }
            }
            catch(SQLException ex) {
                System.out.println(ex.getMessage());
            }  
	}

	/**
	 * 
	 * @param charityID
	 */
	public void searchSavedCharity(int charityID, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

            con = JDBCUtility.getCon();
        
            sqlStatement ="SELECT * FROM charity WHERE (charityID = ?)";
            HttpSession session = request.getSession();
            
        
            ArrayList<Charity> charitylist = new ArrayList<Charity>();
            Charity charity = new Charity(); 
            
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                preparedStatementInsert.setInt(1, charityID);
                
                ResultSet rs = preparedStatementInsert.executeQuery();
                
                while(rs.next())
                {
                    
                        charityID = rs.getInt("charityID");
                        charityTitle = rs.getString("charityTitle");
                        charityDescription = rs.getString("charityDescription");
                        charityDateline = rs.getString("charityDateline");
                        charityTargetAmt = rs.getDouble("charityTargetAmt");
                        charityGatheredAmt = rs.getDouble("charityGatheredAmt");
                        Blob blob = rs.getBlob("charityImage");
                        byte charityImage2[] = blob.getBytes(1, (int) blob.length());
                        charityAccBank = rs.getString("charityAccBank");
                        charityAccNumber = rs.getString("charityAccNumber");
                        charityAccName = rs.getString("charityAccName");
                        
                        charitylist.add(new Charity (charityTitle,  charityImage2,  charityDescription,  charityTargetAmt,  charityGatheredAmt,  charityID,  charityDateline,  charityAccBank,  charityAccNumber,  charityAccName));
                }
                        session.setAttribute("charitylistupdate", charitylist);
                        preparedStatementInsert.close();
                        
                        String opt=(String)session.getAttribute("opt");
                        if(opt.equals("CharitySeeMore"))
                        {
                            request.getRequestDispatcher("WEB-INF/event/jsp/ViewCharityInterface.jsp").forward(request, response);
                        }
                        else if(opt.equals("MakeCharity"))
                        {
                            int makeIDCharity=charityID;
                            session.setAttribute("makeIDCharity", makeIDCharity);
                            request.getRequestDispatcher("WEB-INF/event/jsp/MakeCharityInterface.jsp").forward(request, response);
                        }
                        else
                        {
                            request.getRequestDispatcher("WEB-INF/event/jsp/UpdateCharityInterface.jsp").forward(request, response);
                        }
                        
                /*for (int counter = 0; counter < events.size(); counter++) { 		      
		
                    event = events.get(counter);
                    session.setAttribute("event", event);
                    response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
                }*/
                
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

	/**
	 * 
	 * @param charityTitle
	 * @param charityDescription
	 * @param charityDateline
	 * @param charityTargetAmt
	 * @param charityGatheredAmt
	 * @param charityImage
	 * @param charityAccBank
	 * @param charityAccNumber
	 * @param charityAccName
	 */
	public void updateSavedCharity(int charityID, String charityTitle, String charityDescription, String charityDateline, double charityTargetAmt, InputStream charityImage, String charityAccBank, String charityAccNumber, String charityAccName, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

            con = JDBCUtility.getCon();
        
            sqlStatement = "UPDATE charity SET charityTitle = ?, charityImage = ?, charityDescription = ?, charityTargetAmt = ?, charityDateline = ?, charityAccBank = ?, charityAccNumber = ?, charityAccName = ? WHERE charityID = ?";
            
            try {
                //InputStream eventImage = part.getInputStream();
                preparedStatementInsert = con.prepareStatement(sqlStatement);
                
                preparedStatementInsert.setString(1, charityTitle);
                preparedStatementInsert.setBlob(2, charityImage);
                preparedStatementInsert.setString(3, charityDescription);
                preparedStatementInsert.setDouble(4, charityTargetAmt);
                preparedStatementInsert.setString(5, charityDateline);
                preparedStatementInsert.setString(6, charityAccBank);
                preparedStatementInsert.setString(7, charityAccNumber);
                preparedStatementInsert.setString(8, charityAccName);
                preparedStatementInsert.setInt(9, charityID);


                /*try (PrintWriter out = response.getWriter()) {
                    out.println(eventCategory);
                }*/
            
                // execute insert SQL stetement
                preparedStatementInsert.executeUpdate();
                preparedStatementInsert.close();
                
                if (preparedStatementInsert != null)
                {
                    //insertSuccess = true;
                    String message = "Data updated successfully";
                    HttpSession session = request.getSession();
                    session.setAttribute("alertMsg", message);
                   
                } 
                else
                {
                    String message = "Data updated unsuccessful";
                    HttpSession session = request.getSession();
                    session.setAttribute("alertMsg", message);
                }
            }
            catch(SQLException ex) {
                System.out.println(ex.getMessage());
            }  

	}

	public void searchAllSavedCharity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

            con = JDBCUtility.getCon();
        
            sqlStatement ="SELECT * FROM charity";
            HttpSession session = request.getSession();
            
            ArrayList<Charity> charitylist = new ArrayList<>();
            Charity charity = new Charity(); 
            
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                
                ResultSet rs = preparedStatementInsert.executeQuery();
              
                
                while(rs.next())
                {
                    
                        charityID = rs.getInt("charityID");
                        charityTitle = rs.getString("charityTitle");
                        charityDescription = rs.getString("charityDescription");
                        charityDateline = rs.getString("charityDateline");
                        charityTargetAmt = rs.getDouble("charityTargetAmt");
                        charityGatheredAmt = rs.getDouble("charityGatheredAmt");
                        Blob blob = rs.getBlob("charityImage");
                        byte charityImage2[] = blob.getBytes(1, (int) blob.length());
                        charityAccBank = rs.getString("charityAccBank");
                        charityAccNumber = rs.getString("charityAccNumber");
                        charityAccName = rs.getString("charityAccName");
          
   
                        charitylist.add(new Charity (charityTitle,  charityImage2,  charityDescription,  charityTargetAmt,  charityGatheredAmt,  charityID,  charityDateline,  charityAccBank,  charityAccNumber,  charityAccName));
                }
                        session.setAttribute("charitylist", charitylist);
                        preparedStatementInsert.close();
                        String opt=(String)session.getAttribute("opt");
                        if(opt.equals("Update"))
                        {                 
                            request.getRequestDispatcher("WEB-INF/event/jsp/DeleteCharityInterface.jsp").forward(request, response); 
                        }
                        else if(opt.equals("Delete"))
                        {
                            request.getRequestDispatcher("WEB-INF/event/jsp/DeleteCharityInterface.jsp").forward(request, response);                            
                        }
                        else if(opt.equals("View"))
                        {
                            request.getRequestDispatcher("WEB-INF/event/jsp/ViewPageInterface.jsp").forward(request, response); 
                        }

                /*for (int counter = 0; counter < events.size(); counter++) { 		      
		
                    event = events.get(counter);
                    session.setAttribute("event", event);
                    response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
                }*/
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

        public ArrayList<Charity> getAllSavedCharity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            con = JDBCUtility.getCon();
        
            sqlStatement ="SELECT * FROM charity";
            HttpSession session = request.getSession();
            
        
            ArrayList<Charity> charitylist = new ArrayList<Charity>();
            Charity charity = new Charity(); 
            
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                
                ResultSet rs = preparedStatementInsert.executeQuery();
              
                
                while(rs.next())
                {
                    
                        charityID = rs.getInt("charityID");
                        charityTitle = rs.getString("charityTitle");
                        charityDescription = rs.getString("charityDescription");
                        charityDateline = rs.getString("charityDateline");
                        charityTargetAmt = rs.getDouble("charityTargetAmt");
                        charityGatheredAmt = rs.getDouble("charityGatheredAmt");
                        Blob blob = rs.getBlob("charityImage");
                        byte charityImage2[] = blob.getBytes(1, (int) blob.length());
                        charityAccBank = rs.getString("charityAccBank");
                        charityAccNumber = rs.getString("charityAccNumber");
                        charityAccName = rs.getString("charityAccName");
          
   
                        charitylist.add(new Charity(charityTitle,  charityImage2,  charityDescription,  charityTargetAmt,  charityGatheredAmt,  charityID,  charityDateline,  charityAccBank,  charityAccNumber,  charityAccName));
                }
                        session.setAttribute("charitylist", charitylist);
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
            return charitylist;
        }
	/**
	 * 
	 * @param charityID
	 * @param charityAmt
	 */
	public void updateCharityGatheredAmt(int charityID, double charityAmt, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
            
            con = JDBCUtility.getCon();
            sqlStatement ="SELECT * FROM charity WHERE (charityID = ?)";
            /*try (PrintWriter out = response.getWriter()) {
                        out.println(eventCategory);
                    }*/
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                preparedStatementInsert.setInt(1, charityID);
                
                ResultSet rs = preparedStatementInsert.executeQuery();
                
                while(rs.next())
                {
                        charityGatheredAmt = rs.getInt("charityGatheredAmt");
                        /*try (PrintWriter out = response.getWriter()) {
                        out.println(eventCapacity);
                        }*/
                }
                preparedStatementInsert.close();

            }
            catch(SQLException ex) {
                System.out.println(ex.getMessage());
            } 
            catch (NullPointerException e) {
            try (PrintWriter out = response.getWriter()) {
                    out.println("MAX USER!");
                } 
            }
                
                charityGatheredAmt=charityGatheredAmt+charityAmt;
                
                sqlStatement = "UPDATE charity SET charityGatheredAmt = ? WHERE charityID = ?";
            
                try {
                    //InputStream eventImage = part.getInputStream();
                    preparedStatementInsert = con.prepareStatement(sqlStatement);

                    preparedStatementInsert.setDouble(1, charityGatheredAmt);
                    preparedStatementInsert.setInt(2, charityID);


                    /*try (PrintWriter out = response.getWriter()) {
                        out.println(eventCategory);
                    }*/

                    // execute insert SQL stetement
                    preparedStatementInsert.executeUpdate();
                   
                    preparedStatementInsert.close();

                    if (preparedStatementInsert != null)
                    {
                        //insertSuccess = true;
                        String message = "Donation successful";
                        HttpSession session = request.getSession();
                        session.setAttribute("alertMsg", message);
                    } 
                    else
                    {
                        String message = "Donation unsuccessful";
                        HttpSession session = request.getSession();
                        session.setAttribute("alertMsg", message);
                    }
                }
                catch(SQLException ex) {
                    System.out.println(ex.getMessage());
                } 
                catch (NullPointerException e) {
                try (PrintWriter out = response.getWriter()) {
                    out.println("SUCCESS2!");
                    } 
                }
	}
        
        void sendPage(HttpServletRequest req, HttpServletResponse res, String fileName) throws ServletException, IOException
        {
            // Get the dispatcher; it gets the main page to the user
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(fileName);

            if (dispatcher == null)
            {
                System.out.println("There was no dispatcher");
                // No dispatcher means the html file could not be found.
                res.sendError(res.SC_NO_CONTENT);
            }
            else
                dispatcher.forward(req, res);
        }
        
        @Override 
        public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
            response.setContentType("text/html");
            try (PrintWriter out = response.getWriter()){
                ArrayList<Charity> charity = getAllSavedCharity(request, response);
                Gson gson = new Gson();
                String jsonString = gson.toJson(charity);
                
                out.println(jsonString);
                
                out.close();
            }
        }
}
