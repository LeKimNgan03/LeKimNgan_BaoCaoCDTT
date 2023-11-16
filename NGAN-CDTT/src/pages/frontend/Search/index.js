import { useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import ProductItem from "../../../components/frontend/productitem";
import productservice from '../../../services/ProductService';

function Search() {
    const { key } = useParams();
    const [products, setProducts] = useState([]);
    
    useEffect(() => {
        {
            productservice.getSearch(key).then((result) => {
                setProducts(result.data.products);
            });
        }
    }, [key]);

    return products != null ? (
        <section className="maincontent">
            <div className="container my-4">
                <div className="col-12 text-center">
                    <h3 className="text-center text-dark fw-bold">KẾT QUẢ TÌM KIẾM</h3>
                    <div className="row py-4">
                        {products.map((product, index) => <ProductItem key={index} product={product} />)}
                    </div>
                </div>
            </div>
        </section>
    ) : (
        <section className="maincontent">
            <div className="container my-4">
                <div className="row">
                    <div className="col-md-12">
                        <h3 className="text-center text-dark fw-bold">KẾT QUẢ TÌM KIẾM</h3>
                        <div className="row py-1">
                            <h4 className="text-center fw-light">Không tìm thấy {key}</h4>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
}

export default Search;