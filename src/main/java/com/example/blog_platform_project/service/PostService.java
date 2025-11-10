package com.example.blog_platform_project.service;

import java.util.List;

import com.example.blog_platform_project.entity.Post;

public interface PostService {
	
	Post createPost(Post post);
	
	List<Post> findAllPosts();
	
	Post findById(Long id);
	
	Post updateById(Long id, Post newPostData);
	
	Post deleteById(Long id);
}
