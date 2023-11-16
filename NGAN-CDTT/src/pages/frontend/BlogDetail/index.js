import { useEffect, useState } from "react";
import postservice from "../../../services/PostService";
import PostItem from "../../../components/frontend/postitem";
import { useParams } from "react-router-dom";
import { urlImage } from "../../../config";

function BlogDetail() {
    const { id } = useParams();
    const [post, setPosts] = useState([]);
    const [post_other, setPostOther] = useState([]);

    useEffect(() => {
        {
            postservice.getPostById(id).then((result) => {
                if (result.data.success === true) {
                    setPosts(result.data.post);
                    setPostOther(result.data.post_other);
                }
            });
        }
    }, [id])

    return (
        <section className="main-content my-3">
            <div className="mx-3">
                <h3 className="pb-0 fw-light text-uppercase">{post.title}</h3>
                <hr />
                <h5>{post.type}</h5>
                <p>{post.detail}</p>
                <img
                    style={{ width: 1300, height: 510 }}
                    src={`${urlImage}post/${post.image}`}
                    className="container img-fluid d-flex justify-content-center my-3"
                    alt={post.image} />
                <h5>{post.metakey}</h5>
                <p>{post.metadesc}</p>

                {/* Other posts */}
                <h3 className="p-3 pb-0 fw-light text-uppercase">Bài viết liên quan</h3>
                <hr className="mx-3" />
                <div className="row">
                    {post_other.map((post, index) => <PostItem post={post} key={index} />)}
                </div>
            </div>
        </section>
    );
}

export default BlogDetail;