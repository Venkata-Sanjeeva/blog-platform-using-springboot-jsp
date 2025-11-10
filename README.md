📝 Blog Platform Project (Spring Boot + JSP/Scriptlets)This project implements a simple, full-stack blog platform using Spring Boot for the backend, JPA/Hibernate for persistence, and traditional JSP (with Scriptlets) for server-side rendering.

✨ FeaturesView All Posts: 
  Displays a list of all blog posts, along with their associated comments, on a single page (/posts).
  Create New Post: Provides a dedicated page for writing and submitting new blog entries (/write).
  Add Comments: Allows users to add comments to existing posts via an integrated form (handled by AJAX/Fetch API).
  Data Persistence: Uses an RDBMS (likely H2, MySQL, or Postgres) managed by Spring Data JPA to persist Post and Comment entities.  
  MVC Architecture: Follows the Model-View-Controller design pattern using Spring MVC.

🚀 Getting StartedThese instructions will get you a copy of the project up and running on your local machine for development and testing purposes.
  PrerequisitesJava Development Kit (JDK) 17+Maven (version 3.6.0+)Spring Boot CLI (Optional, but useful)
  An IDE (e.g., IntelliJ IDEA or VS Code with Spring extensions)

💻 Technical StackComponentTechnologyDescriptionBackend FrameworkSpring BootProvides quick setup and auto-configuration.
  Web LayerSpring MVCHandles routing, requests, and view rendering.TemplatingJSP (JavaServer Pages)
  Traditional server-side rendering for the UI.
  PersistenceSpring Data JPA / HibernateORM for mapping Java objects to the database.
  DatabaseConfigurable (Default likely H2)Relational Database Management System.
  DependenciesBootstrap 5Used for simple, responsive frontend styling.
  
🗺️ API Endpoints & ViewsThe application exposes the following key endpoints:
  URL PatternMethodPurposeView/Data Returned/posts
  GET  Home Page: View all posts and comments.postsUsingScriptlets.jsp/write
  GET  Display the post creation form.write
  Post.jsp/savePostPOSTSubmit data to create a new post.
  Redirects to /posts/comments/{postId}
  POST  Submit a new comment for a specific post (used by AJAX).
  Redirects (Internal use)
  
❗Implementation Notes (Scriptlet Usage)
  This project demonstrates a classical approach using JSP Scriptlets (<% ... %>) for server-side logic and iteration.
  Data Retrieval: The BlogController#getPosts method loads all posts and then, in an N+1 query pattern, loads comments separately for each post and adds them to the ModelAndView using unique keys (e.g., "comment-1", "comment-2").
  Frontend Logic: The postsUsingScriptlets.jsp uses scriptlets to iterate over the posts and their corresponding comment lists.
  
