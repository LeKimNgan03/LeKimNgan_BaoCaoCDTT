import { useEffect, useState } from "react";
import { Link, useParams, useNavigate } from "react-router-dom";
import productservice from '../../../services/ProductService';
import categoryservice from "../../../services/CategoryService";
import brandservice from "../../../services/BrandService";

function ProductUpdate() {
    const [categorys, setCategorys] = useState([]);
    useEffect(() => {
        {
            categoryservice.getAll().then((result) => {
                setCategorys(result.data.categories);
            });
        }
    }, []);

    const [brands, setBrands] = useState([]);
    useEffect(() => {
        {
            brandservice.getAll().then((result) => {
                setBrands(result.data.brands);
            });
        }
    }, []);

    const navigate = useNavigate();
    const [category_id, setCategoryId] = useState(0);
    const [brand_id, setBrandId] = useState(0);
    const [name, setName] = useState('');
    const [price, setPrice] = useState('');
    const [pricesale, setPricesale] = useState('');
    const [qty, setQty] = useState();
    const [detail, setDetail] = useState('');
    const [metakey, setMetakey] = useState('');
    const [metadesc, setMetadesc] = useState('');
    const [status, setStatus] = useState(1);
    //
    const { id } = useParams("id");
    //
    useEffect(() => {
        {
            productservice.getById(id).then((result) => {
                const tmp = result.data.product;
                setCategoryId(tmp.category_id);
                setBrandId(tmp.brand_id);
                setPrice(tmp.price);
                setPricesale(tmp.pricesale);
                setName(tmp.name);
                setMetakey(tmp.metakey);
                setMetadesc(tmp.metadesc);
                setStatus(tmp.status);
                setQty(tmp.qty);
                setDetail(tmp.detail);
            });
        }
    }, []);

    //Lấy danh sách
    const [products, setProducts] = useState([]);
    useEffect(() => {
        {
            productservice.getAll().then((result) => {
                setProducts(result.data.products);
            });
        }
    }, []);

    async function productEdit(event) {
        event.preventDefault();
        const image = document.querySelector("#image");
        const product = new FormData();
        product.append("category_id", category_id);
        product.append("brand_id", brand_id);
        product.append("name", name);
        product.append("price", price);
        product.append("pricesale", pricesale);
        product.append("qty", qty);
        product.append("detail", detail);
        product.append("metakey", metakey);
        product.append("status", status);
        product.append("metadesc", metadesc);
        if (image.files.length === 0) {
            product.append("image", "");
        }
        else {
            product.append("image", image.files[0]);
        }
        await productservice.update(product, id)
            .then((res) => {
                alert(res.data.message)
                navigate('/admin/product', { replace: true })
            });
    }

    return (
        <form onSubmit={productEdit} method="post">
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-dark">CẬP NHẬT SẢN PHẨM</strong>
                        </div>
                        <div className="col-md-6 text-end">
                            <button type="submit" className="btn btn-sm btn-success me-1">Lưu</button>
                            <Link to="/admin/product" className="btn btn-sm btn-info">Về Danh Sách</Link>
                        </div>
                    </div>
                </div>

                <div className="card-body">
                    <div className="row">
                        <div className="col-md-9">
                            <div className="mb-3">
                                <label htmlFor="category_id">Danh Mục </label>
                                <select
                                    name="category_id"
                                    value={category_id}
                                    className="form-control"
                                    onChange={(e) => setCategoryId(e.target.value)}>
                                    <option value="0">None</option>
                                    {categorys.map((cat, index) => (
                                        <option key={index} value={cat.id}>{cat.name}</option>
                                    ))}
                                </select>
                            </div>

                            <div className="mb-3">
                                <label htmlFor="brand_id">Thương Hiệu</label>
                                <select
                                    name="brand_id"
                                    value={brand_id}
                                    className="form-control"
                                    onChange={(e) => setBrandId(e.target.value)}>
                                    <option value="0">None</option>
                                    {brands.map((brand, index) => (
                                        <option key={index} value={brand.id}>{brand.name}</option>
                                    ))}
                                </select>
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Tên Sản Phẩm</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={name}
                                    onChange={(e) => setName(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Giá Tiền</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={price}
                                    onChange={(e) => setPrice(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Giá Giảm</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={pricesale}
                                    onChange={(e) => setPricesale(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="image">Hình Đại Diện</label>
                                <input type="file" id="image" className="form-control" />
                            </div>
                        </div>

                        <div className="col-md-3">
                            <div className="mb-3">
                                <label htmlFor="name">Số Lượng</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={qty}
                                    onChange={(e) => setQty(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Chi Tiết</label>
                                <textarea
                                    type="text"
                                    name="name"
                                    value={detail}
                                    onChange={(e) => setDetail(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Từ Khóa</label>
                                <textarea
                                    type="text"
                                    name="name"
                                    value={metakey}
                                    onChange={(e) => setMetakey(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Mô Tả</label>
                                <textarea
                                    type="text"
                                    name="name"
                                    value={metadesc}
                                    onChange={(e) => setMetadesc(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="status">Trạng Thái</label>
                                <select
                                    name="status"
                                    value={status}
                                    className="form-control"
                                    onChange={(e) => setStatus(e.target.value)}>
                                    <option value="1">Xuất Bản</option>
                                    <option value="2">Chưa Xuất Bản</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form >
    );
}

export default ProductUpdate;