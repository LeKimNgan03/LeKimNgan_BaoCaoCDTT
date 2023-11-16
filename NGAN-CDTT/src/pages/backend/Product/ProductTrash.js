import { useState, useEffect } from "react";
import { FaArrowLeft, FaTrashRestore, FaTrash } from 'react-icons/fa';
import { Link } from "react-router-dom";
import { urlImage } from '../../../config';
import productservice from '../../../services/ProductService';

function ProductList() {
    const [statusdel, setStatusDel] = useState(0);
    const [products, setProducts] = useState([]);

    useEffect(() => {
        {
            productservice.getTrash().then((result) => {
                setProducts(result.data.products);
            });
        }
    }, [statusdel])

    function productDelete(id) {
        productservice.remove(id).then((result) => {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }

    function restore(id) {
        productservice.restore(id).then((result) => {
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
                        <Link to="/admin/product" className="btn btn-sm btn-success">
                            <FaArrowLeft /> Quay Về
                        </Link>
                    </div>
                </div>
            </div>

            <div className="card-body ">
                <table className="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 30 }} className="text-center">#</th>
                            <th style={{ width: 150 }} className="text-center">Hình</th>
                            <th style={{ width: 180 }} className="text-center">Tên Sản Phẩm</th>
                            <th style={{ width: 150 }} className="text-center">Giá Tiền</th>
                            <th style={{ width: 130 }} className="text-center">Danh Mục</th>
                            <th style={{ width: 130 }} className="text-center">Thương Hiệu</th>
                            <th style={{ width: 140 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {products.map((product, index) => <tr key={index}>
                            <td className="text-center"><input type="checkbox" /></td>
                            <td className="text-center">
                                <img
                                    style={{ width: 150 }}
                                    className="img-fluid"
                                    src={`${urlImage}product/${product.image}`}
                                    alt={product.name} />
                            </td>
                            <td className="text-center">{product.name}</td>
                            <td className="text-center">{product.price}</td>
                            <td className="text-center">{product.category_id}</td>
                            <td className="text-center">{product.brand_id}</td>
                            <td className="text-center">
                                <button onClick={() => restore(product.id)} className="btn btn-sm btn-success me-1">
                                    <FaTrashRestore />
                                </button>
                                <button onClick={() => productDelete(product.id)} className="btn btn-sm btn-danger me-1">
                                    <FaTrash />
                                </button>
                            </td>
                            <td className="text-center">{product.id}</td>
                        </tr>)}
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default ProductList;