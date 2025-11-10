<%@ page import="com.example.blog_platform_project.entity.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- Scriptlet to import List and the Post entity class --%>
<%@ page import="java.util.List, com.example.blog_platform_project.entity.Post" %><!DOCTYPE html>
<html>
<head>
    <title>All Blog Posts (Scriptlet Version)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
	    /* Custom styles for better post visualization (unchanged from yours) */
	    .post-card { /* Renamed from .post to .post-card for clarity */
	        border: 1px solid #ccc;
	        padding: 15px;
	        margin-bottom: 20px;
	        border-radius: 8px;
			box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Added shadow for card effect */
	    }
	    .post-card h3 {
	        color: #0d6efd; /* Use primary color for title */
	        margin-top: 0;
	        border-bottom: 2px solid #0d6efd;
	        padding-bottom: 5px;
	    }
	    .comment-text {
	    	/* Ensure comment text is readable */
	    	padding: 5px 0;
	    }
		.comment-text span {
			font-weight: bold;
			margin-right: 5px;
		}
	</style>
</head>
<body class="bg-light">
    <div class="container mt-4">
		
		<div class="row p-3 bg-white shadow-sm rounded">
    		<div class="col-8">
				<h1 class="text-primary d-inline">📰 Latest Blog Posts</h1>
				<span class="badge bg-secondary">Scriptlets</span>
			</div>
    		<div class="col-3 text-end">
				<a href="/write" class="btn btn-success btn-lg">✏️ Create a Post</a>
			</div>
    	</div>

    	<div class="row">
    	<%
	//1. Retrieve the attribute from the Model (request scope)
	// It's best practice to check if the object exists and is of the correct type.
	Object postsObject = request.getAttribute("allPosts");
	if (postsObject != null && postsObject instanceof List) {
		List<Post> allPosts = (List<Post>) postsObject;
		if (!allPosts.isEmpty()) {
			// 2. Iterate through the list using a standard Java loop
			for (Post post : allPosts) {
		%>
		<div class="col-md-12">
			<%-- Used post-card for custom styling --%>
            <div class="post-card card mb-4">
				<div class="card-body">
					<%-- 3. Use Scriptlet expression (<%= ... %>) to call getters --%>
				<h3 class="card-title mb-3"><%= post.getTitle().toUpperCase() %></h3>
				<div class="row g-2 align-items-start">
					<p class="col-10 card-text text-muted">
						<%String content = post.getContent();%>
						<%= Character.toUpperCase(content.charAt(0)) + "" + content.substring(1)%>
					</p>
					<p class="col-2 text-end small text-secondary">
						<small class="text-muted">Created:</small><br>
						<b><%= post.getCreatedAt() %></b>	
					</p>
				</div>
					<hr class="my-3">
				<%-- Comments Section --%>
					<div class="bg-light p-3 rounded mb-3">
									<h5 class="text-dark mb-2">Comments:</h5>
                					<%
						Object listOfCommentsObj = request.getAttribute("comment-" + post.getId());
					
						List<Comment> listOfComments = null;
					
						if(listOfCommentsObj != null && listOfCommentsObj instanceof List) {
							listOfComments = (List<Comment>) listOfCommentsObj;
						}
						if(listOfComments != null && !listOfComments.isEmpty()) {
					%>
							<ul class="list-unstyled">
							<% for(int index = 0; index < listOfComments.size(); index++) {
									Comment comment = listOfComments.get(index);
							%>
								<li class="comment-text small border-bottom pb-1 mb-1">
									<span><%= index + 1 %>.</span>
									<%= comment.getText() %>
									<b class="float-end text-success"><%= comment.getCreatedAt() %></b>
								</li>
							<%	}	// End of FOR LOOP %>
							</ul>
					<%
						}	// End of IF
						else {
					%>
							<p class="text-muted fst-italic">No Comments yet. Be the first to comment!</p>
					<%	} %>
				</div>
				
				<%-- Comment Input Form --%>
					<div class="input-group">
						<input type="text" class="form-control" id="comment-content-<%= post.getId() %>" placeholder="Write your comment..." data-post-id="<%= post.getId() %>" aria-label="Comment on post <%= post.getId() %>"/>
						<button class="btn btn-primary" onclick="saveComment(<%= post.getId() %>)">Send</button>
					</div>
				</div> <%-- End card-body --%>
            </div> <%-- End post-card --%>
		</div> <%-- End col-md-12 --%>
	    <%
			// The closing brace for the 'for (Post post : allPosts)' loop should be here:
			} // <-- CLOSES THE FOR LOOP (from line 127)
		%>
	    	</div> <%-- End row --%>
	        <p class="text-center py-3 bg-white rounded shadow-sm">
	            <i>
					Displaying a total of &nbsp;
						<b class="text-primary"><%= allPosts.size() %></b> &nbsp;
					posts.
				</i>
	        </p>
	
	    <%
	// This closes the 'if (!allPosts.isEmpty())' block:
		} else { // <-- This 'else' correctly relates to the 'if' on line 129
		%>
	                <p class="alert alert-info">There are no posts available at this time. Check back later!</p>
	    <%
		} // <-- CLOSES the 'if (!allPosts.isEmpty())' block
	// This closes the 'if (postsObject != null && postsObject instanceof List)' block:
	} else {
	%>
	            <p class="alert alert-danger">Error: 'allPosts' data not found in the model.</p>
	<%
	} // <-- CLOSES the outer 'if' block
	%>
    </div> <%-- End container --%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script>
    
    	async function saveComment(postId) {
    		// Changed query selector to target the specific input field using its generated ID
    		const commentInputField = document.getElementById("comment-content-" + postId);
    		
    		const cmtText = commentInputField.value.trim();
    		
    		if(cmtText.length == 0) {
    			alert("Comment is empty...");
    			return;
    		}
    		
    		
    		const cmtBody = {
   				"text": cmtText,
   				"createdAt": getFormattedDate()
	   		}
    		
    		await fetch("/comments/" + postId, {
    			method: "POST",
    			headers: {
    				'Content-Type': 'application/json'
    			},
    			body: JSON.stringify(cmtBody)
    		})
    		.then(res => {
    			if(res.ok) {
    				window.location.reload();
    			} else {
				// Handle potential API errors here
				alert("Failed to save comment. Status: " + res.status);
			}
    		})
    		.catch(err => console.error("Fetch Error:", err));
    	}
    	
    	function getFormattedDate(date = new Date()) {
			// 1. Get the year (e.g., 2025)
			const year = date.getFullYear();
	
			// 2. Get the month (0-indexed, so add 1) and pad with '0' if needed
			// e.g., 1 -> '01', 11 -> '11'
			const month = String(date.getMonth() + 1).padStart(2, '0');
			
			// 3. Get the day of the month and pad with '0' if needed
			// e.g., 7 -> '07', 25 -> '25'
			const day = String(date.getDate()).padStart(2, '0');
			
			// 4. Combine the parts into the YYYY-MM-DD format
			
			const today = year + "-" + month + "-" + day;
			
			console.log(today);
			return today;
   		}
    
    </script>
</body>
</html>