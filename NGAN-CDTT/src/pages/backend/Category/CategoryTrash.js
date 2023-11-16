import { Link } from "react-router-dom";
import { FaArrowLeft, FaTrashRestore } from 'react-icons/fa';
import { BsFillTrashFill } from "react-icons/bs";
import { useState, useEffect } from "react";
import { urlImage } from '../../../config';
import categoryservice from "../../../services/CategoryService";

function CategoryList() {
    const [statusde, setStatusDelete] = useState(0);
    const [categories, setCategories] = useState([]);

    useEffect(() => {
        {
            categoryservice.getTrash().then((result) => {
                setCategories(result.data.categories);
            });
        }
    }, [statusde]);

    function categoryDelete(id) {
        categoryservice.remove(id).then((result) => {
            console.log(result.data.message);
            setStatusDelete(result.data.id);
        });
    }

    function restore(id) {
        categoryservice.restore(id).then((result) => {
            console.log(result.data.message);
            setStatusDelete(result.data.id);
        });
    }

    return (
        <div className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-6">
                        <strong className="text-dark">THÙNG RÁC</strong>
                    </div>
                    <div className="col-6 text-end">
                        <Link to="/admin/category" className="btn btn-sm btn-success">
                            <FaArrowLeft /> Quay Về
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
                        {categories.map((category, index) =>
                            <tr key={index}>
                                <td className="text-center"><input type="checkbox" /></td>
                                <td className="text-center">
                                    <img
                                        style={{ width: 250 }}
                                        src={`${urlImage}category/${category.image}`}
                                        alt={category.name}
                                        className="img-fluid " />
                                </td>
                                <td className="text-center">{category.name}</td>
                                <td className="text-center">
                                    <button onClick={() => restore(category.id)} className="btn btn-sm btn-success me-1">
                                        <FaTrashRestore />
                                    </button>
                                    <button onClick={() => categoryDelete(category.id)} className="btn btn-sm btn-danger">
                                        <BsFillTrashFill />
                                    </button>
                                </td>
                                <td className="text-center">{category.id}</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </div>
    );
}

export default CategoryList;