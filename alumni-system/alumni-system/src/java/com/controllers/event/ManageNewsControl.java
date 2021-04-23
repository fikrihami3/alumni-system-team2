/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers.event;

import com.models.event.News;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Amir Syafiq
 */
@WebServlet(name = "ManageNewsControl", urlPatterns = {"/ManageNewsControl"})
@MultipartConfig(maxFileSize = 16177216)
public class ManageNewsControl extends HttpServlet{
    
        News news = new News();
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
            case "Manage News":
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/ManageNewsInterface.jsp").forward(request, response);
                    break;
                }
            case "AddNews":
                {
                    compareNewsAction("Add", request, response);
                    break;
                }
            case "DeleteNews":
                {
                    compareNewsAction("Delete", request, response);
                } 
            case "UpdateNews":
                {
                    compareNewsAction("Update", request, response);
                }        
            case "News Menu":
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/ManageNewsInterface.jsp").forward(request, response);
                }
            case "Manage Menu":
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/MainStaffInterface.jsp").forward(request, response);
                }    
                            
            default:
                break;
            }
        }
        
        public ManageNewsControl(){

	}

	public void finalize() throws Throwable {

	}

	/**
	 * 
         * @param option
	 * @param newsTitle
	 * @param newsCategory
	 * @param newsArticle
	 * @param newsWebsite
         * @param request
         * @param response
         * @throws javax.servlet.ServletException
         * @throws java.io.IOException
	 */
	public void verifyNewsData(String option, int newsID, String newsTitle, String newsCategory, String newsArticle, String newsWebsite, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

            if(option.equals("Add"))
            {
                news.createNews(newsTitle,  newsCategory,  newsArticle, newsWebsite, request, response);
                request.getRequestDispatcher("WEB-INF/event/jsp/AddNewsInterface.jsp").forward(request, response);
            }
            else if(option.equals("Update"))
            {
                news.updateSavedNews(newsID, newsTitle,  newsCategory,  newsArticle,  newsWebsite, request, response);
                news.searchAllSavedNews(request, response);
                //response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
            }
	}

        public int generateNewsID(){
		return 0;
	}

	/**
	 * 
	 * @param newsID
         * @param option
         * @param request
         * @param response
         * @throws javax.servlet.ServletException
         * @throws java.io.IOException
	 */
	public void verifyNewsID(int newsID, String option, HttpServletRequest request, HttpServletResponse response) 
                throws ServletException, IOException {

            if(newsID>0)
            {
                if(option.equals("Update"))
                {
                   news.searchSavedNews(newsID, request, response);
                   //response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
                }
                else if(option.equals("Delete"))
                {
                    news.deleteNews(newsID, request, response);
                    news.searchAllSavedNews(request, response);
                    //response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
                }
            }
            else
            {
                try (PrintWriter out = response.getWriter()) {
                    out.println("Invalid news!");
                } 
            }
	}
        
	public void fetchAllSavedNews(){

	}

	public void returnSavedNews(){

	}
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) 
                throws ServletException, IOException {
        

            if (request.getParameter("button1") != null) 
            {
                compareNewsAction("Add", request, response);
            } 
            
            else if (request.getParameter("button2") != null) 
            {
                compareNewsAction("Update", request, response);
            } 
            
            else if (request.getParameter("button3") != null) 
            {
                compareNewsAction("Delete", request, response);
            } 
            
            else if (request.getParameter("button4") != null) 
            {
                String newsTitle = request.getParameter("newsTitle");
                String newsCategory = request.getParameter("newsCategory");
                String newsArticle = request.getParameter("newsArticle");
                String newsWebsite = request.getParameter("newsWebsite");
               
                verifyNewsData("Add", 0, newsTitle,  newsCategory,  newsArticle,  newsWebsite, request, response);

            } 
            
            else if (request.getParameter("button5") != null) 
            {
                int newsID = Integer.parseInt(request.getParameter("newsID"));
                verifyNewsID(newsID, "Update", request, response);
            } 
            
            else if (request.getParameter("button6") != null) 
            {
                int newsID = Integer.parseInt(request.getParameter("newsID"));
                verifyNewsID(newsID, "Delete", request, response);    
            } 
            
            else if (request.getParameter("button7") != null) 
            {
                int newsID = Integer.parseInt(request.getParameter("newsID"));
                String newsTitle = request.getParameter("newsTitle");
                String newsCategory = request.getParameter("newsCategory");
                String newsArticle = request.getParameter("newsArticle");
                String newsWebsite = request.getParameter("newsWebsite");
                verifyNewsData("Update",newsID, newsTitle,  newsCategory,  newsArticle,  newsWebsite, request, response);
            }
            else 
            {
                // ???
            }

            //request.getRequestDispatcher("/WEB-INF/some-result.jsp").forward(request, response);
        }
	/**
	 * 
	 * @param newsAction
         * @param request
         * @param response
         * @throws javax.servlet.ServletException
         * @throws java.io.IOException
	 */
        
        
	public void compareNewsAction(String newsAction, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
            
            if("Add".equals(newsAction))
            {   
                String message = "no";
                HttpSession session = request.getSession();
                session.setAttribute("alertMsg", message);
                request.getRequestDispatcher("WEB-INF/event/jsp/AddNewsInterface.jsp").forward(request, response);  
            }
            
            else if("Update".equals(newsAction))
            {
                String opt = "Update";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                news.searchAllSavedNews(request, response);
                //sendPage(request, response, "/UpdateEventInterface.jsp");    
            }
            
            else if("Delete".equals(newsAction))
            {
           
                //fetchAllSavedEvent(request, response);
                String opt = "Delete";
                HttpSession session = request.getSession();
                session.setAttribute("opt", opt);
                String message = "no";
                session.setAttribute("alertMsg", message);
                news.searchAllSavedNews(request, response);
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
