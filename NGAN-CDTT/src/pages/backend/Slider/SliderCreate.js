import { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import sliderservice from "../../../services/SliderService";

function SliderCreate() {
    const [sliders, setSliders] = useState([]);
    useEffect(() => {
        {
            sliderservice.getAll().then((result) => {
                setSliders(result.data.sliders);
            });
        }
    }, []);

    const navigate = useNavigate();
    const [name, setName] = useState('');
    const [link, setLink] = useState('');
    const [sort_order, setOrder] = useState(0);
    const [position, setPosition] = useState();
    const [status, setStatus] = useState(1);

    async function sliderStore(event) {
        const image = document.querySelector("#image");
        event.preventDefault();
        const slider = new FormData();
        slider.append("name", name);
        slider.append("link", link);
        slider.append("sort_order", sort_order);
        slider.append("position", position);
        slider.append("status", status);
        if (image.files.length === 0) {
            slider.append("image", "");
        }
        else {
            slider.append("image", image.files[0]);
        }
        await sliderservice.create(slider)
            .then((res) => {
                alert(res.data.message)
                navigate('/admin/slider', { replace: true })
            });
    }

    return (
        <form onSubmit={sliderStore} method="post">
            <div className="card">
                <div className="card-header">
                    <div className="row">
                        <div className="col-md-6">
                            <strong className="text-dark">THÊM SLIDER</strong>
                        </div>
                        <div className="col-md-6 text-end">
                            <button type="submit" className="btn btn-sm btn-success me-1">Lưu</button>
                            <Link to="/admin/slider" className="btn btn-sm btn-info">Về Danh Sách</Link>
                        </div>
                    </div>
                </div>

                <div className="card-body">
                    <div className="row">
                        <div className="col-md-9 w-100">
                            <div className="mb-3">
                                <label htmlFor="name">Tên</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={name}
                                    onChange={(e) => setName(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Link</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={link}
                                    onChange={(e) => setLink(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="name">Vị Trí</label>
                                <input
                                    type="text"
                                    name="name"
                                    value={position}
                                    onChange={(e) => setPosition(e.target.value)}
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="image">Hình Đại Diện</label>
                                <input
                                    type="file"
                                    id="image"
                                    className="form-control" />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="sort_order">Sắp Xếp</label>
                                <select
                                    name="sort_order"
                                    value={sort_order}
                                    className="form-control"
                                    onChange={(e) => setOrder(e.target.value)}>
                                    <option value="0">None</option>
                                    {sliders.map((slider, index) => (
                                        <option key={index} value={slider.sort_order + 1}>Sau {slider.name}</option>
                                    ))}
                                </select>
                            </div>

                            <div className="mb-3">
                                <label htmlFor="sort">Trạng Thái</label>
                                <select
                                    name="sort"
                                    value={status}
                                    className="form-control"
                                    onChange={(e) => setStatus(e.target.value)}>
                                    <option value="1">Xuất bản</option>
                                    <option value="2">Chưa xuất bản</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    );
}

export default SliderCreate;