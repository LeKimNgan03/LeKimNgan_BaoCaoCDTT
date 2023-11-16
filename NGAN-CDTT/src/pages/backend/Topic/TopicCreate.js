import { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import topicservice from "../../../services/TopicService";
import { useNavigate } from "react-router-dom";

function TopicCreate() {
    const navigate = useNavigate();
    const [topics, setTopics] = useState([]);

    useEffect(() => {
        {
            topicservice.getAll().then((result) => {
                setTopics(result.data.topics);
            });
        }
    }, []);

    const [name, setName] = useState();
    const [parent_id, setParentId] = useState(0);
    const [metakey, setMetakey] = useState('');
    const [metadesc, setMetadesc] = useState('');
    const [status, setStatus] = useState(1);

    async function topicStore(event) {
        event.preventDefault();
        const topic = new FormData();
        topic.append("name", name);
        topic.append("parent_id", parent_id);
        topic.append("metakey", metakey);
        topic.append("metadesc", metadesc);
        topic.append("status", status);
        await topicservice.create(topic)
            .then((res) => {
                alert(res.data.message)
                navigate('/admin/topic', { replace: true })
            });
    }

    return (
        <form onSubmit={topicStore} method="topic">
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-dark">THÊM CHỦ ĐỀ</strong>
                        </div>
                        <div className="col-md-6 text-end">
                            <button type="submit" className="btn btn-sm btn-success me-1">Lưu</button>
                            <Link to="/admin/topic" className="btn btn-sm btn-info">Về Danh Sách</Link>
                        </div>
                    </div>
                </div>

                <div className="card-body">
                    <div className="row">
                        <div className="col-md-9 w-100">
                            <div className="mb-3">
                                <label htmlFor="name">Tên Chủ Đề</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={name}
                                    onChange={(e) => setName(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="parent_id">Danh Mục Cha</label>
                                <select
                                    name="parent_id"
                                    value={parent_id}
                                    className="form-control"
                                    onChange={(e) => setParentId(e.target.value)}>
                                    <option value="0">Danh Mục Cha</option>
                                    {topics.map((topic, index) => (
                                        <option key={index} value={topic.id}>{topic.name}</option>
                                    ))}
                                </select>
                            </div>
                        </div>

                        <div className="mb-3">
                            <label htmlFor="name">Từ Khóa</label>
                            <textarea
                                type="text"
                                name="name"
                                value={metakey}
                                onChange={(e) => setMetakey(e.target.value)}
                                className="form-control" />
                        </div>

                        <div className="mb-3">
                            <label htmlFor="name">Mô Tả</label>
                            <textarea
                                type="text"
                                name="name"
                                value={metadesc}
                                onChange={(e) => setMetadesc(e.target.value)}
                                className="form-control" />
                        </div>

                        <div className="mb-3">
                            <label htmlFor="sort">Trạng Thái</label>
                            <select
                                name="sort"
                                value={status}
                                className="form-control"
                                onChange={(e) => setStatus(e.target.value)}>
                                <option value="1">Xuất bản</option>
                                <option value="2">Chưa xuất bản</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    );
}

export default TopicCreate;