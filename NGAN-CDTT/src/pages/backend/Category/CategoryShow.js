import { Link, useParams, useNavigate } from "react-router-dom";
import { FaEdit } from 'react-icons/fa';
import { BsFillTrashFill } from "react-icons/bs";
import categoryservice from "../../../services/CategoryService";
import { useState, useEffect } from "react";
import { urlImage } from "../../../config";

function CategoryShow() {
    const navigate = useNavigate();
    const { id } = useParams("id");
    const [category, setCategory] = useState([]);
    useEffect(() => {
        {
            categoryservice.getById(id).then((result) => {
                setCategory(result.data.category);
            });
        }
    }, []);

    function categoryDelete(id) {
        categoryservice.sortdelete(id).then((result) => {
            alert(result.data.message);
            navigate('/admin/category', { replace: true });
        });
    }

    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-6">
                        <strong className="text-dark">CHI TIẾT DANH MỤC</strong>
                    </div>
                    <div className="col-6 text-end">
                        <Link className="btn btn-sm btn-success me-1" to="/admin/category">Về danh sách</Link>
                        <Link className="btn btn-sm btn-warning me-1" to={`/admin/category/update/${category.id}`}>
                            <FaEdit /> Sửa
                        </Link>
                        <button onClick={() => categoryDelete(category.id)} className="btn btn-sm btn-danger">
                            <BsFillTrashFill /> Xóa
                        </button>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table-bordered">
                    <thead>
                        <tr>
                            <th style={{ width: 500 }}>TÊN TRƯỜNG</th>
                            <th>GIÁ TRỊ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><th>Id</th><td>{category.id}</td></tr>
                        <tr><th>Tên thương hiệu</th><td>{category.name}</td></tr>
                        <tr><th>Slug</th><td>{category.slug}</td></tr>
                        <tr><img src={`${urlImage}category/${category.image}`}
                            alt="hinh"
                            className="img-fluid"
                            style={{ maxWidth: 100, maxHeight: 100 }} /></tr>
                        <tr><td>Sắp Xếp</td><td>{category.sort_order}</td></tr>
                        <tr><td>Metakey</td><td>{category.metakey}</td></tr>
                        <tr><td>Metadesc</td><td>{category.metadesc}</td></tr>
                        <tr><td>Trạng Thái</td><td>{category.status}</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    );
}

export default CategoryShow;