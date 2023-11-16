import { useState, useEffect } from 'react';
import { FaArrowLeft, FaTrashRestore, FaTrash } from 'react-icons/fa';
import { Link } from "react-router-dom";
import postservice from '../../../services/PostService';
import { urlImage } from '../../../config';
import TextTruncate from 'react-text-truncate';

function PostList() {
    const [statusdel, setStatusDel] = useState(0);
    const [posts, setPosts] = useState([]);

    useEffect(() => {
        {
            postservice.getTrash().then((result) => {
                setPosts(result.data.posts);
            });
        }
    }, [statusdel])

    function postDelete(id) {
        postservice.remove(id).then((result) => {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }

    function restore(id) {
        postservice.restore(id).then((result) => {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">THÙNG RÁC</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/post" className="btn btn-sm btn-success">
                            <FaArrowLeft /> Quay Về
                        </Link>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                            <th style={{ width: 150 }} className="text-center">Tiêu Đề</th>
                            <th style={{ width: 200 }} className="text-center">Hình </th>
                            <th style={{ width: 180 }} className="text-center">Mô tả</th>
                            <th style={{ width: 100 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {posts.map((post, index) => <tr key={index}>
                            <td className="text-center"><input type="checkbox" /></td>
                            <td className="text-center">{post.title}</td>
                            <td className="text-center">
                                <img
                                    style={{ width: 260 }}
                                    className="img-fluid"
                                    src={`${urlImage}post/${post.image}`}
                                    alt={post.title} />
                            </td>
                            <td className="text-center">
                                <TextTruncate
                                    text={post.detail}
                                    maxLength={200}
                                    ellipsis="..."
                                />
                            </td>
                            <td className="text-center">
                                <button onClick={() => restore(post.id)} className="btn btn-sm btn-success me-1">
                                    <FaTrashRestore />
                                </button>
                                <button onClick={() => postDelete(post.id)} className="btn btn-sm btn-danger me-1">
                                    <FaTrash />
                                </button>
                            </td>
                            <td className="text-center">{post.id}</td>
                        </tr>)}
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default PostList;