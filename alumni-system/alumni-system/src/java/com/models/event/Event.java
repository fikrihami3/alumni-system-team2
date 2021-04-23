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

@WebServlet(name = "Event", urlPatterns = {"/Event"})
public class Event extends HttpServlet{
        private Connection con;
        private String sqlStatement = "";
        PreparedStatement preparedStatementInsert = null;

        private String eventTitle;  // = "Hello";
	private int eventID;
	private String eventCategory;
	private String eventDate;
	private String eventImage;
	private String eventDescription;
	private String eventOrganizer;
	private String eventVenue;
	private String eventWebsite;
	private String eventTime;
	private int eventCapacity;
	private double eventFee;
	private boolean eventSponsor;
	private double eventSponsorPackageAmt;
	private double eventSponsorGatheredAmt;
        private byte[] eventImage2;

    public Event(int eventID, String eventTitle, String eventDescription, String eventCategory, String eventDate, String eventTime, String eventVenue, int eventCapacity, double eventFee, String eventOrganizer, byte[] eventImage2, String eventWebsite,  boolean eventSponsor, double eventSponsorPackageAmt, double eventSponsorGatheredAmt) {
        this.eventTitle = eventTitle;
        this.eventID = eventID;
        this.eventCategory = eventCategory;
        this.eventDate = eventDate;
        this.eventImage2 = eventImage2;
        this.eventDescription = eventDescription;
        this.eventOrganizer = eventOrganizer;
        this.eventVenue = eventVenue;
        this.eventWebsite = eventWebsite;
        this.eventTime = eventTime;
        this.eventCapacity = eventCapacity;
        this.eventFee = eventFee;
        this.eventSponsor = eventSponsor;
        this.eventSponsorPackageAmt = eventSponsorPackageAmt;
        this.eventSponsorGatheredAmt = eventSponsorGatheredAmt;
    }
        
    public String getEventTitle() {
        return eventTitle;
    }

