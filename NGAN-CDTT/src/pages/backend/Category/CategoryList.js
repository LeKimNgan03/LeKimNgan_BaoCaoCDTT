import { Link } from "react-router-dom";
import { FaPlus, FaEdit, FaTrashAlt } from 'react-icons/fa';
import { BsFillEyeFill, BsFillTrashFill } from "react-icons/bs";
import { useState, useEffect } from "react";
import { urlImage } from '../../../config';
import categoryservice from "../../../services/CategoryService";

function CategoryList() {
    const [statusde, setStatusDelete] = useState(0);
    const [categories, setCategories] = useState([]);

    useEffect(() => {
        {
            categoryservice.getAll().then((result) => {
                setCategories(result.data.categories);
            });
        }
    }, [statusde]);

    function categoryDelete(id) {
        categoryservice.sortdelete(id).then((result) => {
            console.log(result.data.message);
            setStatusDelete(result.data.id);
        });
    }

    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-6">
                        <strong className="text-dark">DANH MỤC</strong>
                    </div>
                    <div className="col-6 text-end">
                        <Link to={"/admin/category/trash"} className="btn btn-sm btn-danger me-2">
                            <FaTrashAlt /> Thùng rác
                        </Link>
                        <Link to="/admin/category/create" className="btn btn-sm btn-success">
                            <FaPlus /> Thêm
                        </Link>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                            <th style={{ width: 100 }} className="text-center">Hình</th>
                            <th style={{ width: 200 }} className="text-center">Tên danh mục</th>
                            <th style={{ width: 150 }} className="text-center">Chức năng</th>
                            <th style={{ width: 50 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {categories.map((category, index) => (
                            <tr key={index}>
                                <td className="text-center"><input type="checkbox" /></td>
                                <td className="text-center"><img
                                    style={{ width: 250 }}
                                    src={`${urlImage}category/${category.image}`}
                                    alt="hinh.png"
                                    className="img-fluid " /></td>
                                <td className="text-center">{category.name}</td>
                                <td className="text-center">
                                    <Link className="btn btn-sm btn-primary me-1" to={`/admin/category/show/${category.id}`}>
                                        <BsFillEyeFill />
                                    </Link>
                                    <Link className="btn btn-sm btn-warning me-1" to={`/admin/category/update/${category.id}`}>
                                        <FaEdit />
                                    </Link>
                                    <button onClick={() => categoryDelete(category.id)} className="btn btn-sm btn-danger">
                                        <BsFillTrashFill />
                                    </button>
                                </td>
                                <td className="text-center">{category.id}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
}

export default CategoryList;