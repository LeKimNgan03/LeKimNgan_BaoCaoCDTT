import { FaEdit, FaTrash } from 'react-icons/fa';
import { Link, useNavigate, useParams } from "react-router-dom";
import topicservice from '../../../services/TopicService';
import { useEffect, useState } from 'react';

function TopicShow() {
    const { id } = useParams("id");
    const navigate = useNavigate();
    const [topic, setTopic] = useState([]);

    useEffect(() => {
        {
            topicservice.getById(id).then((result) => {
                setTopic(result.data.topic);
            });
        }
    }, []);

    function topicDelete(id) {
        topicservice.sortdelete(id).then((result) => {
            alert(result.data.message);
            navigate('/admin/topic', { replace: true })
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">CHI TIẾT CHỦ ĐỀ</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/topic" className="btn btn-sm btn-success me-1">Về Danh Sách</Link>
                        <Link to={`/admin/topic/update/${topic.id}`} className="btn btn-sm btn-warning me-1">
                            <FaEdit /> Sửa
                        </Link>
                        <button onClick={() => topicDelete(topic.id)} className="btn btn-sm btn-danger me-1">
                            <FaTrash /> Xóa
                        </button>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <td className="text-dark" style={{ width: 300 }}><strong>Tên Trường</strong></td>
                            <td className="text-dark"><strong>Giá Trị</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>ID</td><td>{id}</td></tr>
                        <tr><td>Tên Chủ Đề</td><td>{topic.name}</td></tr>
                        <tr><td>Slug</td><td>{topic.slug}</td></tr>
                        <tr><td>Từ Khóa</td><td>{topic.metakey}</td></tr>
                        <tr><td>Mô Tả</td><td>{topic.metadesc}</td></tr>
                        <tr><td>Trạng Thái</td><td>{topic.status}</td></tr>
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default TopicShow;