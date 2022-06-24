import React, { useState } from "react";

function NewPost({ currentUser, onAddPost }) {
  const [content, setContent] = useState("");

  function handleSubmit(e) {
    e.preventDefault();

    fetch("http://localhost:3000/posts", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        username: currentUser.username,
        body: content,
      }),
    })
      .then((r) => r.json())
      .then((newPost) => {
        onAddPost(newPost);
        setContent("");
      });
  }

  return (
    <form className="new-message" onSubmit={handleSubmit}>
      <input
        type="text"
        name="body"
        autoComplete="off"
        value={content}
        onChange={(e) => setContent(e.target.value)}
      />
      <button type="submit">Send</button>
    </form>
  );
}

export default NewPost;
