/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers.event;

import com.models.event.Event;
import com.models.event.Donor;
import com.models.event.News;
import com.models.event.Participant;
import com.models.event.Charity;
import com.models.event.Sponsor;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Amir Syafiq
 */
@WebServlet(name = "ViewPageControl", urlPatterns = {"/ViewPageControl"})
@MultipartConfig(maxFileSize = 16177216)
public class ViewPageControl extends HttpServlet{
    
        Event event=new Event();
        News news=new News();
        Charity charity=new Charity();
        Participant participant=new Participant();
        Sponsor sponsor=new Sponsor();
        Donor donor=new Donor();
    
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        
        String option = request.getParameter("option");
        if (option==null) {
            option = "";
        }
        
        switch (option) {
            case "managePage":
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/MainStaffInterface.jsp").forward(request, response);
                    break;
                }
            case "viewPage":
                {
                    String opt = "View";
                    
                    session.setAttribute("opt", opt);
                    String message = "no";
                    session.setAttribute("alertMsg", message);

                    event.searchAllSavedEvent(request, response);
                    //request.getRequestDispatcher("WEB-INF/event/jsp/ViewEventInterface.jsp").forward(request, response);
                    break;
                }
            case "Main Menu":
                {
                    request.getRequestDispatcher("WEB-INF/user/jsp/Homepage.jsp").forward(request, response);
                    break;
                }
            case "viewEvent":
                {
                    String opt = "EventSeeMore";
                    
                    session.setAttribute("opt", opt);
                    String message = "no";
                    session.setAttribute("alertMsg", message);
                    int eventID = Integer.parseInt(request.getParameter("eventID"));
                    event.searchSavedEvent(eventID, request, response);   
                    break;
                }
            case "viewCharity":
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/MainStaffInterface.jsp").forward(request, response);
                    break;
                }
                  
            default:
                break;
            }
        }
        
        public ViewPageControl(){

	}

	public void finalize() throws Throwable {

	}

	/**
	 * 
	 * @param charityID
	 */
	public void requestCharity(int charityID){

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
         * @param request
         * @param response
         * @throws javax.servlet.ServletException
         * @throws java.io.IOException
	 */
	public void addNewDonor(String userName, String userID, String userEmail, String userPhoneNum, double charityAmt, int charityID, InputStream charityImgProof, HttpServletRequest request, HttpServletResponse response) 
                throws ServletException, IOException {
        
            donor.addDonor(userName, userID, userEmail, userPhoneNum, charityAmt, charityID, charityImgProof, request, response);
            charity.updateCharityGatheredAmt(charityID, charityAmt, request, response);
            String opt = "CharitySeeMore";
            HttpSession session = request.getSession();
            session.setAttribute("opt", opt);
            charity.searchSavedCharity(charityID, request, response);
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
         * @param request
         * @param response
         * @throws javax.servlet.ServletException
         * @throws java.io.IOException
	 */
	public void addNewSponsor(String userName, String userID, String userEmail, String userPhoneNum, double eventSponsorAmt, int eventID, InputStream sponsorImgProof, HttpServletRequest request, HttpServletResponse response) 
                throws ServletException, IOException {

            sponsor.addSponsor(userName, userID, userEmail, userPhoneNum, eventSponsorAmt, eventID, sponsorImgProof, request, response);
            event.updateSponsorGatheredAmt(eventID, eventSponsorAmt, request, response);
            String opt = "EventSeeMore";
            HttpSession session = request.getSession();
            session.setAttribute("opt", opt);
            event.searchSavedEvent(eventID, request, response);
	}

	/**
	 * 
	 * @param pageAction
	 */
	public void comparePageAction(String pageAction){

	}

	/**
	 * 
	 * @param userName
	 * @param userID
	 * @param userEmail
	 * @param userPhoneNum
	 * @param eventID
	 * @param joinImgProof
         * @param request
         * @param response
         * @throws javax.servlet.ServletException
         * @throws java.io.IOException
	 */
	public void addNewParticipant(String userName, String userID, String userEmail, String userPhoneNum, int eventID, InputStream joinImgProof, HttpServletRequest request, HttpServletResponse response) 
                throws ServletException, IOException {
                
                participant.addParticipant(userName, userID,  userEmail,  userPhoneNum,  eventID, joinImgProof, request, response);   
                event.updateEventCapacity(eventID, request, response);
                String opt = "EventSeeMore";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                event.searchSavedEvent(eventID, request, response); 	
        }
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) 
                throws ServletException, IOException {
            if(request.getParameter("button")!=null)
            {
                String opt = "View";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                
                event.searchAllSavedEvent(request, response);
            }
            /*if (request.getParameter("button1") != null) 
            {
                String opt = "Event";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                event.searchAllSavedEvent(request, response);
            }*/ 
            else if (request.getParameter("button5") != null) //event see more
            {
                String opt = "EventSeeMore";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                int eventID = Integer.parseInt(request.getParameter("eventID"));
                event.searchSavedEvent(eventID, request, response);   
                
            }
            else if (request.getParameter("button6") != null) //news see more
            {
                String opt = "NewsSeeMore";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                int newsID = Integer.parseInt(request.getParameter("newsID"));
                news.searchSavedNews(newsID, request, response);    
                
            }
            else if (request.getParameter("button7") != null) //charity see more
            {
                String opt = "CharitySeeMore";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                int charityID = Integer.parseInt(request.getParameter("charityID"));
                charity.searchSavedCharity(charityID, request, response);  
                
            }
            else if (request.getParameter("buttonJoin") != null) //join event
            {
                String opt = "JoinEvent";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                int eventID = Integer.parseInt(request.getParameter("eventID"));
                event.searchSavedEvent(eventID, request, response);   
                
            }
            else if (request.getParameter("buttonSponsor") != null) //sponsor event
            {
                String opt = "SponsorEvent";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                int eventID = Integer.parseInt(request.getParameter("eventID"));
                event.searchSavedEvent(eventID, request, response);    
            } 
            else if (request.getParameter("buttonCharity") != null) //sponsor event
            {
                String opt = "MakeCharity";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                int charityID = Integer.parseInt(request.getParameter("charityID"));
                charity.searchSavedCharity(charityID, request, response);    
            }
            else if (request.getParameter("buttonSubmitParticipant") != null) //sponsor event
            {
                String opt = "AddParticipant";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                
                int eventID = Integer.parseInt(request.getParameter("eventID"));
                String ID = request.getParameter("userID");
                String particpantName = request.getParameter("userName");
                String particpantEmail = request.getParameter("userEmail");
                String particpantPhoneNum = request.getParameter("userPhoneNum");
                Part part = request.getPart("joinImgProofImage");
                InputStream joinImgProofImage = part.getInputStream();
                
                addNewParticipant(particpantName, ID, particpantEmail, particpantPhoneNum, eventID, joinImgProofImage, request, response); 
                
            }
            else if (request.getParameter("buttonSubmitSponsor") != null) //sponsor event
            {
                String opt = "AddSponsor";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                
                int eventID = Integer.parseInt(request.getParameter("eventID"));
                String ID = request.getParameter("userID");
                String sponsorName = request.getParameter("userName");
                String sponsorEmail = request.getParameter("userEmail");
                String sponsorPhoneNum = request.getParameter("userPhoneNum");
                double sponsorAmt = Double.parseDouble(request.getParameter("eventSponsorAmt"));
                Part part = request.getPart("sponsorImgProofImage");
                InputStream sponsorImgProofImage = part.getInputStream();
                
                addNewSponsor(sponsorName, ID, sponsorEmail, sponsorPhoneNum, sponsorAmt, eventID, sponsorImgProofImage, request, response);
                       }
            else if (request.getParameter("buttonSubmitDonation") != null) //sponsor event
            {
                String opt = "AddDonor";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                
                int charityID = Integer.parseInt(request.getParameter("charityID"));
                String ID = request.getParameter("userID");
                String donorName = request.getParameter("userName");
                String donorEmail = request.getParameter("userEmail");
                String donorPhoneNum = request.getParameter("userPhoneNum");
                double donorAmt = Double.parseDouble(request.getParameter("donationAmt"));
                Part part = request.getPart("donorImgProofImage");
                InputStream charityImgProof = part.getInputStream();
                   
                addNewDonor (donorName, ID, donorEmail, donorPhoneNum, donorAmt, charityID,  charityImgProof, request, response);
                
            }
            else if (request.getParameter("buttonBackEvent") != null) //sponsor event
            {
                String opt = "EventSeeMore";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                int eventID = Integer.parseInt(request.getParameter("eventID"));
                event.searchSavedEvent(eventID, request, response);   
                
            }
            else if (request.getParameter("buttonBackCharity") != null) //sponsor event
            {
                String opt = "CharitySeeMore";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                int charityID = Integer.parseInt(request.getParameter("charityID"));
                charity.searchSavedCharity(charityID, request, response);           
            }
        }

	/**
	 * 
	 * @param newsID
	 */
	public void requestNews(int newsID){

	}

	/**
	 * 
	 * @param eventID
	 */
	public void requestEvent(int eventID){

	}

	public void fetchAllSavedCharity(){

	}

	public void fetchSavedCharity(){

	}

	public void fetchAllSavedEvent(){

	}

	public void fetchSavedEvent(){

	}

	public void fetchAllSavedNews(){

	}

	public void fetchSavedNews(){

	}
        
        @Override
         protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
             processRequest(request, response);  
        }
}
