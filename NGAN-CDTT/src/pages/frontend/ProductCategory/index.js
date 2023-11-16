import { useEffect, useState } from "react";
import productservice from '../../../services/ProductService';
import categoryservice from "../../../services/CategoryService";
import ProductItem from "../../../components/frontend/productitem";
import { useParams } from "react-router-dom";
import ListCategory from "../../../layouts/frontend/ListCategory";

function ProductCategory() {
    const [products, setProducts] = useState([]);
    const [limit, setLimit] = useState(8);
    const [title, setTitle] = useState("");
    const { slug } = useParams();

    useEffect(function () {
        (async function () {
            try {
                const infocategory = await categoryservice.getBySlug(slug);
                const catid = infocategory.data.category.id;
                setTitle(infocategory.data.category.name);
                const infoproduct = await productservice.getProductCategoryById(catid, limit);
                setProducts(infoproduct.data.products);
            } catch (error) {
                console.error(error);
            }
        })();
    }, [limit, slug]);
    
    return (
        <section className="main-content">
            <div className="product-category">
                <div className="row">
                    <div className="col-md-3">
                        <ListCategory />
                    </div>

                    <div className="col-md-9 my-2">
                        <h2 className="text-center p-2 fw-bold text-uppercase">{title}</h2>
                        <div className="row">
                            {products.map((product, index) => <ProductItem product={product} key={index} />)}
                        </div>

                        <div className="row">
                            <div className="col-12 text-center">
                                <button
                                    onClick={() => setLimit(limit + 4)}
                                    className="btn btn-outline-light text-dark"
                                    style={{ backgroundColor: `#E8E2E2` }}>
                                    Xem thêm
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
}

export default ProductCategory;