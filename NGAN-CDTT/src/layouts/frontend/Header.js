import { BsTwitter, BsInstagram, BsFacebook, BsTiktok, BsSearch, BsCart2 } from "react-icons/bs";
import { Link } from "react-router-dom";
import menuservice from '../../services/MenuService';
import { useEffect, useState } from "react";
import NavbarItem from './NavbarItem';

function Header() {
    // Get Menu
    const [menus, setMenus] = useState([]);
    useEffect(() => {
        {
            menuservice.getByParentId('mainmenu', 0).then((result) => {
                setMenus(result.data.menus);
            });
        }
    }, []);

    // Search
    const [key, setKey] = useState("");

    return (
        <div style={{ backgroundColor: `#E8E2E2` }}>
            <header className="py-2">
                <div className="container d-flex flex-wrap">
                    {/* Logo */}
                    <Link to="/" className="d-flex mb-3 mb-lg-0 me-lg-auto link-body-emphasis text-decoration-none">
                        <span className="fs-3 fw-bold">Douce Muse</span>
                    </Link>

                    {/* Search */}
                    <form className="input-group w-50 me-lg-auto" role="search">
                        <input
                            type="text"
                            value={key}
                            onChange={(e) => setKey(e.target.value)}
                            className="form-control"
                            placeholder="Tìm kiếm..."
                            aria-label="Search" />
                        <span
                            className="input-group-text"
                            type="submit">
                            <Link className="text-dark" to={`/tim-kiem/${key}`}><BsSearch /></Link>
                        </span>
                    </form>

                    {/* Login & Register */}
                    <ul className="nav">
                        <li className="nav-item"><Link to="/login" className="nav-link link-body-emphasis px-1 fs-5">Đăng nhập</Link></li>
                        <li className="nav-item"><Link to="/register" className="nav-link link-body-emphasis px-1 fs-5">Đăng ký</Link></li>
                    </ul>
                </div>

                <hr className="container" />

                <div className="container d-flex flex-wrap">
                    {/* Icons */}
                    <ul className="nav me-auto">
                        <li className="nav-item facebook"><Link to="https://www.facebook.com/doucemusestore/" className="nav-link link-body-emphasis px-2 active" aria-current="page"><BsFacebook /></Link></li>
                        <li className="nav-item instagram"><Link to="https://www.instagram.com/_douce.muse_/" className="nav-link link-body-emphasis px-2"><BsInstagram /></Link></li>
                        <li className="nav-item twitter"><Link to="#" className="nav-link link-body-emphasis px-2"><BsTwitter /></Link></li>
                        <li className="nav-item tiktok"><Link to="#" className="nav-link link-body-emphasis px-2"><BsTiktok /></Link></li>
                    </ul>

                    {/* Menu */}
                    <nav className="navbar navbar-expand-lg me-lg-auto">
                        <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
                            <ul className="navbar-nav">
                                {menus.map((menu, index) =>
                                    <NavbarItem key={index} menu={menu} />
                                )}
                            </ul>
                        </div>
                    </nav>

                    {/* Cart */}
                    <Link className="btn mx-1" type="submit" to="/cart">
                        <BsCart2 />
                        <span className="position-static top-0 start-100 translate-middle badge rounded-pill bg-secondary">0</span>
                    </Link>
                </div>
            </header>
        </div>
    );
}

export default Header;