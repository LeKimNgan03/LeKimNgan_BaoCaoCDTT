import { FaEdit, FaTrash } from 'react-icons/fa';
import { Link, useNavigate, useParams } from "react-router-dom";
import orderservice from '../../../services/OrderService';
import { useEffect, useState } from 'react';

function OrderShow() {
    const { id } = useParams("id");
    const navigate = useNavigate();
    const [order, setOrder] = useState([]);

    useEffect(() => {
        {
            orderservice.getById(id).then((result) => {
                setOrder(result.data.order);
            });
        }
    }, []);

    function orderDelete(id) {
        orderservice.sortdelete(id).then((result) => {
            alert(result.data.message);
            navigate('/admin/order', { replace: true })
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">ĐƠN HÀNG</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/order" className="btn btn-sm btn-success me-1">Về Danh Sách</Link>
                        <Link to={`/admin/order/update/${order.id}`} className="btn btn-sm btn-warning me-1">
                            <FaEdit /> Sửa
                        </Link>
                        <button onClick={() => orderDelete(order.id)} className="btn btn-sm btn-danger me-1">
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
                        <tr><td>ID Người Dùng</td><td>{order.user_id}</td></tr>
                        <tr><td>Tên Đơn Hàng</td><td>{order.delivery_name}</td></tr>
                        <tr><td>Đơn Hàng</td><td>{order.delivery_gender}</td></tr>
                        <tr><td>Email</td><td>{order.delivery_email}</td></tr>
                        <tr><td>Điện Thoại</td><td>{order.delivery_phone}</td></tr>
                        <tr><td>Địa Chỉ</td><td>{order.delivery_address}</td></tr>
                        <tr><td>Ghi Chú</td><td>{order.note}</td></tr>
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default OrderShow;