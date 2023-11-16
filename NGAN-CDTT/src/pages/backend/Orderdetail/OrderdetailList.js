import { useState, useEffect } from "react";
import { FaPlus, FaRegEye, FaEdit, FaTrash, FaTrashAlt } from 'react-icons/fa';
import { Link } from "react-router-dom";
import orderdetailservice from '../../../services/OrderdetailService';

function OrderdetailList() {
    const [statusdel, setStatusDel] = useState(0);
    const [orderdetails, setOrderdetails] = useState([]);

    useEffect(() => {
        {
            orderdetailservice.getAll().then((result) => {
                setOrderdetails(result.data.orderdetails);
            });
        }
    }, [statusdel])

    function orderdetailDelete(id) {
        orderdetailservice.sortdelete(id).then((result) => {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">DANH SÁCH CHI TIẾT ĐƠN HÀNG</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to={"/admin/orderdetail/trash"} className="btn btn-sm btn-danger me-2">
                            <FaTrashAlt /> Thùng rác
                        </Link>
                        <Link to="/admin/orderdetail/create" className="btn btn-sm btn-success">
                            <FaPlus /> Thêm
                        </Link>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 160 }} className="text-center">Order ID</th>
                            <th style={{ width: 130 }} className="text-center">Product ID</th>
                            <th style={{ width: 140 }} className="text-center">Giá tiền</th>
                            <th style={{ width: 140 }} className="text-center">Số lượng</th>
                            <th style={{ width: 140 }} className="text-center">Giảm Giá</th>
                            <th style={{ width: 140 }} className="text-center">Tổng tiền</th>
                            <th style={{ width: 140 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {orderdetails.map((orderdetail, index) =>
                            <tr key={index}>
                                <td className="text-center">{orderdetail.order_id}</td>
                                <td className="text-center">{orderdetail.product_id}</td>
                                <td className="text-center">{orderdetail.price}</td>
                                <td className="text-center">{orderdetail.qty}</td>
                                <td className="text-center">{orderdetail.discount}</td>
                                <td className="text-center">{orderdetail.amount}</td>
                                <td className="text-center">
                                    <Link to={`/admin/orderdetail/show/${orderdetail.id}`} className="btn btn-sm btn-primary me-1">
                                        <FaRegEye />
                                    </Link>
                                    <Link to={`/admin/orderdetail/update/${orderdetail.id}`} className="btn btn-sm btn-warning me-1">
                                        <FaEdit />
                                    </Link>
                                    <button onClick={() => orderdetailDelete(orderdetail.id)} className="btn btn-sm btn-danger me-1">
                                        <FaTrash />
                                    </button>
                                </td>
                                <td className="text-center">{orderdetail.id}</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default OrderdetailList;