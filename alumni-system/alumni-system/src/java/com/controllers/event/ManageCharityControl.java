/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers.event;

import com.models.event.Charity;
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
@WebServlet(name = "ManageCharityControl", urlPatterns = {"/ManageCharityControl"})
@MultipartConfig(maxFileSize = 16177216)
public class ManageCharityControl extends HttpServlet{
    
        Charity charity = new Charity();
        
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
            case "Manage Charity":
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/ManageCharityInterface.jsp").forward(request, response);
                    break;
                }
            case "AddCharity":
                {
                    compareCharityAction("Add", request, response);
                    break;
                }
            case "DeleteCharity":
                {
                    compareCharityAction("Delete", request, response);
                    break;
                }
            case "UpdateCharity":
                {
                    compareCharityAction("Update", request, response);
                    break;
                }
            case "Charity Menu":
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/ManageCharityInterface.jsp").forward(request, response);
                }
            case "Manage Menu":
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/MainStaffInterface.jsp").forward(request, response);
                }                    
            default:
                break;
            }
        }
        
        public ManageCharityControl(){

	}

	public void finalize() throws Throwable {

	}

	/**
	 * 
	 * @param charityAction
	 */


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
	public void verifyCharityData(String option, int charityID, String charityTitle, String charityDescription, String charityDateline, double charityTargetAmt, InputStream charityImage, String charityAccBank, String charityAccNumber, String charityAccName, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
            
             if(option.equals("Add"))
            {
                charity.createCharity(charityTitle, charityDescription, charityDateline, charityTargetAmt, charityImage, charityAccBank, charityAccNumber, charityAccName, request, response);
                request.getRequestDispatcher("WEB-INF/event/jsp/AddCharityInterface.jsp").forward(request, response);
            }
            else if(option.equals("Update"))
            {
                charity.updateSavedCharity(charityID, charityTitle, charityDescription, charityDateline, charityTargetAmt, charityImage, charityAccBank, charityAccNumber, charityAccName, request, response);
                charity.searchAllSavedCharity(request, response);
                //response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
            }
	}

	public int generateCharityID(){
            return 0;
	}

	/**
	 * 
	 * @param charityID
	 */
        
        public void verifyCharityID(int charityID, String option, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

            if(charityID>0)
            {
                if(option.equals("Update"))
                {
                   charity.searchSavedCharity(charityID, request, response);
                   //response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
                }
                else if(option.equals("Delete"))
                {
                    charity.deleteCharity(charityID, request, response);
                    charity.searchAllSavedCharity(request, response);
                    //response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
                }
            }
            else
            {
                try (PrintWriter out = response.getWriter()) {
                    out.println("Invalid charity!");
                } 
            }
	}
        
        public void returnSavedCharity(){

	}

	public void fetchAllSavedCharity(){

	}
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) 
                throws ServletException, IOException {
        

            if (request.getParameter("button1") != null) 
            {
                compareCharityAction("Add", request, response);
            } 
            
            else if (request.getParameter("button2") != null) 
            {
                compareCharityAction("Update", request, response);
            } 
            
            else if (request.getParameter("button3") != null) 
            {
                compareCharityAction("Delete", request, response);
            } 
            
            else if (request.getParameter("button4") != null) 
            {
                String charityTitle = request.getParameter("charityTitle");
                String charityDescription = request.getParameter("charityDescription");
                String charityDateline = request.getParameter("charityDateline");
                String charityAccBank = request.getParameter("charityAccBank");
                String charityAccNumber = request.getParameter("charityAccNumber");
                String charityAccName = request.getParameter("charityAccName");
                Part part = request.getPart("charityImage");
                InputStream charityImage = part.getInputStream();
                double charityTargetAmt = Double.parseDouble(request.getParameter("charityTargetAmt"));
               
                verifyCharityData("Add", 0, charityTitle,  charityDescription,  charityDateline,  charityTargetAmt,  charityImage,  charityAccBank,  charityAccNumber,  charityAccName, request, response);

            } 
            
            else if (request.getParameter("button5") != null) 
            {
                int charityID = Integer.parseInt(request.getParameter("charityID"));
                verifyCharityID(charityID, "Update", request, response);
                
            } 
            
            else if (request.getParameter("button6") != null) 
            {
                int charityID = Integer.parseInt(request.getParameter("charityID"));
                verifyCharityID(charityID, "Delete", request, response);    
                
            } 
            
            else if (request.getParameter("button7") != null) 
            {
                int charityID = Integer.parseInt(request.getParameter("charityID"));
                String charityTitle = request.getParameter("charityTitle");
                String charityDescription = request.getParameter("charityDescription");
                String charityDateline = request.getParameter("charityDateline");
                String charityAccBank = request.getParameter("charityAccBank");
                String charityAccNumber = request.getParameter("charityAccNumber");
                String charityAccName = request.getParameter("charityAccName");
                Part part = request.getPart("charityImage");
                InputStream charityImage = part.getInputStream();
                double charityTargetAmt = Double.parseDouble(request.getParameter("charityTargetAmt"));
               
                verifyCharityData("Update", charityID, charityTitle,  charityDescription,  charityDateline,  charityTargetAmt,  charityImage,  charityAccBank,  charityAccNumber,  charityAccName, request, response);
            }
            else 
            {
                // ???
            }

            //request.getRequestDispatcher("/WEB-INF/some-result.jsp").forward(request, response);
        }
        public void compareCharityAction(String charityAction, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
            
            if(charityAction.equals("Add"))
            {   
                String message = "no";
                HttpSession session = request.getSession();
                session.setAttribute("alertMsg", message);
                request.getRequestDispatcher("WEB-INF/event/jsp/AddCharityInterface.jsp").forward(request, response);                            

            }
            
            else if(charityAction.equals("Update"))
            {
                String opt = "Update";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                charity.searchAllSavedCharity(request, response);
                //sendPage(request, response, "/UpdateEventInterface.jsp");    
            }
            
            else if(charityAction.equals("Delete"))
            {
           
                //fetchAllSavedEvent(request, response);
                String opt = "Delete";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                charity.searchAllSavedCharity(request, response);
                //sendPage(request, response, "/DeleteEventInterface.jsp");  
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

