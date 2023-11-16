import { useState, useEffect } from "react";
import { FaArrowLeft, FaTrashRestore, FaTrash } from 'react-icons/fa';
import { Link } from "react-router-dom";
import productsaleservice from '../../../services/ProductsaleService';
import Moment from "react-moment";

function ProductsaleList() {
    const [statusdel, setStatusDel] = useState(0);
    const [productsales, setProductsales] = useState([]);

    useEffect(() => {
        {
            productsaleservice.getTrash().then((result) => {
                setProductsales(result.data.productsales);
            });
        }
    }, [statusdel])

    function productsaleDelete(id) {
        productsaleservice.remove(id).then((result) => {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }

    function restore(id) {
        productsaleservice.restore(id).then((result) => {
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
                        <Link to="/admin/productsale" className="btn btn-sm btn-success">
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
                            <th style={{ width: 150 }} className="text-center">Mã Sản Phẩm</th>
                            <th style={{ width: 150 }} className="text-center">Giá Giảm</th>
                            <th style={{ width: 90 }} className="text-center">Số Lượng</th>
                            <th style={{ width: 150 }} className="text-center">Ngày Bắt đầu</th>
                            <th style={{ width: 150 }} className="text-center">Ngày Kết thúc</th>
                            <th style={{ width: 150 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {productsales.map((productsale, index) =>
                            <tr key={index}>
                                <td className="text-center"><input type="checkbox" /></td>
                                <td className="text-center">{productsale.product_id}</td>
                                <td className="text-center">{productsale.pricesale}</td>
                                <td className="text-center">{productsale.qty}</td>
                                <td className="text-center">
                                    <Moment format="DD/MM/YYYY">{productsale.date_begin}</Moment>
                                </td>
                                <td className="text-center">
                                    <Moment format="DD/MM/YYYY">{productsale.date_end}</Moment>
                                </td>
                                <td className="text-center">
                                    <button onClick={() => restore(productsale.id)} className="btn btn-sm btn-success me-1">
                                        <FaTrashRestore />
                                    </button>
                                    <button onClick={() => productsaleDelete(productsale.id)} className="btn btn-sm btn-danger me-1">
                                        <FaTrash />
                                    </button>
                                </td>
                                <td className="text-center">{productsale.id}</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default ProductsaleList;