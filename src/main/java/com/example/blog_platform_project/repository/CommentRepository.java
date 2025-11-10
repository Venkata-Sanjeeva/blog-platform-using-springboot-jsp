package com.example.blog_platform_project.repository;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.blog_platform_project.entity.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long>{
	
	List<Comment> findByPostId(Long id);
}
