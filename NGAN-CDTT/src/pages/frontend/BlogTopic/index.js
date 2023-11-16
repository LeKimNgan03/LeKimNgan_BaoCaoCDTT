import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import PostItem from "../../../components/frontend/postitem";
import postservice from "../../../services/PostService";
import topicservice from "../../../services/TopicService";

function BlogTopic() {
    const [posts, setPosts] = useState([]);
    const [title, setTitle] = useState("");
    const { slug } = useParams();

    useEffect(function () {
        (async function () {
            try {
                const infotopic = await topicservice.getById(slug);
                const topicid = infotopic.data.topic.id;
                setTitle(infotopic.data.topic.name);
                const infopost = await postservice.getPostTopicById(topicid);
                setPosts(infopost.data.posts);
            } catch (error) {
                console.error(error);
            }
        })();
    }, [slug]);

    return (
        <section className="main-content my-3">
            <div className="row">
                <h2 className="text-center pb-3">{title}</h2>
                <div className="row">
                    {posts.map((post, index) => <PostItem post={post} key={index} />)}
                </div>
            </div>
        </section>
    );
}

export default BlogTopic;