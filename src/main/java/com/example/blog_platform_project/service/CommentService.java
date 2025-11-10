package com.example.blog_platform_project.service;

import java.util.List;

import com.example.blog_platform_project.entity.Comment;

public interface CommentService {

	Comment saveComment(Comment comment, Long postId);
	
	Comment getCommentById(Long id);
	
	Comment deleteCommentById(Long id);
	
	List<Comment> getAllCommentsOfPost(Long postId);
}
