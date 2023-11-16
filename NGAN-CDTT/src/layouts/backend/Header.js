import { Link } from "react-router-dom";

function Header() {
    return (
        <section className="header bg-light">
            <div className="container-fluid">
                <nav className="navbar navbar-expand-lg bg-body-tertiary">
                    <div className="container-fluid">
                        <Link className="navbar-brand" to="/admin"><b>Quản trị</b></Link>
                        <div className="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                                <li className="nav-item dropdown">
                                    <a
                                        className="nav-link dropdown-toggle text-dark"
                                        href="#"
                                        role="button"
                                        data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        Danh sách
                                    </a>
                                    <ul className="dropdown-menu">
                                        <li><Link className="dropdown-item" to="/admin/brand">Brand</Link></li>
                                        <li><Link className="dropdown-item" to="/admin/category">Category</Link></li>
                                        <li><Link className="dropdown-item" to="/admin/contact">Contact</Link></li>
                                        <li><Link className="dropdown-item" to="/admin/menu">Menu</Link></li>
                                        <li><Link className="dropdown-item" to="/admin/order">Order</Link></li>
                                        <li><Link className="dropdown-item" to="/admin/orderdetail">OrderDetail</Link></li>
                                        <li><Link className="dropdown-item" to="/admin/policy">Policy</Link></li>
                                        <li><Link className="dropdown-item" to="/admin/post">Post</Link></li>
                                        <li><Link className="dropdown-item" to="/admin/product">Product</Link></li>
                                        <li><Link className="dropdown-item" to="/admin/productsale">ProductSale</Link></li>
                                        <li><Link className="dropdown-item" to="/admin/slider">Slider</Link></li>
                                        <li><Link className="dropdown-item" to="/admin/topic">Topic</Link></li>
                                        <li><Link className="dropdown-item" to="/admin/user">User</Link></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </section>
    );
}

export default Header;