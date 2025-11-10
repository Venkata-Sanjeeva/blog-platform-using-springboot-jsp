<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write a New Post</title>
<style>
    body {
        font-family: 'Inter', sans-serif;
        background-color: #f8f9fa;
        padding: 30px;
        color: #343a40;
    }
    .form-container {
        max-width: 700px;
        margin: 0 auto;
        background: #ffffff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }
    h1 {
        color: #007bff;
        margin-bottom: 25px;
        text-align: center;
        font-weight: 600;
    }
    label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: #495057;
    }
    input[type="text"], 
    input[type="date"], 
    textarea {
        width: 100%;
        padding: 12px;
        margin-bottom: 20px;
        border: 1px solid #ced4da;
        border-radius: 8px;
        box-sizing: border-box; /* Important for padding/width calculation */
        font-size: 16px;
    }
    textarea {
        resize: vertical;
        height: 200px;
    }
    button[type="submit"] {
        background-color: #28a745;
        color: white;
        padding: 12px 25px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 18px;
        transition: background-color 0.3s ease;
        display: block;
        width: 100%;
    }
    button[type="submit"]:hover {
        background-color: #218838;
    }
    .date-fields {
        display: flex;
        gap: 20px;
    }
    .date-fields > div {
        flex: 1;
    }
</style>
</head>
<body>

    <div class="form-container">
    	<a href="/posts">Back Home</a>
        <h1>🖊️ Publish New Post</h1>
        <form id="postForm">
        
            <!-- 1. Title -->
            <label for="title">Post Title</label>
            <input type="text" id="title" name="title" required placeholder="A catchy title for your post">

            <!-- 2. Content -->
            <label for="content">Post Content</label>
            <textarea id="content" name="content" required placeholder="Write your thoughts here..."></textarea>

            <div class="date-fields">
                <!-- 3. Created At -->
                <div>
                    <label for="createdAt">Created Date (Optional - Today is default)</label>
                    <!-- Note: For a real app, the server would set this date, not the client. -->
                    <input type="date" id="createdAt" name="createdAt">
                </div>

                <!-- 4. Updated At -->
                <div>
                    <label for="updatedAt">Update Date (Optional)</label>
                    <input type="date" id="updatedAt" name="updatedAt">
                </div>
            </div>
            
            <button type="submit">Create Post</button>
        </form>
    </div>

	<script>
	    document.addEventListener('DOMContentLoaded', () => {
	        // 1. Get a reference to the form element
	        const postForm = document.querySelector('form');
	
	        // 2. Attach an event listener for the 'submit' event
	        postForm.addEventListener('submit', function(event) {
	            // Stop the browser from submitting the form normally (and refreshing the page)
	            event.preventDefault();
	
	            // 3. Collect the data from the form fields
	            const postData = {
	                title: document.getElementById('title').value,
	                content: document.getElementById('content').value,
	                // Note: The dates will be sent as 'YYYY-MM-DD' strings
	                createdAt: document.getElementById('createdAt').value,
	                updatedAt: document.getElementById('updatedAt').value
	            };
	
	            // Log the data being sent (for debugging)
	            console.log('Sending Post Data:', postData);
	
	            // 4. Send the request to the server using the Fetch API
	            const saveUrl = "/savePost"; // Gets '/savePost'
	
	            fetch(saveUrl, {
	                method: 'POST',
	                // Important: Set the Content-Type header to let the server know
	                // the body is in JSON format. Your Spring/Java controller
	                // should be set up to accept a JSON payload (e.g., @RequestBody).
	                headers: {
	                    'Content-Type': 'application/json',
	                    // You may also need a CSRF token header depending on your setup
	                    // 'X-CSRF-TOKEN': document.querySelector('meta[name="_csrf"]').content
	                },
	                // Convert the JavaScript object to a JSON string
	                body: JSON.stringify(postData)
	            })
	            .then(response => {
	                // Check if the response status is successful (e.g., 200-299)
	                if (!response.ok) {
	                    // Throw an error to be caught by the .catch() block
	                    throw new Error(`HTTP error! status: ${response.status}`);
	                }
	                // Attempt to parse the response body as JSON.
	                // If the server returns no content (204 No Content), use response.text() or similar.
	                if(confirm("Post saved successfully!!!")) {
	                	window.location.href='/posts';
	                }
	            }).catch(error => {
	                // 6. Handle errors (network issues, server errors, etc.)
	                console.error('Error saving the post:', error);
	                alert('An error occurred while saving the post. Check the console for details.');
	            });
	        });
	    });
	</script>
</body>

</html>