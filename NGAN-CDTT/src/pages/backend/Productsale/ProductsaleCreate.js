import { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import productservice from "../../../services/ProductService";
import categoryservice from "../../../services/CategoryService";
import productsaleservice from "../../../services/ProductsaleService";

function ProductsaleCreate() {
    const navigate = useNavigate();
    const [productsales, setProductsales] = useState([]);
    useEffect(() => {
        {
            productsaleservice.getAll().then((result) => {
                setProductsales(result.data.productsales);
            });
        }
    }, []);

    const [products, setproducts] = useState([]);
    useEffect(() => {
        {
            productservice.getAll().then((result) => {
                setproducts(result.data.products);
            });
        }
    }, []);

    const [categorys, setCategorys] = useState([]);
    useEffect(() => {
        {
            categoryservice.getAll().then((result) => {
                setCategorys(result.data.categories);
            });
        }
    }, []);

    const [product_id, setProductId] = useState(0);
    const [pricesale, setPricesale] = useState('');
    const [qty, setQty] = useState();
    const [datebegin, setDatebegin] = useState("");
    const [dateend, setDateend] = useState("");

    async function productsaleStore(event) {
        event.preventDefault();
        const productsale = new FormData();
        productsale.append("product_id", product_id);
        productsale.append("pricesale", pricesale);
        productsale.append("qty", qty);
        productsale.append("datebegin", datebegin);
        productsale.append("dateend", dateend);
        await productsaleservice.create(productsale)
            .then((res) => {
                alert(res.data.message)
                navigate('/admin/productsale', { replace: true })
            });
    }

    return (
        <form onSubmit={productsaleStore} method="post">
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-dark">THÊM SẢN PHẨM SALE</strong>
                        </div>
                        <div className="col-md-6 text-end">
                            <button type="submit" className="btn btn-sm btn-success me-1">Lưu</button>
                            <Link to="/admin/productsale" className="btn btn-sm btn-info">Về Danh Sách</Link>
                        </div>
                    </div>
                </div>

                <div className="card-body">
                    <div className="row">
                        <div className="col-md-9 w-100">
                            <div className="mb-3">
                                <label htmlFor="product_id">Sản Phẩm</label>
                                <select
                                    name="product_id"
                                    value={product_id}
                                    className="form-control"
                                    onChange={(e) => setProductId(e.target.value)}>
                                    <option value="0">None</option>
                                    {products.map((cat, index) => (
                                        <option key={index} value={cat.id}>{cat.name}</option>
                                    ))}
                                </select>
                            </div>

                            <div className="mb-3">
                                <label htmlFor="pricesale">Giá Giảm</label>
                                <input
                                    type="text"
                                    name="pricesale"
                                    value={pricesale}
                                    onChange={(e) => setPricesale(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="qty">Số Lượng</label>
                                <input
                                    type="text"
                                    name="qty"
                                    value={qty}
                                    onChange={(e) => setQty(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="datebegin">Ngày Bắt Đầu</label>
                                <input
                                    type="date"
                                    name="datebegin"
                                    value={datebegin}
                                    onChange={(e) => setDatebegin(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="dateend">Ngày Kết Thúc</label>
                                <input
                                    type="date"
                                    name="dateend"
                                    value={dateend}
                                    onChange={(e) => setDateend(e.target.value)}
                                    className="form-control" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form >
    );
}

export default ProductsaleCreate;