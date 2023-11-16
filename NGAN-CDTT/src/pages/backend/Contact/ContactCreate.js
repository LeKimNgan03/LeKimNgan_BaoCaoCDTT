import { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import contactservice from '../../../services/ContactService';

function ContactCreate() {
    const navigate = useNavigate();
    const [contact, setContact] = useState([]);

    useEffect(() => {
        {
            contactservice.getAll().then((result) => {
                setContact(result.data.contacts);
            });
        }
    }, []);

    const [name, setName] = useState("");
    const [email, setEmail] = useState("");
    const [content, setContent] = useState("");
    const [status, setStatus] = useState(1);

    async function contactStore(event) {
        event.preventDefault();
        const contact = new FormData();
        contact.append("name", name);
        contact.append("email", email);
        contact.append("content", content);
        contact.append("status", status);
        try {
            await contactservice.create(contact).then((res) => {
                alert(res.data.message);
                navigate("/admin/contact", { replace: true });
            });
        } catch (error) {
            console.error(error.response.data);
        }
    }

    return (
        <form onSubmit={contactStore} method="post">
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-dark">THÊM LIÊN HỆ</strong>
                        </div>
                        <div className="col-md-6 text-end">
                            <button type="submit" className="btn btn-sm btn-success me-1">Lưu</button>
                            <Link to="/admin/contact" className="btn btn-sm btn-info">Về Danh Sách</Link>
                        </div>
                    </div>
                </div>

                <div className="card-body">
                    <div className="row">
                        <div className="col-md-9 w-100">
                            <div className="mb-3">
                                <label htmlFor="name">Tên liên hệ</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={name}
                                    onChange={(e) => setName(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Email</label>
                                <input
                                    type="email"
                                    name="name"
                                    value={email}
                                    onChange={(e) => setEmail(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Nội dung</label>
                                <textarea
                                    type="text"
                                    name="name"
                                    value={content}
                                    onChange={(e) => setContent(e.target.value)}
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
            </div>
        </form>
    );
}

export default ContactCreate;