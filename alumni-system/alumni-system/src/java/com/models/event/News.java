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
@WebServlet(name = "News", urlPatterns = {"/News"})
public class News extends HttpServlet{
    
        private JDBCUtility jdbcUtility;
        private Connection con;
        private String sqlStatement;
        PreparedStatement preparedStatementInsert = null;
        
        private String newsTitle;
	private int newsID;
	private String newsCategory;
	private String newsArticle;
	private String newsWebsite;

    public News(String newsTitle, int newsID, String newsCategory, String newsArticle, String newsWebsite) {
        this.newsTitle = newsTitle;
        this.newsID = newsID;
        this.newsCategory = newsCategory;
        this.newsArticle = newsArticle;
        this.newsWebsite = newsWebsite;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public int getNewsID() {
        return newsID;
    }

    public void setNewsID(int newsID) {
        this.newsID = newsID;
    }

    public String getNewsCategory() {
        return newsCategory;
    }

    public void setNewsCategory(String newsCategory) {
        this.newsCategory = newsCategory;
    }

    public String getNewsArticle() {
        return newsArticle;
    }

    public void setNewsArticle(String newsArticle) {
        this.newsArticle = newsArticle;
    }

    public String getNewsWebsite() {
        return newsWebsite;
    }

    public void setNewsWebsite(String newsWebsite) {
        this.newsWebsite = newsWebsite;
    }

	public News(){

	}

	public void finalize() throws Throwable {

	}

	/**
	 * 
	 * @param newsTitle
	 * @param newsCategory
	 * @param newsArticle
	 * @param newsWebsite
	 * @param newsID
	 */
	public void createNews(String newsTitle, String newsCategory, String newsArticle, String newsWebsite, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

            con = JDBCUtility.getCon();
            
        
            sqlStatement = "INSERT INTO news(newsTitle, newsCategory, newsArticle, newsWebsite) VALUES(?, ?, ?, ?)";
            boolean insertSuccess = false;
            
            try {
                //InputStream eventImage = part.getInputStream();
                preparedStatementInsert = con.prepareStatement(sqlStatement);


                preparedStatementInsert.setString(1, newsTitle);
                preparedStatementInsert.setString(2, newsCategory);
                preparedStatementInsert.setString(3, newsArticle);
                preparedStatementInsert.setString(4, newsWebsite);
                /*try (PrintWriter out = response.getWriter()) {
                    out.println(eventSponsor);
                }*/
                
                // execute insert SQL stetement
                preparedStatementInsert.executeUpdate();
                
                
                

                if (preparedStatementInsert != null)
                {
                    preparedStatementInsert.close();
                  
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
	 * @param newsID
	 */
	public void searchSavedNews(int newsID, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

            con = JDBCUtility.getCon();
            
            sqlStatement ="SELECT * FROM news WHERE (newsID = ?)";
            HttpSession session = request.getSession();
            
        
            ArrayList<News> newslist = new ArrayList<News>();
            News news = new News();  
            
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                preparedStatementInsert.setInt(1, newsID);
                
                ResultSet rs = preparedStatementInsert.executeQuery();
                
                while(rs.next())
                {
                    
                        newsID = rs.getInt("newsID");
                        newsTitle = rs.getString("newsTitle");
                        newsCategory = rs.getString("newsCategory");
                        newsArticle = rs.getString("newsArticle");
                        newsWebsite = rs.getString("newsWebsite");
   
                        newslist.add(new News(newsTitle, newsID, newsCategory, newsArticle, newsWebsite));
               }
                        session.setAttribute("newslistupdate", newslist);
                        preparedStatementInsert.close();
                        String opt=(String)session.getAttribute("opt");
                        if(opt.equals("NewsSeeMore"))
                        {
                            request.getRequestDispatcher("WEB-INF/event/jsp/ViewNewsInterface.jsp").forward(request, response);
                        }
                        else
                        {
                            request.getRequestDispatcher("WEB-INF/event/jsp/UpdateNewsInterface.jsp").forward(request, response);
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
	 * @param newsTitle
	 * @param newsCategory
	 * @param newsArticle
	 * @param newsWebsite
	 */
	public void updateSavedNews(int newsID, String newsTitle, String newsCategory, String newsArticle, String newsWebsite, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

            con = JDBCUtility.getCon();
        
            sqlStatement = "UPDATE news SET newsTitle = ?, newsCategory = ?, newsArticle = ?, newsWebsite = ? WHERE newsID = ?";
            
            try {
                //InputStream eventImage = part.getInputStream();
                preparedStatementInsert = con.prepareStatement(sqlStatement);
                
                preparedStatementInsert.setString(1, newsTitle);
                preparedStatementInsert.setString(2, newsCategory);
                preparedStatementInsert.setString(3, newsArticle);
                preparedStatementInsert.setString(4, newsWebsite);
                preparedStatementInsert.setInt(5, newsID);

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
	 * @param newsID
	 */
	public void deleteNews(int newsID, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
            
            con = JDBCUtility.getCon();
            
            sqlStatement ="DELETE FROM news WHERE (newsID = ?)";
            
            //boolean insertSuccess = false;

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                preparedStatementInsert.setInt(1, newsID);
                preparedStatementInsert.executeUpdate();
                
                if (preparedStatementInsert != null)
                {

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
                        
                
                /*for (int counter = 0; counter < events.size(); counter++) { 		      
		
                    event = events.get(counter);
                    session.setAttribute("event", event);

                    response.sendRedirect(request.getContextPath() + "/DeleteEventInterface.jsp");
                }*/
            }
            catch(SQLException ex) {
                System.out.println(ex.getMessage());
            }

	}

	public void searchAllSavedNews(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            con = JDBCUtility.getCon();
            
            sqlStatement ="SELECT * FROM news";
            HttpSession session = request.getSession();           
        
            ArrayList<News> newslist = new ArrayList<>();
            News news = new News(); 

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                
                ResultSet rs = preparedStatementInsert.executeQuery();
                
                while(rs.next())
                {
                    
                        newsID = rs.getInt("newsID");
                        newsTitle = rs.getString("newsTitle");
                       
                        newsCategory = rs.getString("newsCategory");
                        newsArticle = rs.getString("newsArticle");
                        newsWebsite = rs.getString("newsWebsite");
                    
   
                        newslist.add(new News(newsTitle, newsID, newsCategory, newsArticle,newsWebsite));
                }
                
                session.setAttribute("newslist", newslist);
                preparedStatementInsert.close();
                String opt=(String)session.getAttribute("opt");
                
                if(opt.equals("Update"))
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/DeleteNewsInterface.jsp").forward(request, response); 
                        }
                else if(opt.equals("Delete"))
                {
                    request.getRequestDispatcher("WEB-INF/event/jsp/DeleteNewsInterface.jsp").forward(request, response);                            
                }
                else if(opt.equals("View"))
                {
                    Charity charity=new Charity();
                    charity.searchAllSavedCharity(request, response);
                }
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
	}
        
         //heroku related
        public ArrayList<News> getAllSavedNews(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
           
            
            con = JDBCUtility.getCon();
            
            sqlStatement ="SELECT * FROM news";
            HttpSession session = request.getSession();           
        
            ArrayList<News> newslist = new ArrayList<>();
            News news = new News(); 

            try {
                
                preparedStatementInsert  = con.prepareStatement(sqlStatement);
                
                ResultSet rs = preparedStatementInsert.executeQuery();
                
                while(rs.next())
                {
                    
                        newsID = rs.getInt("newsID");
                        newsTitle = rs.getString("newsTitle");
                       
                        newsCategory = rs.getString("newsCategory");
                        newsArticle = rs.getString("newsArticle");
                        newsWebsite = rs.getString("newsWebsite");
                    
   
                        newslist.add(new News(newsTitle, newsID, newsCategory, newsArticle,newsWebsite));
                }
                
                session.setAttribute("newslist", newslist);
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
            
            return newslist;
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
        public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
            response.setContentType("text/html");
            try (PrintWriter out = response.getWriter()){
                ArrayList<News> news = getAllSavedNews(request, response);
                Gson gson = new Gson();
                String jsonString = gson.toJson(news);
                
                out.println(jsonString);
                
                out.close();
            }
        }
            
}
