import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import brandservice from '../../services/BrandService';

function ListBrand() {
    const [brands, setBrands] = useState([]);
    useEffect(() => {
        (async function () {
            try {
                const result = await brandservice.getAll();
                setBrands(result.data.brands);
            } catch (error) {
                console.error(error);
            }
        })();
    }, []);

    return (
        <div className="list-category my-3 mx-3">
            <ul className="list-group">
                <h4
                    className="text-center p-2 fw-light text-uppercase"
                    style={{ backgroundColor: `#E8E2E2` }}>
                    THƯƠNG HIỆU
                </h4>

                {brands.map((brand, index) => (
                    <li key={index} className="list-group-item">
                        <Link
                            className="text-decoration-none text-dark"
                            to={`/thuong-hieu/${brand.slug}`}>
                            {brand.name}
                        </Link>
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default ListBrand;