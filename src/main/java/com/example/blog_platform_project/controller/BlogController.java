package com.example.blog_platform_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; // <--- CHANGE 1: Use @Controller for JSP/View rendering
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.blog_platform_project.entity.Comment;
import com.example.blog_platform_project.entity.Post;
import com.example.blog_platform_project.service.CommentServiceImpl;
import com.example.blog_platform_project.service.PostServiceImpl;

// CHANGE 2: Remove the "api" prefix if this controller is primarily for web pages, 
// otherwise keep it, but it's more common to use /app or just / for MVC controllers.
@Controller 
@RequestMapping("/") 
public class BlogController {

	@Autowired
	private PostServiceImpl postService;
	
	@Autowired
	private CommentServiceImpl commentService;
	
	@GetMapping("/posts")
	public ModelAndView getPosts() {
		ModelAndView view = new ModelAndView("postsUsingScriptlets");
		
		List<Post> listOfPosts = postService.findAllPosts();
		
		for(Post post : listOfPosts) {
			Long postId = post.getId();
			view.addObject("comment-" + postId, commentService.getAllCommentsOfPost(postId));
		}
		
		view.addObject("allPosts", listOfPosts);
		
		
				
		return view;
	}
	
	@GetMapping("/write")
	public ModelAndView writePost() {
		return new ModelAndView("writePost");
	}
	
	// CHANGE 3: Changed the mapping path. The method now handles a traditional form submission.
    // NOTE: This assumes the form fields match the Post properties.
	@PostMapping("/savePost")
	public ModelAndView savePost(@RequestBody Post post) { 
		postService.createPost(post);
        
        // Use a redirect to prevent double submission (best practice for POST)
		return new ModelAndView("redirect:/posts");
	}
	
	@PostMapping("/comments/{postId}")
	public ModelAndView saveComment(@RequestBody Comment comment, @PathVariable Long postId) {
		
		commentService.saveComment(comment, postId);
		
		return new ModelAndView("redirect:/comments/" + postId);
	}
	
	
	@GetMapping("/comments/{postId}")
	public ModelAndView getAllComments(@PathVariable Long postId) {
		ModelAndView view = new ModelAndView("commentsUsingScriptlets");
		
		List<Comment> listOfComments = commentService.getAllCommentsOfPost(postId);
		
		view.addObject("allComments", listOfComments);
		
		return view;
	}
	
	/*
	 {
		    "title": "Big News",
		    "content": "nothing",
		    "createdAt": "2025-11-06",
		    "updatedAt": "2025-11-06"
		}
	 */
    
    /* * OPTIONAL: If you want a dedicated REST API endpoint (returns JSON):
     * * @PostMapping("/api/posts")
     * @ResponseBody // Required if the class is NOT @RestController
     * public Post createPostApi(@RequestBody Post post) {
     * return postService.createPost(post);
     * }
     */
}