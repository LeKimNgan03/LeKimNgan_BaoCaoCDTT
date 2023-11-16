import { FaEdit, FaTrash } from 'react-icons/fa';
import { Link, useNavigate, useParams } from "react-router-dom";
import productsaleservice from '../../../services/ProductsaleService';
import { useEffect, useState } from 'react';

function ProductsaleShow() {
    const { id } = useParams("id");
    const navigate = useNavigate();
    const [productsale, setProductsale] = useState([]);
    useEffect(() => {
        {
            productsaleservice.getById(id).then((result) => {
                setProductsale(result.data.productsale);
            });
        }
    }, []);

    function productsaleDelete(id) {
        productsaleservice.sortdelete(id).then((result) => {
            alert(result.data.message);
            navigate('/admin/productsale', { replace: true })
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">CHI TIẾT SẢN PHẨM SALE</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/productsale" className="btn btn-sm btn-success me-1">Về Danh Sách</Link>
                        <Link to={`/admin/productsale/update/${productsale.id}`} className="btn btn-sm btn-warning me-1">
                            <FaEdit /> Sửa
                        </Link>
                        <button onClick={() => productsaleDelete(productsale.id)} className="btn btn-sm btn-danger me-1">
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
                        <tr><td>Mã Sản Phẩm</td><td>{productsale.product_id}</td></tr>
                        <tr><td>Giá Giảm</td><td>{productsale.pricesale}</td></tr>
                        <tr><td>Số Lượng</td><td>{productsale.qty}</td></tr>
                        <tr><td>Ngày Bắt đầu</td><td>{productsale.date_begin}</td></tr>
                        <tr><td>Ngày Kết thúc</td><td>{productsale.date_end}</td></tr>
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default ProductsaleShow;