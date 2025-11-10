<%@page import="com.example.blog_platform_project.entity.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%-- 
    This JSP simulates data being placed into the request scope by a Controller/Servlet, 
    key: "allComments".
--%>

<%
    // --- 1. SIMULATE MODEL DATA (as if from a Spring ModelAndView or Servlet) ---
    // In a real application, the Controller/Servlet would set this data:
    // modelAndView.addObject("allComments", commentsList);
	Object commentsObj = request.getAttribute("allComments");
    List<Comment> allComments = new ArrayList<>();
    
    if(commentsObj != null && commentsObj instanceof List) {
    	allComments = (List<Comment>) commentsObj;
    }
    

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Comments (Scriptlet JSP View)</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom font */
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-50 p-6 min-h-screen">

    <div class="max-w-3xl mx-auto bg-white shadow-xl rounded-lg p-8">
        <h1 class="text-3xl font-extrabold text-blue-600 mb-8 border-b-2 pb-3">
            💬 Post Comments
        </h1>
        
        <% 
            if (allComments != null && !allComments.isEmpty()) {
                // Loop through each comment in the list
                for (Comment comment : allComments) {
        %>
        
                    <div class="border border-gray-200 p-4 mb-4 rounded-lg bg-white hover:shadow-md transition duration-300">
                        <p class="text-gray-800 text-lg mb-2 leading-relaxed">
                            <%-- Print the comment text using an Expression Scriptlet --%>
                            <%= comment.getText() %>
                        </p>
                        <p class="text-sm text-gray-500 italic border-t pt-2 mt-3">
                            Posted on: **
                            <%-- Print the formatted date --%>
                            <%= comment.getCreatedAt() %>
                            **
                        </p>
                    </div>

        <%
                } // End of for loop
            } else {
        %>
                <div class="text-center py-10 bg-gray-100 rounded-lg">
                    <p class="text-xl text-gray-500 font-medium">No comments found for this post yet.</p>
                </div>
        <%
            } // End of if/else block
        %>

    </div>

</body>
</html>