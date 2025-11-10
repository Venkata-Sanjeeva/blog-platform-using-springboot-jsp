package com.example.blog_platform_project.entity;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@Entity
@Data
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	
	String text;
	Date createdAt;
	
	@ManyToOne
	@JsonIgnore
	Post post;

	@Override
	public String toString() {
	    // Only include the post's ID, not the entire 'post' object
	    Long postId = (post != null) ? post.getId() : null; 
	    
	    return "Comment [id=" + id + ", text=" + text + ", createdAt=" + createdAt + ", postId=" + postId + "]";
	}
	

}
