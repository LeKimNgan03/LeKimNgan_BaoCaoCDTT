import { useEffect, useState } from "react";
import { Link, useParams, useNavigate } from "react-router-dom";
import menuservice from '../../../services/MenuService';

function MenuUpdate() {
    const navigate = useNavigate();
    const [name, setName] = useState('');
    const [link, setLink] = useState('');
    const [type, setType] = useState('');
    const [position, setPosition] = useState('');
    const [parent_id, setParentId] = useState(0);
    const [sort_order, setSortOrder] = useState(0);
    const [status, setStatus] = useState(1);
    //
    const { id } = useParams("id");
    //
    useEffect(() => {
        {
            menuservice.getById(id).then((result) => {
                const tmp = result.data.menu;
                setName(tmp.name);
                setLink(tmp.link);
                setType(tmp.type);
                setPosition(tmp.position);
                setParentId(tmp.parent_id);
                setSortOrder(tmp.sort_order);
                setStatus(tmp.status);
            });
        }
    }, []);

    //Lấy danh sách
    const [menus, setMenus] = useState([]);
    useEffect(() => {
        {
            menuservice.getAll().then((result) => {
                setMenus(result.data.menus);
            });
        }
    }, []);

    async function menuEdit(event) {
        event.preventDefault();
        const menu = new FormData();
        menu.append("name", name);
        menu.append("link", link);
        menu.append("type", type);
        menu.append("position", position);
        menu.append("parent_id", parent_id);
        menu.append("sort_order", sort_order);
        menu.append("status", status);
        await menuservice.update(menu, id).then((res) => {
            alert(res.data.message)
            navigate('/admin/menu', { replace: true })
        });
    }

    return (
        <form onSubmit={menuEdit} method="post">
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-dark">CẬP NHẬT MENU</strong>
                        </div>
                        <div className="col-md-6 text-end">
                            <button type="submit" className="btn btn-sm btn-success me-1">Lưu</button>
                            <Link to="/admin/menu" className="btn btn-sm btn-info">Về Danh Sách</Link>
                        </div>
                    </div>
                </div>

                <div className="card-body">
                    <div className="row">
                        <div className="col-md-9">
                            <div className="mb-3">
                                <label htmlFor="name">Tên Menu</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={name}
                                    onChange={(e) => setName(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Link</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={link}
                                    onChange={(e) => setLink(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Kiểu</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={type}
                                    onChange={(e) => setType(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Vị trí</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={position}
                                    onChange={(e) => setPosition(e.target.value)}
                                    className="form-control" />
                            </div>
                        </div>

                        <div className="col-md-3">
                            <div className="mb-3">
                                <label htmlFor="parent_id">Danh mục cha</label>
                                <select
                                    name="parent_id"
                                    value={parent_id}
                                    className="form-control"
                                    onChange={(e) => setParentId(e.target.value)}>
                                    <option value="0">None</option>
                                    {menus.map((menu, index) => (
                                        <option key={index} value={menu.parent_id}>{menu.name}</option>
                                    ))}
                                </select>
                            </div>

                            <div className="mb-3">
                                <label htmlFor="sort_order">Sắp Xếp</label>
                                <select
                                    name="sort_order"
                                    value={sort_order}
                                    className="form-control"
                                    onChange={(e) => setSortOrder(e.target.value)}>
                                    <option value="0">None</option>
                                    {menus.map((menu, index) => (
                                        <option key={index} value={menu.sort_order + 1}>Sau {menu.name}</option>
                                    ))}
                                </select>
                            </div>

                            <div className="mb-3">
                                <label htmlFor="sort">Trạng Thái</label>
                                <select
                                    name="sort"
                                    value={status}
                                    className="form-control"
                                    onChange={(e) => setStatus(e.target.value)}>
                                    <option value="1">Xuất bản</option>
                                    <option value="2">Chưa xuất bản</option>
                                </select>
                            </div>
                        </div>                    </div>
                </div>
            </div>
        </form>
    );
}

export default MenuUpdate;