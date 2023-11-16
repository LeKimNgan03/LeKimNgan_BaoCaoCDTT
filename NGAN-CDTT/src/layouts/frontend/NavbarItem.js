import menuservice from '../../services/MenuService';
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";

function NavbarItem(props) {
    const rowmenu = props.menu;
    const [menus, setMenus] = useState([]);
    useEffect(() => {
        {
            menuservice.getByParentId('mainmenu', rowmenu.id).then((result) => {
                setMenus(result.data.menus);
            });
        }
    }, [])

    return menus == null ? (
        <li className="nav-item">
            <Link className="nav-link text-dark" to={rowmenu.link}>{rowmenu.name}</Link>
        </li>
    ) : (
        <li className="nav-item dropdown">
            <Link
                className="nav-link dropdown-toggle text-dark"
                to={rowmenu.link} role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false">
                {rowmenu.name}
            </Link>
            <ul className="dropdown-menu">
                {menus.map((menu1, index) => (
                    <li key={index}>
                        <Link className="dropdown-item" to={menu1.link}>{menu1.name}</Link>
                    </li>
                ))}
            </ul>
        </li>
    );
}

export default NavbarItem;