import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import { Outlet } from "react-router-dom";
import Header from "./Header";

function Backend() {
    return (
        <>
            <Header />
            <section className="maincontent">
                <div className="container-fluid py-3">
                    <Outlet />
                </div>
            </section>
        </>
    );
}

export default Backend;