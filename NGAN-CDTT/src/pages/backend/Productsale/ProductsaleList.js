import { useState, useEffect } from "react";
import { FaPlus, FaRegEye, FaEdit, FaTrash, FaTrashAlt } from 'react-icons/fa';
import { Link } from "react-router-dom";
import productsaleservice from '../../../services/ProductsaleService';
import Moment from "react-moment";

function ProductsaleList() {
    const [statusdel, setStatusDel] = useState(0);
    const [productsales, setProductsales] = useState([]);

    useEffect(() => {
        {
            productsaleservice.getAll().then((result) => {
                setProductsales(result.data.productsales);
            });
        }
    }, [statusdel])

    function productsaleDelete(id) {
        productsaleservice.sortdelete(id).then((result) => {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">DANH SÁCH SẢN PHẨM SALE</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to={"/admin/productsale/trash"} className="btn btn-sm btn-danger me-2">
                            <FaTrashAlt /> Thùng rác
                        </Link>
                        <Link to="/admin/productsale/create" className="btn btn-sm btn-success">
                            <FaPlus /> Thêm
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
                                    <Link to={`/admin/productsale/show/${productsale.id}`} className="btn btn-sm btn-primary me-1">
                                        <FaRegEye />
                                    </Link>
                                    <Link to={`/admin/productsale/update/${productsale.id}`} className="btn btn-sm btn-warning me-1">
                                        <FaEdit />
                                    </Link>
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