package com.example.blog_platform_project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.blog_platform_project.entity.Post;
import com.example.blog_platform_project.repository.PostRepository;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	private PostRepository postRepo;
	
	@Override
	public Post createPost(Post post) {
		return postRepo.save(post);
	}

	@Override
	public List<Post> findAllPosts() {
		List<Post> listOfPosts = postRepo.findAll();
		return listOfPosts;
	}

	@Override
	public Post findById(Long id) {
		Optional<Post> optionalPost = postRepo.findById(id);
		if(optionalPost.isPresent()) {
			return optionalPost.get();
		}
		return null;
	}

	@Override
	public Post updateById(Long id, Post newPostData) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post deleteById(Long id) {
		Optional<Post> optionalPost = postRepo.findById(id);
		if(optionalPost.isPresent()) {
			Post post = optionalPost.get();
			
			postRepo.deleteById(id);
			
			return post;
		}
		return null;
	}
	
	
}
