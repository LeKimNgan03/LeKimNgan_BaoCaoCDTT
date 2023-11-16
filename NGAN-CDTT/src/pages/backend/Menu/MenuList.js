import { FaPlus, FaRegEye, FaEdit, FaTrash, FaTrashAlt } from 'react-icons/fa';
import { Link } from "react-router-dom";
import menuservice from '../../../services/MenuService';
import { useEffect, useState } from 'react';

function MenuList() {
    const [statusdel, setStatusDel] = useState(0);
    const [menus, setMenus] = useState([]);

    useEffect(() => {
        {
            menuservice.getAll().then((result) => {
                setMenus(result.data.menus);
            });
        }
    }, [statusdel]);

    function menuDelete(id) {
        menuservice.sortdelete(id).then((result) => {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">DANH SÁCH MENU</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to={"/admin/menu/trash"} className="btn btn-sm btn-danger me-2">
                            <FaTrashAlt /> Thùng rác
                        </Link>
                        <Link to="/admin/menu/create" className="btn btn-sm btn-success">
                            <FaPlus /> Thêm
                        </Link>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table-bordered table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                            <th style={{ width: 160 }} className="text-center">Tên Menu</th>
                            <th style={{ width: 200 }} className="text-center">Link</th>
                            <th style={{ width: 100 }} className="text-center">Danh mục cha</th>
                            <th style={{ width: 120 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {menus.map((menu, index) =>
                            <tr key={index}>
                                <td className="text-center"><input type="checkbox" /></td>
                                <td className="text-center">{menu.name}</td>
                                <td className="text-center">{menu.link}</td>
                                <td className="text-center">{menu.parent_id}</td>
                                <td className="text-center">
                                    <Link to={`/admin/menu/show/${menu.id}`} className="btn btn-sm btn-primary me-1">
                                        <FaRegEye />
                                    </Link>
                                    <Link to={`/admin/menu/update/${menu.id}`} className="btn btn-sm btn-warning me-1">
                                        <FaEdit />
                                    </Link>
                                    <button onClick={() => menuDelete(menu.id)} className="btn btn-sm btn-danger me-1">
                                        <FaTrash />
                                    </button>
                                </td>
                                <td className="text-center">{menu.id}</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default MenuList;