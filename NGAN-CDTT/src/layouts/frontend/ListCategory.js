import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import categoryservice from "../../services/CategoryService";

function ListCategory() {
    const [categories, setCategory] = useState([]);
    useEffect(() => {
        (async function () {
            try {
                const result = await categoryservice.getCategoryByParentId(0);
                setCategory(result.data.categories);
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
                    SẢN PHẨM
                </h4>

                {categories.map((cat, index) => (
                    <li
                        className="list-group-item"
                        key={index}>
                        <Link
                            className="text-decoration-none text-dark"
                            to={`/danh-muc-san-pham/${cat.slug}`}>
                            {cat.name}
                        </Link>
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default ListCategory;