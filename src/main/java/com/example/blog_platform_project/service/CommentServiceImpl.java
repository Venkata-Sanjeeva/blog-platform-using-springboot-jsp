package com.example.blog_platform_project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.blog_platform_project.entity.Comment;
import com.example.blog_platform_project.entity.Post;
import com.example.blog_platform_project.repository.CommentRepository;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentRepository commentRepo;

	@Override
	public Comment saveComment(Comment comment, Long postId) {
		Post post = new Post();
		
		post.setId(postId);
		
		comment.setPost(post);
		
		return commentRepo.save(comment);
	}

	@Override
	public Comment getCommentById(Long id) {
		Optional<Comment> optionalComment = commentRepo.findById(id);
		
		if(optionalComment.isPresent()) {
			return optionalComment.get();
		}
		
		return null;
	}

	@Override
	public Comment deleteCommentById(Long id) {
		Optional<Comment> optionalComment = commentRepo.findById(id);
		
		if(optionalComment.isPresent()) {
			Comment comment = optionalComment.get();
			
			commentRepo.deleteById(id);
			
			return comment;
		}
		return null;
	}

	@Override
	public List<Comment> getAllCommentsOfPost(Long postId) {
		return commentRepo.findByPostId(postId);
	}

}
