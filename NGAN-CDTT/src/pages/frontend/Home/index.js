import { useEffect, useState } from "react";
import categoryservice from "../../../services/CategoryService";
import ProductHome from "./ProductHome";
import Slider from "./Slider";
// import ProductSale from "./ProductSale";

function Home() {
    const [categories, setCategories] = useState([]);
    useEffect(() => {
        {
            categoryservice.getCategoryByParentId(0).then((result) => {
                setCategories(result.data.categories);
            });
        }
    }, [])

    return (
        <section className="main-content">
            <div className="slider">
                <Slider />
            </div>

            <div className="product-sale">
                {/* <ProductSale /> */}
            </div>

            <div className="product">
                {categories.map((category, index) => <ProductHome key={index} category={category} />)}
            </div>

            <div className="my-5" />

            <div id="map-container-google-1" className="z-depth-1-half map-container" style={{ height: 500 }}>
                <iframe src="https://maps.google.com/maps?q=manhatan&t=&z=13&ie=UTF8&iwloc=&output=embed"
                    frameBorder="0"
                    style={{ border: 0, width: `100%`, height: `100%` }} allowFullScreen />
            </div>
        </section>
    );
}

export default Home;