    public void setEventTitle(String eventTitle) {
        this.eventTitle = eventTitle;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public String getEventCategory() {
        return eventCategory;
    }

    public void setEventCategory(String eventCategory) {
        this.eventCategory = eventCategory;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }
    
    public void setEventImage(String eventImage) {
        this.eventImage = eventImage;
    }
    public String getEventImage() {
        return eventImage;
    }

    public void setEventImage2(byte[] eventImage2) {
        this.eventImage2 = eventImage2;
    }

    public byte[] getEventImage2(){
        return eventImage2;
    }
    

    public String getEventDescription() {
        return eventDescription;
    }

    public void setEventDescription(String eventDescription) {
        this.eventDescription = eventDescription;
    }

    public String getEventOrganizer() {
        return eventOrganizer;
    }

    public void setEventOrganizer(String eventOrganizer) {
        this.eventOrganizer = eventOrganizer;
    }

    public String getEventVenue() {
        return eventVenue;
    }

    public void setEventVenue(String eventVenue) {
        this.eventVenue = eventVenue;
    }

    public String getEventWebsite() {
        return eventWebsite;
    }

    public void setEventWebsite(String eventWebsite) {
        this.eventWebsite = eventWebsite;
    }

    public String getEventTime() {
        return eventTime;
    }

    public void setEventTime(String eventTime) {
        this.eventTime = eventTime;
    }

    public int getEventCapacity() {
        return eventCapacity;
    }

    public void setEventCapacity(int eventCapacity) {
        this.eventCapacity = eventCapacity;
    }

    public double getEventFee() {
        return eventFee;
    }

    public void setEventFee(double eventFee) {
        this.eventFee = eventFee;
    }

    public boolean isEventSponsor() {
        return eventSponsor;
    }

    public void setEventSponsor(boolean eventSponsor) {
        this.eventSponsor = eventSponsor;
    }

    public double getEventSponsorPackageAmt() {
        return eventSponsorPackageAmt;
    }

    public void setEventSponsorPackageAmt(double eventSponsorPackageAmt) {
        this.eventSponsorPackageAmt = eventSponsorPackageAmt;
    }

    public double getEventSponsorGatheredAmt() {
        return eventSponsorGatheredAmt;
    }

    public void setEventSponsorGatheredAmt(double eventSponsorGatheredAmt) {
        this.eventSponsorGatheredAmt = eventSponsorGatheredAmt;
    }

	public Event(){

	}

	public void finalize() throws Throwable {

	}

	/**
	 * 
	 * @param eventCapacity
	 * @param eventCategory
	 * @param eventDate
	 * @param eventDescription
	 * @param eventFee
	 * @param eventImage
	 * @param eventOrganizer
	 * @param eventTime
	 * @param eventTitle
	 * @param eventVenue
	 * @param eventSponsor
	 * @param eventID
	 * @param eventWebsite
	 * @param eventSponsorPackageAmt
	 * @param eventSponsorGatheredAmt
	 */
	public void createEvent(int eventCapacity, String eventCategory, String eventDate, String eventDescription, double eventFee, InputStream eventImage, String eventOrganizer, String eventTime, String eventTitle, String eventVenue, boolean eventSponsor, String eventWebsite, double eventSponsorPackageAmt, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            con = JDBCUtility.getCon();
            
            sqlStatement = "INSERT INTO event(eventTitle, eventDescription, eventCategory, eventDate, eventTime, eventVenue, eventCapacity, eventFee, eventOrganizer, eventImage, eventWebsite, eventSponsor, eventSponsorPackageAmt) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            boolean insertSuccess = false;
            
            try {
                //InputStream eventImage = part.getInputStream();
                preparedStatementInsert = con.prepareStatement(sqlStatement);


                preparedStatementInsert.setString(1, eventTitle);
                preparedStatementInsert.setString(2, eventDescription);
                preparedStatementInsert.setString(3, eventCategory);
                preparedStatementInsert.setString(4, eventDate);
                preparedStatementInsert.setString(5, eventTime);
                preparedStatementInsert.setString(6, eventVenue);
                preparedStatementInsert.setInt(7, eventCapacity);
                preparedStatementInsert.setDouble(8, eventFee);
                preparedStatementInsert.setString(9, eventOrganizer);
                preparedStatementInsert.setBlob(10, eventImage);
                preparedStatementInsert.setString(11, eventWebsite);
                preparedStatementInsert.setBoolean(12, eventSponsor);
                preparedStatementInsert.setDouble(13, eventSponsorPackageAmt);
                /*try (PrintWriter out = response.getWriter()) {
                    out.println(eventSponsor);
                }*/
                
                // execute insert SQL stetement
                preparedStatementInsert.executeUpdate();
                preparedStatementInsert.close();

                if (preparedStatementInsert != null)
                {
                    //insertSuccess = true;
                    String message = "Data added successfully";
                    HttpSession session = request.getSession();
                    session.setAttribute("alertMsg", message);    
                } 
                else
                {
                    String message = "Data added unsuccessful";
                    HttpSession session = request.getSession();
                    session.setAttribute("alertMsg", message);
                }
            }
            catch(SQLException ex) {
                System.out.println(ex.getMessage());
            }  
	}

	/**
	 * 
	 * @param eventCapacity
	 * @param eventCategory
	 * @param eventDate
	 * @param eventDescription
	 * @param eventFee
	 * @param eventImage
	 * @param eventOrganizer
	 * @param eventTime
	 * @param eventTitle
	 * @param eventVenue
	 * @param eventSponsor
	 * @param eventWebsite
	 * @param eventSponsorPackageAmt
	 * @param eventSponsorGatheredAmt
	 */
	public void updateSavedEvent(int eventID, int eventCapacity, String eventCategory, String eventDate, String eventDescription, double eventFee, InputStream eventImage, String eventOrganizer, String eventTime, String eventTitle, String eventVenue, boolean eventSponsor, String eventWebsite, double eventSponsorPackageAmt, HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            
            con = JDBCUtility.getCon();
            
            sqlStatement = "UPDATE event SET eventTitle = ?, eventDescription = ?, eventCategory = ?, eventDate = ?, eventTime = ?, eventVenue = ?, eventCapacity = ?, eventFee = ?, eventOrganizer = ?, eventImage = ?, eventWebsite = ?, eventSponsor = ?, eventSponsorPackageAmt = ? WHERE eventID = ?";
            
            try {
                //InputStream eventImage = part.getInputStream();
                preparedStatementInsert = con.prepareStatement(sqlStatement);
                
                preparedStatementInsert.setString(1, eventTitle);
                preparedStatementInsert.setString(2, eventDescription);
                preparedStatementInsert.setString(3, eventCategory);
                preparedStatementInsert.setString(4, eventDate);
                preparedStatementInsert.setString(5, eventTime);
                preparedStatementInsert.setString(6, eventVenue);
                preparedStatementInsert.setInt(7, eventCapacity);
                preparedStatementInsert.setDouble(8, eventFee);
                preparedStatementInsert.setString(9, eventOrganizer);
                preparedStatementInsert.setBlob(10, eventImage);
                preparedStatementInsert.setString(11, eventWebsite);
                preparedStatementInsert.setBoolean(12, eventSponsor);
                preparedStatementInsert.setDouble(13, eventSponsorPackageAmt);
                preparedStatementInsert.setInt(14, eventID);

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

	/**
	 * 
	 * @param eventID
	 */
	public void deleteEvent(int eventID, HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            con = JDBCUtility.getCon();
        
            sqlStatement = "DELETE FROM event WHERE (eventID = ?)";
            
            try {
                //InputStream eventImage = part.getInputStream();
                preparedStatementInsert = con.prepareStatement(sqlStatement);


                preparedStatementInsert.setInt(1, eventID);
            
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
	 * @param eventID
	 */
	public void searchSavedEvent(int eventID, HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
                
            con = JDBCUtility.getCon();
            
            sqlStatement ="SELECT * FROM event WHERE (eventID = ?)";
            HttpSession session = request.getSession();
            
        
            ArrayList<Event> eventlist = new ArrayList<Event>();
            Event event = new Event(); 
            
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                preparedStatementInsert.setInt(1, eventID);
                
                ResultSet rs = preparedStatementInsert.executeQuery();
                
                while(rs.next())
                {
                    
                        eventID = rs.getInt("eventID");
                        eventTitle = rs.getString("eventTitle");
                        eventDescription = rs.getString("eventDescription");
                        eventCategory = rs.getString("eventCategory");
                        eventDate = rs.getString("eventDate");
                        eventTime = rs.getString("eventTime");
                        eventVenue = rs.getString("eventVenue");
                        eventCapacity = rs.getInt("eventCapacity");
                        eventFee = rs.getDouble("eventFee");
                        eventOrganizer = rs.getString("eventOrganizer");
                        
                        Blob blob = rs.getBlob("eventImage");
                        byte eventImage2[] = blob.getBytes(1, (int) blob.length());
                             
                        eventWebsite = rs.getString("eventWebsite");
                        eventSponsor=rs.getBoolean("eventSponsor");
                        eventSponsor = rs.getBoolean("eventSponsor");
                        eventSponsorPackageAmt = rs.getDouble("eventSponsorPackageAmt");
                        eventSponsorGatheredAmt = rs.getDouble("eventSponsorGatheredAmt");
   
                        eventlist.add(new Event(eventID,eventTitle,eventDescription,eventCategory,eventDate,eventTime,eventVenue,eventCapacity,eventFee,eventOrganizer,eventImage2,eventWebsite,eventSponsor,eventSponsorPackageAmt,eventSponsorGatheredAmt));
                }
                        session.setAttribute("eventlistupdate", eventlist);
                        preparedStatementInsert.close();
                        
                        String opt=(String)session.getAttribute("opt");
                        if(opt.equals("EventSeeMore"))
                        {
                            request.getRequestDispatcher("WEB-INF/event/jsp/ViewEventInterface.jsp").forward(request, response);
                        }
                        else if(opt.equals("JoinEvent"))
                        {
                            int eventIDJoin=eventID;
                            session.setAttribute("eventIDJoin", eventIDJoin);
                            request.getRequestDispatcher("WEB-INF/event/jsp/JoinEventInterface.jsp").forward(request, response);
                        }
                        else if(opt.equals("SponsorEvent"))
                        {
                            int eventIDSponsor=eventID;
                            session.setAttribute("eventIDSponsor", eventIDSponsor);
                            session.setAttribute("eventSponsorPackageAmt", eventSponsorPackageAmt);
                            request.getRequestDispatcher("WEB-INF/event/jsp/SponsorEventInterface.jsp").forward(request, response);
                        }
                        else
                        {
                            request.getRequestDispatcher("WEB-INF/event/jsp/UpdateEventInterface.jsp").forward(request, response);
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
	 * @param eventID
	 * @param eventSponsorGatheredAmt
	 */
	public void updateSponsorGatheredAmt(int eventID, double eventSponsorGatheredAmt1, HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{

            con = JDBCUtility.getCon();
            
            sqlStatement ="SELECT * FROM event WHERE (eventID = ?)";
            /*try (PrintWriter out = response.getWriter()) {
                        out.println(eventCategory);
                    }*/
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                preparedStatementInsert.setInt(1, eventID);
                
                ResultSet rs = preparedStatementInsert.executeQuery();
                
                while(rs.next())
                {
                        eventSponsorGatheredAmt = rs.getInt("eventSponsorGatheredAmt");
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
                
                eventSponsorGatheredAmt=eventSponsorGatheredAmt+eventSponsorGatheredAmt1;
                
                sqlStatement = "UPDATE event SET eventSponsorGatheredAmt = ? WHERE eventID = ?";
            
                try {
                    //InputStream eventImage = part.getInputStream();
                    preparedStatementInsert = con.prepareStatement(sqlStatement);

                    preparedStatementInsert.setDouble(1, eventSponsorGatheredAmt);
                    preparedStatementInsert.setInt(2, eventID);


                    /*try (PrintWriter out = response.getWriter()) {
                        out.println(eventCategory);
                    }*/

                    // execute insert SQL stetement
                    preparedStatementInsert.executeUpdate();
                   
                    preparedStatementInsert.close();

                    if (preparedStatementInsert != null)
                    {
                        //insertSuccess = true;
                        String message = "Sponsor successful";
                        HttpSession session = request.getSession();
                        session.setAttribute("alertMsg", message);
                    } 
                    else
                    {
                        String message = "Sponsor unsuccessful";
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

	/**
	 * 
	 * @param eventID
	 */
	public void updateEventCapacity(int eventID, HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            
            con = JDBCUtility.getCon();
            
            sqlStatement ="SELECT * FROM event WHERE (eventID = ?)";
            /*try (PrintWriter out = response.getWriter()) {
                        out.println(eventCategory);
                    }*/
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                preparedStatementInsert.setInt(1, eventID);
                
                ResultSet rs = preparedStatementInsert.executeQuery();
                
                while(rs.next())
                {
                        eventCapacity = rs.getInt("eventCapacity");
                        /*try (PrintWriter out = response.getWriter()) {
                        out.println(eventCapacity);
                        }*/
                }
                preparedStatementInsert.close();
                if(eventCapacity>0)
            {
                eventCapacity=eventCapacity-1;
                
                sqlStatement = "UPDATE event SET eventCapacity = ? WHERE eventID = ?";
            
                try {
                    //InputStream eventImage = part.getInputStream();
                    preparedStatementInsert = con.prepareStatement(sqlStatement);

                    preparedStatementInsert.setInt(1, eventCapacity);
                    preparedStatementInsert.setInt(2, eventID);


                    /*try (PrintWriter out = response.getWriter()) {
                        out.println(eventCategory);
                    }*/

                    // execute insert SQL stetement
                    preparedStatementInsert.executeUpdate();
                   
                    preparedStatementInsert.close();

                    if (preparedStatementInsert != null)
                    {
                        //insertSuccess = true;
                        String message = "Participation successful";
                        HttpSession session = request.getSession();
                        session.setAttribute("alertMsg", message);
                    } 
                    else
                    {
                        String message = "Participation unsuccessful";
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
            }
            catch(SQLException ex) {
                System.out.println(ex.getMessage());
            } 
            catch (NullPointerException e) {
            try (PrintWriter out = response.getWriter()) {
                    out.println("MAX USER!");
                } 
            }        
	}
   
        public void searchAllSavedEvent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            con = JDBCUtility.getCon();
            
            sqlStatement ="SELECT * FROM event;";
            HttpSession session = request.getSession();
            
        
            ArrayList<Event> eventlist = new ArrayList<>();
            Event event = new Event(); 
            
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                
                ResultSet rs = preparedStatementInsert.executeQuery();
              
                
                while(rs.next())
                {
                    
                        eventID = rs.getInt("eventID");
                        eventTitle = rs.getString("eventTitle");
                        eventDescription = rs.getString("eventDescription");
                        eventCategory = rs.getString("eventCategory");
                        eventDate = rs.getString("eventDate");
                        eventTime = rs.getString("eventTime");
                        eventVenue = rs.getString("eventVenue");
                        eventCapacity = rs.getInt("eventCapacity");
                        eventFee = rs.getDouble("eventFee");
                        eventOrganizer = rs.getString("eventOrganizer");
                        Blob blob = rs.getBlob("eventImage");
                        byte eventImage2[] = blob.getBytes(1, (int) blob.length());
                        eventWebsite = rs.getString("eventWebsite");
                        eventSponsor=rs.getBoolean("eventSponsor");
                        eventSponsor = rs.getBoolean("eventSponsor");
                        eventSponsorPackageAmt = rs.getDouble("eventSponsorPackageAmt");
                        eventSponsorGatheredAmt = rs.getDouble("eventSponsorGatheredAmt");
   
                        eventlist.add(new Event(eventID,eventTitle,eventDescription,eventCategory,eventDate,eventTime,eventVenue,eventCapacity,eventFee,eventOrganizer,eventImage2,eventWebsite,eventSponsor,eventSponsorPackageAmt,eventSponsorGatheredAmt));
                }   
                        session.setAttribute("eventlist", eventlist);
                        preparedStatementInsert.close();
                        String opt=(String)session.getAttribute("opt");
                        if(opt.equals("Update"))
                        {
                            request.getRequestDispatcher("WEB-INF/event/jsp/DeleteEventInterface.jsp").forward(request, response); 
                        }
                        else if(opt.equals("Delete"))
                        {
                            request.getRequestDispatcher("WEB-INF/event/jsp/DeleteEventInterface.jsp").forward(request, response);                            
                        }
                        else if(opt.equals("View"))
                        {
                            News news=new News();
                            news.searchAllSavedNews(request, response);
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
            
        //heroku related
        public ArrayList<Event> getAllSavedEvent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            con = JDBCUtility.getCon();
            
            sqlStatement ="SELECT * FROM event";
            HttpSession session = request.getSession();           
        
            ArrayList<Event> eventlist = new ArrayList<>();
            Event event = new Event(); 

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                
                ResultSet rs = preparedStatementInsert.executeQuery();
                
                while(rs.next())
                {
                    
                        eventID = rs.getInt("eventID");
                        eventTitle = rs.getString("eventTitle");
                        eventDescription = rs.getString("eventDescription");
                        eventCategory = rs.getString("eventCategory");
                        eventDate = rs.getString("eventDate");
                        eventTime = rs.getString("eventTime");
                        eventVenue = rs.getString("eventVenue");
                        eventCapacity = rs.getInt("eventCapacity");
                        eventFee = rs.getDouble("eventFee");
                        eventOrganizer = rs.getString("eventOrganizer");
                        Blob blob = rs.getBlob("eventImage");
                        byte eventImage2[] = blob.getBytes(1, (int) blob.length());
                        eventWebsite = rs.getString("eventWebsite");
                        eventSponsor=rs.getBoolean("eventSponsor");
                        eventSponsor = rs.getBoolean("eventSponsor");
                        eventSponsorPackageAmt = rs.getDouble("eventSponsorPackageAmt");
                        eventSponsorGatheredAmt = rs.getDouble("eventSponsorGatheredAmt");
   
                        eventlist.add(new Event(eventID,eventTitle,eventDescription,eventCategory,eventDate,eventTime,eventVenue,eventCapacity,eventFee,eventOrganizer,eventImage2,eventWebsite,eventSponsor,eventSponsorPackageAmt,eventSponsorGatheredAmt));
                }
                
                session.setAttribute("eventlist", eventlist);
                preparedStatementInsert.close();
                //response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
                        
                
                
            }
            catch(SQLException ex) {
                System.out.println(ex.getMessage());
            } 
            catch (NullPointerException e) {
            try (PrintWriter out = response.getWriter()) {
                    out.println("SUCCESSNO!");
                } 
            }
            
            return eventlist;
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
                ArrayList<Event> event = getAllSavedEvent(request, response);
                Gson gson = new Gson();
                String jsonString = gson.toJson(event);
                
                out.println(jsonString);
                
                out.close();
            }
        }
}