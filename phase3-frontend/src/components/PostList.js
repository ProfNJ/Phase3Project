import React from "react";
import Post from "./Post";

function PostList({
  posts,
  currentUser,
  onPostDelete,
  onUpdatePost,
}) {
  return (
    <div className="list">
      <ul>
        {posts.map((post) => (
          <Post
            key={post.id}
            post={post}
            currentUser={currentUser}
            onPostDelete={onPostDelete}
            onUpdatePost={onUpdatePost}
          />
        ))}
      </ul>
    </div>
  );
}

export default PostList;
