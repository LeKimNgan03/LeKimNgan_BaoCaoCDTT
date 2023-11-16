import { useEffect, useState } from 'react';
import ProductItem from "../../../components/frontend/productitem";
import ListBrand from "../../../layouts/frontend/ListBrand";
import { useParams } from "react-router-dom";
import brandservice from "../../../services/BrandService";
import productservice from '../../../services/ProductService';

function ProductBrand() {
    const { slug } = useParams();
    const [products, setProducts] = useState([]);
    const [limit, setLimit] = useState(8);
    const [title, setTitle] = useState("");

    useEffect(function () {
        (async function () {
            try {
                const result_brand = await brandservice.getById(slug);
                const brandid = result_brand.data.brand.id;
                const result = await productservice.getProductBrandById(brandid, limit);
                setProducts(result.data.products);
                setTitle(result_brand.data.brand.name);
            } catch (error) {
                console.log(error);
            }
        })();
    }, [limit, slug]);

    return (
        <section className="main-content">
            <div className="product-brand">
                <div className="row">
                    <div className="col-md-3">
                        <ListBrand />
                    </div>

                    <div className="col-md-9 my-2">
                        <h2 className="text-center p-2 fw-bold text-uppercase">{title}</h2>
                        <div className="row">
                            {products.map((product, index) => <ProductItem product={product} key={index} />)}
                        </div>

                        {/* <div className="row">
                            <div className="col-12 text-center">
                                <button
                                    onClick={() => setLimit(limit + 4)}
                                    className="btn btn-outline-light text-dark"
                                    style={{ backgroundColor: `#F8E8EE` }}>
                                    Xem thêm
                                </button>
                            </div>
                        </div> */}
                    </div>
                </div>
            </div>
        </section>
    );
}

export default ProductBrand;