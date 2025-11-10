<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Blog Posts</title>
<style>
    /* Basic styling for readability */
    .post {
        border: 1px solid #ccc;
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 8px;
    }
    .post h2 {
        color: #333;
        margin-top: 0;
    }
    .post p.author {
        font-style: italic;
        color: #666;
        margin-bottom: 10px;
    }
    .post p.content {
        line-height: 1.6;
    }
</style>
</head>
<body>
    
    <h1>📰 Latest Posts</h1>
    
    <c:if test="${not empty allPosts}">
        
        <c:forEach items="${allPosts}" var="post">
            <div class="post">
                <h2>${post.title}</h2>
                <p class="content">${post.content}</p>
                <p class="createdAt">${post.createdAt}</p>
            </div>
        </c:forEach>
        
        <p>
        	<i>
        		Displaying a total of
        			<b>${allPosts.size()}</b>
        		posts.
       		</i>
    	</p>
        
    </c:if>
    
    <c:if test="${empty allPosts}">
        <p>There are no posts available at this time. Check back later!</p>
    </c:if>
    
</body>
</html>