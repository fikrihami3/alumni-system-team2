<%-- 
    Document   : AddNewsInterface
    Created on : Dec 29, 2020, 5:50:52 PM
    Author     : Amir Syafiq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!public interface AddNewsInterface {

	public void newsAddedConfirmation();

	/**
	 * 
	 * @param newsTitle
	 * @param newsCategory
	 * @param newsArticle
	 * @param newsWebsite
	 */
	public void addNewsData(String newsTitle, String newsCategory, String newsArticle, String newsWebsite);

	public void newsAddedFailed();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New News</title>
        <link rel='stylesheet' href='style.css'/>
        
        <jsp:include page="../../allModules/bootstrap4.jsp" />
        
        <style>
            .custom-shadow {
                box-shadow: rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            }
            .center {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .container-custom {
                display: block;
                margin-right: auto;
                margin-left: auto;
                width: 80%;
                padding: 10px 0 10px 150px;
            }
            .header-home {
                text-align: center;
            }
            @media only screen and (max-width: 600px) {.container-custom {padding-left: 10px; padding-top: 110px;}}
        </style>
    </head>
   <body>
        <%  if(session.getAttribute("user") != null) { %>

        <jsp:include page="../../allModules/sideNavigationBar.jsp" />
        
        <div class="container-custom">
            
            <nav class="navbar navbar-dark bg-dark">
                <div style="height:36px">
                    <p class="navbar-brand">ADD NEW NEWS</p>
                </div>
            </nav>
            
            <div class="jumbotron" style="padding-top:25px;padding-bottom: 0;">
                <!-- Header/Home -->
                <header class="header-home">
                    <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                    <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                </header>

    
    <% String message = (String)session.getAttribute("alertMsg");%>
    
    <% if(!message.equals("no")){ %>
        <script type="text/javascript">
        var msg = "<%=message%>";
        alert(msg);
    </script>
    <%}%>
  
        <form  name="AddNewsform" method="post" action="ManageNewsControl" enctype="multipart/form-data">
            <div class="container pb-5" style="margin-top:-30px;">
            <div class="row align-items-start justify-content-center"></div>
            <div class="row align-items-center pt-4">
                <div class="col">
                    <div class="card mb-2 bg-light text-dark" style="width: auto;">
                        <div class="card-body">
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">News Title</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Title of News" name="newsTitle" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">News Category</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Category of News" name="newsCategory" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">News Article</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Article of News" name="newsArticle" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">News Website</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Website Link of the News" name="newsWebsite" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-grid gap-2 mx-auto pt-2" style="width:250px;display: block;margin-right: auto;margin-left: auto;">
                        <input class="btn btn-warning" type="reset" id="buttonreset" name="buttonreset" value="Reset Form">
                        <input class=" btn btn-primary" type="submit" id="button4" name="button4" value="Add News">                                            
                    </div>
                    <div class="d-grid gap-2 mx-auto pt-2" style="width:150px;display: block;margin-right: auto;margin-left: auto;">
                        <a href="ManageNewsControl?option=News Menu" class="btn btn-success">News Menu</a>                                           
                    </div>
                </div>
            </div>
            </div>
    </form>
  </div>
</div>
    <jsp:include page="../../allModules/footer.jsp" />
<%  } %>
    </body>
</html>
