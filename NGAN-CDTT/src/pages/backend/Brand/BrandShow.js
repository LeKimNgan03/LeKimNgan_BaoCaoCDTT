import { FaEdit, FaTrash } from 'react-icons/fa';
import { Link, useParams, useNavigate } from "react-router-dom";
import brandservice from '../../../services/BrandService';
import { useEffect, useState } from 'react';
import { urlImage } from '../../../config';

function BrandShow() {
    const navigate = useNavigate();
    const { id } = useParams("id");
    const [brand, setBrand] = useState([]);

    useEffect(() => {
        {
            brandservice.getById(id).then((result) => {
                setBrand(result.data.brand);
            });
        }
    }, []);

    function brandDelete(id) {
        brandservice.sortdelete(id).then((result) => {
            alert(result.data.message);
            navigate('/admin/brand', { replace: true });
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">CHI TIẾT THƯƠNG HIỆU</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/brand" className="btn btn-sm btn-success me-1">Về Danh Sách</Link>
                        <Link to={`/admin/brand/update/${brand.id}`} className="btn btn-sm btn-warning me-1">
                            <FaEdit /> Sửa
                        </Link>
                        <button onClick={() => brandDelete(brand.id)} className="btn btn-sm btn-danger me-1">
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
                        <tr><td>Tên Thương Hiệu</td><td>{brand.name}</td></tr>
                        <tr><td>Slug</td><td>{brand.slug}</td></tr>
                        <tr><td>Hình</td>
                            <td>
                                <img
                                    style={{ width: 200 }}
                                    className="img-fluid"
                                    src={`${urlImage}brand/${brand.image}`} alt={brand.name} />
                            </td>
                        </tr>
                        <tr><td>Sắp Xếp</td><td>{brand.sort_order}</td></tr>
                        <tr><td>Metakey</td><td>{brand.metakey}</td></tr>
                        <tr><td>Metadesc</td><td>{brand.metadesc}</td></tr>
                        <tr><td>Trạng Thái</td><td>{brand.status}</td></tr>
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default BrandShow;