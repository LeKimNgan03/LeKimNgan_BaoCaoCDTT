import { FaEdit, FaTrash } from 'react-icons/fa';
import { Link, useNavigate, useParams } from "react-router-dom";
import orderdetailservice from '../../../services/OrderdetailService';
import { useEffect, useState } from 'react';

function OrderdetailShow() {
    const { id } = useParams("id");
    const navigate = useNavigate();
    const [orderdetail, setOrderdetail] = useState([]);

    useEffect(() => {
        {
            orderdetailservice.getById(id).then((result) => {
                setOrderdetail(result.data.orderdetail);
            });
        }
    }, []);

    function orderdetailDelete(id) {
        orderdetailservice.sortdelete(id).then((result) => {
            alert(result.data.message);
            navigate('/admin/orderdetail', { replace: true })
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">CHI TIẾT ĐƠN HÀNG</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/orderdetail" className="btn btn-sm btn-success me-1">Về Danh Sách</Link>
                        <Link to={`/admin/orderdetail/update/${orderdetail.id}`} className="btn btn-sm btn-warning me-1">
                            <FaEdit /> Sửa
                        </Link>
                        <button onClick={() => orderdetailDelete(orderdetail.id)} className="btn btn-sm btn-danger me-1">
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
                        <tr><td>ID Đơn Hàng</td><td>{orderdetail.order_id}</td></tr>
                        <tr><td>ID Sản Phẩm</td><td>{orderdetail.product_id}</td></tr>
                        <tr><td>Giá tiền</td><td>{orderdetail.price}</td></tr>
                        <tr><td>Số lượng</td><td>{orderdetail.qty}</td></tr>
                        <tr><td>Giảm Giá</td><td>{orderdetail.discount}</td></tr>
                        <tr><td>Tổng Giá Trị</td><td>{orderdetail.amount}</td></tr>
                        <tr><td>Ghi Chú</td><td>{orderdetail.note}</td></tr>
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default OrderdetailShow;