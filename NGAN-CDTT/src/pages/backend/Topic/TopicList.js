import { useEffect, useState } from 'react';
import { FaPlus, FaRegEye, FaEdit, FaTrash, FaTrashAlt } from 'react-icons/fa';
import { Link } from "react-router-dom";
import topicservice from '../../../services/TopicService';
import Moment from 'react-moment';

function TopicList() {
    const [statusdel, setStatusDel] = useState(0);
    const [topics, setTopics] = useState([]);

    useEffect(() => {
        {
            topicservice.getAll().then((result) => {
                setTopics(result.data.topics);
            });
        }
    }, [statusdel])

    function topicDelete(id) {
        topicservice.sortdelete(id).then((result) => {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">DANH SÁCH CHỦ ĐỀ</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to={"/admin/topic/trash"} className="btn btn-sm btn-danger me-2">
                            <FaTrashAlt /> Thùng rác
                        </Link>
                        <Link to="/admin/topic/create" className="btn btn-sm btn-success">
                            <FaPlus /> Thêm
                        </Link>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                            <th style={{ width: 200 }} className="text-center">Tên Chủ Đề</th>
                            <th style={{ width: 130 }} className="text-center">Ngày Tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {topics.map((topic, index) =>
                            <tr key={index}>
                                <td className="text-center"><input type="checkbox" /></td>
                                <td className="text-center">{topic.name}</td>
                                <td className="text-center">
                                    <Moment format="DD/MM/YYYY">{topic.created_at}</Moment>
                                </td>
                                <td className="text-center">
                                    <Link to={`/admin/topic/show/${topic.id}`} className="btn btn-sm btn-primary me-1">
                                        <FaRegEye />
                                    </Link>
                                    <Link to={`/admin/topic/update/${topic.id}`} className="btn btn-sm btn-warning me-1">
                                        <FaEdit />
                                    </Link>
                                    <button onClick={() => topicDelete(topic.id)} className="btn btn-sm btn-danger me-1">
                                        <FaTrash />
                                    </button>
                                </td>
                                <td className="text-center">{topic.id}</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default TopicList;