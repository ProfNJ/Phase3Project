import React, { useEffect, useState } from "react";
import Header from "./Header";
import Search from "./Search";
import PostList from "./PostList";
import NewPost from "./NewPost";

const testUser = { username: "_Glowreeyah" };

function App() {
  const [isDarkMode, setIsDarkMode] = useState(true);
  const [posts, setPosts] = useState([]);
  const [search, setSearch] = useState("");

  useEffect(() => {
    fetch("http://localhost:3000/posts")
      .then((r) => r.json())
      .then((posts) => setPosts(posts));
  }, []);

  function handleAddPost(newPost) {
    setPosts([...posts, newPost]);
  }

  function handleDeletePost(id) {
    const updatedPosts = posts.filter((post) => post.id !== id);
    setPosts(updatedPosts);
  }

  function handleUpdatePost(updatedPostObj) {
    const updatedPosts = posts.map((post) => {
      if (post.id === updatedPostObj.id) {
        return updatedPostObj;
      } else {
        return post;
      }
    });
    setPosts(updatedPosts);
  }

  const displayedPosts = posts.filter((post) =>
    post.body.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <main className={isDarkMode ? "dark-mode" : ""}>
      <Header isDarkMode={isDarkMode} onToggleDarkMode={setIsDarkMode} />
      <Search search={search} onSearchChange={setSearch} />
      <PostList
        posts={displayedPosts}
        currentUser={testUser}
        onPostDelete={handleDeletePost}
        onUpdatePost={handleUpdatePost}
      />
      <NewPost currentUser={testUser} onAddPost={handleAddPost} />
    </main>
  );
}

export default App;
