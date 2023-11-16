import { useEffect, useState } from "react";
import { Link, useParams, useNavigate } from "react-router-dom";
import orderservice from '../../../services/OrderService';
import userservice from "../../../services/UserService";

function OrderUpdate() {
    const [users, setUsers] = useState([]);
    useEffect(() => {
        {
            userservice.getAll().then((result) => {
                setUsers(result.data.users);
            });
        }
    }, []);

    const navigate = useNavigate();
    const [user_id, setUserId] = useState(0);
    const [delivery_name, setDeliName] = useState('');
    const [delivery_gender, setDeliGender] = useState('');
    const [delivery_email, setDeliEmail] = useState('');
    const [delivery_phone, setDeliPhone] = useState();
    const [delivery_address, setDeliAddress] = useState('');
    const [note, setNote] = useState('');

    const { id } = useParams("id");

    useEffect(() => {
        {
            orderservice.getById(id).then((result) => {
                const tmp = result.data.order;
                setUserId(tmp.user_id);
                setDeliName(tmp.delivery_name);
                setDeliGender(tmp.delivery_gender);
                setDeliEmail(tmp.delivery_email);
                setDeliPhone(tmp.delivery_phone);
                setDeliAddress(tmp.delivery_address);
                setNote(tmp.note);
            });
        }
    }, []);

    //Lấy danh sách
    const [orders, setOrders] = useState([]);
    useEffect(() => {
        {
            orderservice.getAll().then((result) => {
                setOrders(result.data.orders);
            });
        }
    }, []);

    async function orderEdit(event) {
        event.preventDefault();
        const order = new FormData();
        order.append("user_id", user_id);
        order.append("delivery_name", delivery_name);
        order.append("delivery_gender", delivery_gender);
        order.append("delivery_email", delivery_email);
        order.append("delivery_phone", delivery_phone);
        order.append("delivery_address", delivery_address);
        order.append("note", note);
        await orderservice.update(order, id)
            .then((res) => {
                alert(res.data.message)
                navigate('/admin/order', { replace: true })
            });
    }

    return (
        <form onSubmit={orderEdit} method="post">
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-dark">CẬP NHẬT ĐƠN HÀNG</strong>
                        </div>
                        <div className="col-md-6 text-end">
                            <button type="submit" className="btn btn-sm btn-success me-1"> Lưu</button>
                            <Link to="/admin/order" className="btn btn-sm btn-info">Về Danh Sách</Link>
                        </div>
                    </div>
                </div>

                <div className="card-body">
                    <div className="row">
                        <div className="col-md-6">
                            <div className="mb-3">
                                <label htmlFor="user_id">Người Dùng</label>
                                <select
                                    name="user_id"
                                    value={user_id}
                                    className="form-control"
                                    onChange={(e) => setUserId(e.target.value)}>
                                    <option value="0">None</option>
                                    {users.map((user, index) => (
                                        <option key={index} value={user.id}>{user.name}</option>
                                    ))}
                                </select>
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Tên Đơn Hàng</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={delivery_name}
                                    onChange={(e) => setDeliName(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Đơn Hàng</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={delivery_gender}
                                    onChange={(e) => setDeliGender(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Email</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={delivery_email}
                                    onChange={(e) => setDeliEmail(e.target.value)}
                                    className="form-control" />
                            </div>
                        </div>

                        <div className="col-md-6">
                            <div className="mb-3">
                                <label htmlFor="name">Địa chỉ</label>
                                <textarea
                                    type="text"
                                    name="name"
                                    value={delivery_address}
                                    onChange={(e) => setDeliAddress(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Số Điện Thoại</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={delivery_phone}
                                    onChange={(e) => setDeliPhone(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Ghi Chú</label>
                                <textarea
                                    type="text"
                                    name="name"
                                    value={note}
                                    rows={4}
                                    onChange={(e) => setNote(e.target.value)}
                                    className="form-control" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    );
}

export default OrderUpdate;