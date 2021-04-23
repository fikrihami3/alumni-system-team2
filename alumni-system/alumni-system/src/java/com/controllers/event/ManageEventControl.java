/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers.event;

import com.models.event.Event;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.InputStream;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
/**
 *
 * @author Amir Syafiq
 */
@WebServlet(name = "ManageEventControl", urlPatterns = {"/ManageEventControl"})
@MultipartConfig(maxFileSize = 16177216)
public class ManageEventControl extends HttpServlet{
   
        Event event = new Event();

        private Connection con;

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        
        String option = request.getParameter("option");
        if (option==null) {
            option = "";
        }
        
        switch (option) {
            case "Manage Event":
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/ManageEventInterface.jsp").forward(request, response);
                    break;
                }
            case "AddEvent":
                {
                    compareEventAction("Add", request, response);
                    break;
                }
            case "DeleteEvent":
                {
                    compareEventAction("Delete", request, response);
                } 
            case "UpdateEvent":
                {
                    compareEventAction("Update", request, response);
                }        
            case "Event Menu":
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/ManageEventInterface.jsp").forward(request, response);
                }
            case "Manage Menu":
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/MainStaffInterface.jsp").forward(request, response);
                }    
            default:
                break;
            }
        }
        public ManageEventControl(){

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
	 * @param eventWebsite
	 * @param eventSponsorPackageAmt
	 * @param eventSponsorGatheredAmt
	 */
	public void verifyEventData(String option, int eventID, int eventCapacity, String eventCategory, String eventDate, String eventDescription, double eventFee, InputStream eventImage, String eventOrganizer, String eventTime, String eventTitle, String eventVenue, boolean eventSponsor, String eventWebsite, double eventSponsorPackageAmt, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
            
           
            if(eventCapacity<0)
            {
                
            }
            if(option.equals("Add"))
            {
                event.createEvent(eventCapacity,  eventCategory,  eventDate,  eventDescription,  eventFee,  eventImage,  eventOrganizer,  eventTime,  eventTitle,  eventVenue,  eventSponsor,  eventWebsite,  eventSponsorPackageAmt, request, response);
                request.getRequestDispatcher("WEB-INF/event/jsp/AddEventInterface.jsp").forward(request, response);
            }
            else if(option.equals("Update"))
            {
                
                event.updateSavedEvent(eventID, eventCapacity,  eventCategory,  eventDate,  eventDescription,  eventFee,  eventImage,  eventOrganizer,  eventTime,  eventTitle,  eventVenue,  eventSponsor,  eventWebsite,  eventSponsorPackageAmt, request, response);
                event.searchAllSavedEvent(request, response);
                //response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
            }
            
	}

	public int generateEventID(){
		return 0;
	}

	/**
	 * 
	 * @param eventID
	 */
	public void verifyEventID(int eventID, String option, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

            if(eventID>0)
            {
                if(option.equals("Update"))
                {
                   event.searchSavedEvent(eventID, request, response);
                   //response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
                }
                else if(option.equals("Delete"))
                {
                    
                    event.deleteEvent(eventID, request, response);
                    event.searchAllSavedEvent(request, response);
                    //response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
                }
            }
            else
            {
                try (PrintWriter out = response.getWriter()) {
                    out.println("Invalid event!");
                } 
            }
	}

	public void fetchAllSavedEvent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            sendPage(request, response, "/DeleteEventInterface.jsp");
            /*event.getEventTitle();
            try (PrintWriter out = response.getWriter()) {
                out.println(event.getEventTitle());
            }*/
            
            //event.searchAllSavedEvent(request, response);
            /*String driver = "com.mysql.jdbc.Driver";

            String dbName = "eventmoduledb";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String password = "";

            jdbcUtility = new JDBCUtility(driver, url, userName, password);

            jdbcUtility.jdbcConnect();
            con = jdbcUtility.jdbcGetConnection();
            /*HttpServletRequest request;
            HttpServletResponse response;*/
           
            //sendPage(request, response, "/DeleteEventInterface.jsp"); 
            /*response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");  
            
            catch (NullPointerException e) {
            try (PrintWriter out = response.getWriter()) {
                    out.println("ADA ERROR WOI!");
                } 
            }
            /*HttpSession session = request.getSession();
            
            event.searchAllSavedEvent(request, response);
            
            String eventTitle = request.getParameter("eventTitle");
            String eventDescription = request.getParameter("eventDescription");
            String eventCategory = request.getParameter("eventCategory");
            String eventDate = request.getParameter("eventDate");
            String eventTime = request.getParameter("eventTime");
            String eventVenue = request.getParameter("eventVenue");
            int eventCapacity = Integer.parseInt(request.getParameter("eventCapacity"));
            double eventFee = Double.parseDouble(request.getParameter("eventFee"));
            String eventOrganizer = request.getParameter("eventOrganizer");
            String eventImage = request.getParameter("eventImage");
            String eventWebsite = request.getParameter("eventWebsite");
            boolean eventSponsor = Boolean.parseBoolean(request.getParameter("eventSponsor"));
            double eventSponsorPackageAmt = Double.parseDouble(request.getParameter("eventSponsorPackageAmt"));
            double eventSponsorGatheredAmt = Double.parseDouble(request.getParameter("eventSponsorGatheredAmt"));
            
            /*event.setEventTitle(eventTitle);
            event.setEventDescription(eventDescription);
            event.setEventDate(eventDate);
            event.setEventTime(eventTime);
            event.setEventVenue(eventVenue);
            event.setEventCapacity(eventCapacity);
            event.setEventFee(eventFee);
            event.setEventOrganizer(eventOrganizer);
            event.setEventImage(eventImage);
            event.setEventWebsite(eventWebsite);
            event.setEventSponsor(eventSponsor);
            event.setEventSponsorPackageAmt(eventSponsorPackageAmt);
            event.setEventSponsorGatheredAmt(eventSponsorGatheredAmt);*/


            //add beans into session
            /*session.setAttribute("eventTitle", eventTitle);
            session.setAttribute("eventDescription", eventDescription);
            session.setAttribute("eventDate", eventDate);
            session.setAttribute("eventTime", eventTime);
            session.setAttribute("eventVenue", eventVenue);
            session.setAttribute("eventCapacity", eventCapacity);
            session.setAttribute("eventFee", eventFee);
            session.setAttribute("eventOrganizer", eventOrganizer);
            session.setAttribute("eventImage", eventImage);
            session.setAttribute("eventWebsite", eventWebsite);
            session.setAttribute("eventSponsor", eventSponsor);
            session.setAttribute("eventSponsorPackageAmt", eventSponsorPackageAmt);
            session.setAttribute("eventSponsorGatheredAmt", eventSponsorGatheredAmt);

            try (PrintWriter out = response.getWriter()) {
                out.println(eventTitle);
            }*/
            //sendPage(request, response, "/DeleteEventInterface.jsp"); 
            
	}

	public void returnSavedEvent(){

	}

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) 
                throws ServletException, IOException {
        

            if (request.getParameter("button1") != null) 
            {
                compareEventAction("Add", request, response);
            } 
            
            else if (request.getParameter("button2") != null) 
            {
                compareEventAction("Update", request, response);
            } 
            
            else if (request.getParameter("button3") != null) 
            {
                compareEventAction("Delete", request, response);
            } 
            
            else if (request.getParameter("button4") != null) 
            {
                String eventTitle = request.getParameter("eventTitle");
                String eventDescription = request.getParameter("eventDescription");
                String eventCategory = request.getParameter("eventCategory");
                String eventDate = request.getParameter("eventDate");
                String eventTime = request.getParameter("eventTime");
                String eventVenue = request.getParameter("eventVenue");
                int eventCapacity = Integer.parseInt(request.getParameter("eventCapacity"));
                double eventFee = Double.parseDouble(request.getParameter("eventFee"));
                String eventOrganizer = request.getParameter("eventOrganizer");
                Part part = request.getPart("eventImage");
                InputStream eventImage = part.getInputStream();
                //String eventImage = request.getParameter("eventImage");
                String eventWebsite = request.getParameter("eventWebsite");
                boolean eventSponsor;
                String eSponsor = request.getParameter("eventSponsor");
                if(eSponsor.equals("1"))
                {
                   eventSponsor = true;
                }
                else
                {
                    eventSponsor = false;
                }
                double eventSponsorPackageAmt = Double.parseDouble(request.getParameter("eventSponsorPackageAmt"));
                verifyEventData("Add",0, eventCapacity,  eventCategory,  eventDate,  eventDescription,  eventFee,  eventImage,  eventOrganizer,  eventTime,  eventTitle,  eventVenue,  eventSponsor,  eventWebsite,  eventSponsorPackageAmt, request, response);

            }
            
            else if (request.getParameter("button5") != null) 
            {
                int eventID = Integer.parseInt(request.getParameter("eventID"));
                verifyEventID(eventID, "Update", request, response);
                
            } 
            
            else if (request.getParameter("button6") != null) 
            {
                int eventID = Integer.parseInt(request.getParameter("eventID"));
                verifyEventID(eventID, "Delete", request, response);    
                
            } 
            
            else if (request.getParameter("button7") != null) 
            {
                int eventID = Integer.parseInt(request.getParameter("eventID"));
                String eventTitle = request.getParameter("eventTitle");
                String eventDescription = request.getParameter("eventDescription");
                String eventCategory = request.getParameter("eventCategory");
                String eventDate = request.getParameter("eventDate");
                String eventTime = request.getParameter("eventTime");
                String eventVenue = request.getParameter("eventVenue");
                int eventCapacity = Integer.parseInt(request.getParameter("eventCapacity"));
                double eventFee = Double.parseDouble(request.getParameter("eventFee"));
                String eventOrganizer = request.getParameter("eventOrganizer");
                Part part = request.getPart("eventImage");
                InputStream eventImage = part.getInputStream();
                //String eventImage = request.getParameter("eventImage");
                String eventWebsite = request.getParameter("eventWebsite");
                boolean eventSponsor;
                String eSponsor = request.getParameter("eventSponsor");
                if(eSponsor.equals("1"))
                {
                    eventSponsor = true;
                }
                else
                {
                    eventSponsor = false;
                }
                double eventSponsorPackageAmt = Double.parseDouble(request.getParameter("eventSponsorPackageAmt"));
                verifyEventData("Update", eventID, eventCapacity,  eventCategory,  eventDate,  eventDescription,  eventFee,  eventImage,  eventOrganizer,  eventTime,  eventTitle,  eventVenue,  eventSponsor,  eventWebsite,  eventSponsorPackageAmt, request, response); 
            }
            else 
            {
                // ???
            }

            //request.getRequestDispatcher("/WEB-INF/some-result.jsp").forward(request, response);
        }
	/**
	 * 
	 * @param eventAction
	 */
        
         
        
	public void compareEventAction(String eventAction, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
            
            if(eventAction.equals("Add"))
            {   
                String message = "no";
                HttpSession session = request.getSession();
                session.setAttribute("alertMsg", message);
                //sendPage(request, response, "/AddEventInterface.jsp");
                request.getRequestDispatcher("WEB-INF/event/jsp/AddEventInterface.jsp").forward(request, response);  
            }
            
            else if(eventAction.equals("Update"))
            {
                String opt = "Update";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                event.searchAllSavedEvent(request, response);
                //sendPage(request, response, "/UpdateEventInterface.jsp");    
            }
            
            else if(eventAction.equals("Delete"))
            {
                //fetchAllSavedEvent(request, response);
                String opt = "Delete";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                event.searchAllSavedEvent(request, response);
                //sendPage(request, response, "/DeleteEventInterface.jsp");  
            }
            else
            {
                try (PrintWriter out = response.getWriter()) {
                out.println("Error!");
            }
            }

	}
       
        public void sendPage(HttpServletRequest req, HttpServletResponse res, String fileName) throws ServletException, IOException
        {
            // Get the dispatcher; it gets the main page to the user
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(fileName);

            if (dispatcher == null)
            {
                System.out.println("There was no dispatcher");
                // No dispatcher means the html file could not be found.
                res.sendError(HttpServletResponse.SC_NO_CONTENT);
            }
            else
                dispatcher.forward(req, res);
        }
        
        @Override
         protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
             processRequest(request, response);  
        }
}


