package com.example.blog_platform_project.entity;

import java.sql.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Data;

@Entity
@Data
public class Post {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	
	String title;
	String content;
	Date createdAt;
	Date updatedAt;
	
	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL)
	List<Comment> comments;

	@Override
	public String toString() {
		return "Post [id=" + id + ", title=" + title + ", content=" + content + ", createdAt=" + createdAt
				+ ", updatedAt=" + updatedAt + ", comments=" + comments + "]";
	}
	
}
