import { useEffect, useState } from "react";
import postservice from "../../../services/PostService";
import PostItem from "../../../components/frontend/postitem";

function Blog() {
    const [posts, setPosts] = useState([]);
    useEffect(() => {
        {
            postservice.getAll().then((result) => {
                setPosts(result.data.posts);
            });
        }
    }, [])

    return (
        <div className="">
            <h4 className="p-3 pb-0 fw-light text-uppercase">Bài viết</h4>

            <hr className="mx-3" />

            <div className="row">
                {posts.map((post, index) => <PostItem post={post} key={index} />)}
            </div>
        </div>
    );
}

export default Blog;