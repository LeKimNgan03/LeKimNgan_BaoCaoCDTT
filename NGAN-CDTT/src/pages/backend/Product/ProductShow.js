import { FaEdit, FaTrash } from 'react-icons/fa';
import { Link, useNavigate, useParams } from "react-router-dom";
import productservice from '../../../services/ProductService';
import { useEffect, useState } from 'react';
import { urlImage } from '../../../config';

function ProductShow() {
    const { id } = useParams("id");
    const navigate = useNavigate();
    const [product, setProduct] = useState([]);
    useEffect(() => {
        {
            productservice.getById(id).then((result) => {
                setProduct(result.data.product);
            });
        }
    }, []);

    function productDelete(id) {
        productservice.sortdelete(id).then((result) => {
            alert(result.data.message);
            navigate('/admin/product', { replace: true })
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">CHI TIẾT SẢN PHẨM</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/product" className="btn btn-sm btn-success me-1">Về Danh Sách</Link>
                        <Link to={`/admin/product/update/${product.id}`} className="btn btn-sm btn-warning me-1">
                            <FaEdit /> Sửa
                        </Link>
                        <button onClick={() => productDelete(product.id)} className="btn btn-sm btn-danger me-1">
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
                        <tr><td>Danh Mục</td><td>{product.category_id}</td></tr>
                        <tr><td>Thương Hiệu</td><td>{product.brand_id}</td></tr>
                        <tr><td>Tên Sản Phẩm</td><td>{product.name}</td></tr>
                        <tr><td>Slug</td><td>{product.slug}</td></tr>
                        <tr><td>Hình</td><td><img
                            style={{ width: 200 }}
                            className="img-fluid"
                            src={`${urlImage}product/${product.image}`}
                            alt={product.name} /></td></tr>
                        <tr><td>Giá Tiền</td><td>{product.price}</td></tr>
                        <tr><td>Giá Giảm</td><td>{product.pricesale}</td></tr>
                        <tr><td>Số Lượng</td><td>{product.qty}</td></tr>
                        <tr><td>Chi Tiết</td><td>{product.detail}</td></tr>
                        <tr><td>Từ Khóa</td><td>{product.metakey}</td></tr>
                        <tr><td>Mô Tả</td><td>{product.metadesc}</td></tr>
                        <tr><td>Trạng Thái</td><td>{product.status}</td></tr>
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default ProductShow;