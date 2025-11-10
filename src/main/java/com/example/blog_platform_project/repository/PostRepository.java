package com.example.blog_platform_project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.blog_platform_project.entity.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Long>{

}
