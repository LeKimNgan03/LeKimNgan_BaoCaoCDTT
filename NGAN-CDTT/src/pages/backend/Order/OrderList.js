import { useState, useEffect } from "react";
import { FaPlus, FaRegEye, FaEdit, FaTrash, FaTrashAlt } from 'react-icons/fa';
import { Link } from "react-router-dom";
import orderservice from '../../../services/OrderService';
import Moment from "react-moment";

function OrderList() {
    const [statusdel, setStatusDel] = useState(0);
    const [orders, setOrders] = useState([]);

    useEffect(() => {
        {
            orderservice.getAll().then((result) => {
                setOrders(result.data.orders);
            });
        }
    }, [statusdel])

    function orderDelete(id) {
        orderservice.sortdelete(id).then((result) => {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">DANH SÁCH ĐƠN HÀNG</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to={"/admin/order/trash"} className="btn btn-sm btn-danger me-2">
                            <FaTrashAlt /> Thùng rác
                        </Link>
                        <Link to="/admin/order/create" className="btn btn-sm btn-success">
                            <FaPlus /> Thêm
                        </Link>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 120 }} className="text-center">Tên Liên Hệ</th>
                            <th style={{ width: 120 }} className="text-center">Tên Đơn Hàng</th>
                            <th style={{ width: 130 }} className="text-center">Email</th>
                            <th style={{ width: 130 }} className="text-center">Điện Thoại</th>
                            <th style={{ width: 130 }} className="text-center">Địa Chỉ</th>
                            <th style={{ width: 130 }} className="text-center">Ngày Đặt</th>
                            <th style={{ width: 140 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {orders.map((order, index) =>
                            <tr key={index}>
                                <td className="text-center">{order.user_id}</td>
                                <td className="text-center">{order.delivery_name}</td>
                                <td className="text-center">{order.delivery_email}</td>
                                <td className="text-center">{order.delivery_phone}</td>
                                <td className="text-center">{order.delivery_address}</td>
                                <td className="text-center">
                                    <Moment format="DD/MM/YYYY">{order.created_at}</Moment>
                                </td>
                                <td className="text-center">
                                    <Link to={`/admin/order/show/${order.id}`} className="btn btn-sm btn-primary me-1">
                                        <FaRegEye />
                                    </Link>
                                    <Link to={`/admin/order/update/${order.id}`} className="btn btn-sm btn-warning me-1">
                                        <FaEdit />
                                    </Link>
                                    <button onClick={() => orderDelete(order.id)} className="btn btn-sm btn-danger me-1">
                                        <FaTrash />
                                    </button>
                                </td>
                                <td className="text-center">{order.id}</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default OrderList;