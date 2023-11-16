import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import ProductItem from "../../../components/frontend/productitem";
import productservice from '../../../services/ProductService';

function ProductHome(props) {
    const [products, setProducts] = useState([]);
    useEffect(() => {
        {
            productservice.getProductHome(8, props.category.id).then((result) => {
                setProducts(result.data.products);
            });
        }
    }, [])

    if (products != null) {
        return (
            <div className="product-category mx-2">
                <h4 className="p-3 pb-0 fw-bold text-uppercase text-center text-dark mt-3">
                    <Link
                        className="text-decoration-none text-dark"
                        to={`/danh-muc-san-pham/${props.category.slug}`}>
                        {props.category.name}
                    </Link>
                </h4>

                <hr />

                <div className="row">
                    {products.map((product, index) => <ProductItem product={product} key={index} />)}
                </div>
            </div>
        );
    }
}

export default ProductHome;