import { useEffect, useState } from "react";
// import "../../../assets/css/productsale.css";
import ProductSaleItem from "../../../components/frontend/productisaletem.js";
import CountDown from "../../../layouts/frontend/CountDown.js";
import productsaleservice from '../../../services/ProductsaleService';

function ProductSale(props) {
    const [productsales, setProductsales] = useState([]);

    useEffect(() => {
        {
            productsaleservice.getAll().then((result) => {
                setProductsales(result.data.productsales);
            });
        }
    }, []);

    if (productsales != null) {
        return (
            <section className="my-5 mx-2 p-3 rounded-3" style={{ backgroundColor: `#F99417` }}>
                <div className="row">
                    <div className="d-flex">
                        <h3 className="fw-bold">SẢN PHẨM SALE</h3>
                        <CountDown />
                    </div>

                    <div id="carouselExampleControls" className="carousel carousel-dark slide mt-3" data-bs-ride="carousel">
                        <div className="carousel-inner">
                            <div className="carousel-item active">
                                <div className="row">
                                    {productsales.map((productsale, index) => <ProductSaleItem productsale={productsale} key={index} />)}
                                </div>
                            </div>
                        </div>

                        {/* <button className="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                            <span className="carousel-control-prev-icon" aria-hidden="true" />
                            <span className="visually-hidden">Previous</span>
                        </button>

                        <button className="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                            <span className="carousel-control-next-icon" aria-hidden="true" />
                            <span className="visually-hidden">Next</span>
                        </button> */}
                    </div>
                </div>
            </section>
        );
    }
}

export default ProductSale;