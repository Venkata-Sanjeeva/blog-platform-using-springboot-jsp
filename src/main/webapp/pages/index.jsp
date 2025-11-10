<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.time.LocalDateTime, java.time.format.DateTimeFormatter, java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Today's Date and Time</title>
</head>
<body>
<%
    // Get the current date and time
    LocalDateTime now = LocalDateTime.now();
    
    // Define a professional format (e.g., Wednesday, November 5, 2025 at 11:53 AM)
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE, MMMM d, yyyy 'at' h:mm:ss a", Locale.ENGLISH);
    
    // Format the date and time
    String formattedDateTime = now.format(formatter);
%>
	
	<h1>Welcome!</h1>
    
    <p>
    	The current day and time is now 
    	<i><%= formattedDateTime %></i>
   	</p>
    
    <p>
    	The day is: <b><%= now.getDayOfWeek() %></b>
    </p>
    <a href='/posts'>Click to See Blog Posts</a>
    
</body>
</html>