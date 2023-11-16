import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import Header from "./Header";
import Footer from "./Footer";
import { Outlet } from 'react-router-dom';

function Home() {
    return (
        <>
            <Header />
            <Outlet />
            <Footer />
        </>
    );
}
export default Home;