import React, { useState } from "react";
import EditPost from "./EditPost";

function Post({ post, currentUser, onPostDelete, onUpdatePost }) {
  const [isEditing, setIsEditing] = useState(false);

  const { id, username, content, date } = post;

  const timestamp = new Date(date).toLocaleTimeString();

  const isCurrentUser = currentUser.username === username;

  function handleDeleteClick() {
    fetch(`http://localhost:3000/posts/${id}`, {
      method: "DELETE",
    });

    onPostDelete(id);
  }

  function handleUpdatePost(updatedPost) {
    setIsEditing(false);
    onUpdatePost(updatedPost);
  }

  return (
    <li>
      <span className="user">{username}</span>
      <span className="time">{timestamp}</span>
      {isEditing ? (
        <EditPost
          id={id}
          content={content}
          onUpdatePost={handleUpdatePost}
        />
      ) : (
        <p>{content}</p>
      )}
      {isCurrentUser ? (
        <div className="actions">
          <button onClick={() => setIsEditing((isEditing) => !isEditing)}>
            <span role="img" aria-label="edit">
              ✏️
            </span>
          </button>
          <button onClick={handleDeleteClick}>
            <span role="img" aria-label="delete">
              🗑
            </span>
          </button>
        </div>
      ) : null}
    </li>
  );
}

export default Post;
