import { useState, useEffect } from 'react';
import { FaArrowLeft, FaTrashRestore, FaTrash } from 'react-icons/fa';
import { Link } from "react-router-dom";
import policyservice from "../../../services/PolicyService";
import TextTruncate from 'react-text-truncate';

function PolicyList() {
    const [statusdel, setStatusDel] = useState(0);
    const [policies, setPolicies] = useState([]);

    useEffect(() => {
        {
            policyservice.getTrash().then((result) => {
                setPolicies(result.data.policies);
            });
        }
    }, [statusdel])

    function policyDelete(id) {
        policyservice.remove(id).then((result) => {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }

    function restore(id) {
        policyservice.restore(id).then((result) => {
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
                        <Link to="/admin/policy" className="btn btn-sm btn-success">
                            <FaArrowLeft /> Quay Về
                        </Link>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 30 }} className="text-center">#</th>
                            <th style={{ width: 100 }} className="text-center">Tiêu Đề</th>
                            <th style={{ width: 140 }} className="text-center">Tiêu Đề Phụ</th>
                            <th style={{ width: 230 }} className="text-center">Mô tả</th>
                            <th style={{ width: 80 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {policies.map((policy, index) =>
                            <tr key={index}>
                                <td className="text-center"><input type="checkbox" /></td>
                                <td className="text-center">{policy.title}</td>
                                <td className="text-center">
                                    <TextTruncate
                                        text={policy.subtitle}
                                        maxLength={200}
                                        ellipsis="..."
                                    />
                                </td>
                                <td className="text-center">
                                    <TextTruncate
                                        text={policy.detail}
                                        maxLength={200}
                                        ellipsis="..."
                                    />
                                </td>
                                <td className="text-center">
                                    <button onClick={() => restore(policy.id)} className="btn btn-sm btn-success me-1">
                                        <FaTrashRestore />
                                    </button>
                                    <button onClick={() => policyDelete(policy.id)} className="btn btn-sm btn-danger me-1">
                                        <FaTrash />
                                    </button>
                                </td>
                                <td className="text-center">{policy.id}</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default PolicyList;