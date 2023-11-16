import { useEffect, useState } from 'react';
import { FaPlus, FaEdit, FaTrashAlt } from 'react-icons/fa';
import { BsFillEyeFill, BsFillTrashFill } from "react-icons/bs";
import { Link } from "react-router-dom";
import brandservice from '../../../services/BrandService';
import { urlImage } from '../../../config';
import Moment from 'react-moment';

function BrandList() {
    const [statusde, setStatusDelete] = useState(0);
    const [brands, setBrands] = useState([]);

    useEffect(() => {
        {
            brandservice.getAll().then((result) => {
                setBrands(result.data.brands);
            });
        }
    }, [statusde]);

    function brandDelete(id) {
        brandservice.sortdelete(id).then((result) => {
            console.log(result.data.message);
            setStatusDelete(result.data.id);
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">THƯƠNG HIỆU</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to={"/admin/brand/trash"} className="btn btn-sm btn-danger me-2">
                            <FaTrashAlt /> Thùng rác
                        </Link>
                        <Link to="/admin/brand/create" className="btn btn-sm btn-success">
                            <FaPlus /> Thêm
                        </Link>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                            <th style={{ width: 200 }} className="text-center">Hình</th>
                            <th style={{ width: 200 }} className="text-center">Tên Thương Hiệu</th>
                            <th style={{ width: 130 }} className="text-center">Ngày Tạo</th>
                            <th style={{ width: 140 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {brands.map((brand, index) => (
                            <tr key={index}>
                                <td className="text-center"><input type="checkbox" /></td>
                                <td className="text-center">
                                    <img
                                        style={{ width: 150 }}
                                        className="img-fluid"
                                        src={`${urlImage}brand/${brand.image}`}
                                        alt={brand.name} />
                                </td>
                                <td className="text-center">{brand.name}</td>
                                <td className="text-center"><Moment format="DD/MM/YYYY">{brand.created_at}</Moment></td>
                                <td className="text-center">
                                    <Link className="btn btn-sm btn-primary me-1" to={`/admin/brand/show/${brand.id}`}>
                                        <BsFillEyeFill />
                                    </Link>
                                    <Link className="btn btn-sm btn-warning me-1" to={`/admin/brand/update/${brand.id}`}>
                                        <FaEdit />
                                    </Link>
                                    <button onClick={() => brandDelete(brand.id)} className="btn btn-sm btn-danger">
                                        <BsFillTrashFill />
                                    </button>
                                </td>
                                <td className="text-center">{brand.id}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default BrandList;