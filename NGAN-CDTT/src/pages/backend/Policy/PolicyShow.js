import { FaEdit, FaTrash } from 'react-icons/fa';
import { Link, useNavigate, useParams } from "react-router-dom";
import policyservice from "../../../services/PolicyService";
import { useEffect, useState } from 'react';

function PolicyShow() {
    const { id } = useParams("id");
    const navigate = useNavigate();
    const [policy, setPolicy] = useState([]);
    useEffect(() => {
        {
            policyservice.getById(id).then((result) => {
                setPolicy(result.data.policy);
            });
        }
    }, []);

    function policyDelete(id) {
        policyservice.sortdelete(id).then((result) => {
            alert(result.data.message);
            navigate('/admin/policy', { replace: true })
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">CHI TIẾT TRANG ĐƠN</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/policy" className="btn btn-sm btn-success me-1">Về Danh Sách</Link>
                        <Link to={`/admin/policy/update/${policy.id}`} className="btn btn-sm btn-warning me-1">
                            <FaEdit /> Sửa
                        </Link>
                        <button onClick={() => policyDelete(policy.id)} className="btn btn-sm btn-danger me-1">
                            <FaTrash /> Xóa
                        </button>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table table-striped table-bposted table-hover">
                    <thead>
                        <tr>
                            <td className="text-dark" style={{ width: 300 }}><strong>Tên Trường</strong></td>
                            <td className="text-dark"><strong>Giá Trị</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>ID</td><td>{id}</td></tr>
                        <tr><td>Tiêu Đề</td><td>{policy.title}</td></tr>
                        <tr><td>Tiêu Đề Phụ</td><td>{policy.subtitle}</td></tr>
                        <tr><td>Mô tả</td><td>{policy.detail}</td></tr>
                        <tr><td>Trạng Thái</td><td>{policy.status}</td></tr>
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default PolicyShow;