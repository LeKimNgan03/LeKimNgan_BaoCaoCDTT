import ProductItem from "../../../components/frontend/productitem";
import productservice from '../../../services/ProductService';
import { useEffect, useState } from "react";

function Product() {
    const [products, setProducts] = useState([]);
    const [limit, setLimit] = useState(8);

    useEffect(() => {
        {
            productservice.getProductAll(limit, 1).then((result) => {
                setProducts(result.data.products);
            });
        }
    }, [limit]);

    return (
        <div>
            <h3 className="p-3 pb-0 fw-light text-uppercase">Sản phẩm</h3>

            <hr className="mx-3" />

            <div className="row mx-2">
                {products.map((product, index) => <ProductItem product={product} key={index} />)}
            </div>

            <div className="row my-1">
                <div className="col-12 text-center">
                    <button
                        onClick={() => setLimit(limit + 8)}
                        className="btn btn-outline-light text-dark"
                        style={{ backgroundColor: `#E8E2E2` }}>
                        Xem thêm
                    </button>
                </div>
            </div>
        </div>
    );
}

export default Product;