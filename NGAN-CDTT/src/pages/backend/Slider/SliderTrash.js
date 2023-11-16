import { FaArrowLeft, FaTrashRestore, FaTrash } from 'react-icons/fa';
import sliderservice from '../../../services/SliderService';
import { Link } from "react-router-dom";
import { useEffect, useState } from 'react';
import { urlImage } from '../../../config';

function SliderList() {
    const [statusdel, setStatusDel] = useState(0);
    const [sliders, setSliders] = useState([]);

    useEffect(() => {
        {
            sliderservice.getTrash().then((result) => {
                setSliders(result.data.sliders);
            });
        }
    }, [statusdel]);

    function sliderDelete(id) {
        sliderservice.remove(id).then((result) => {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }

    function restore(id) {
        sliderservice.restore(id).then((result) => {
            console.log(result.data.message);
            setStatusDel(result.data.id);
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">THÙNG RÁC</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/slider" className="btn btn-sm btn-success">
                            <FaArrowLeft /> Quay Về
                        </Link>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                            <th style={{ width: 150 }} className="text-center">Tên</th>
                            <th style={{ width: 150 }} className="text-center">Liên kết</th>
                            <th style={{ width: 200 }} className="text-center">Hình</th>
                            <th style={{ width: 150 }} className="text-center">Vị trí</th>
                            <th style={{ width: 140 }} className="text-center">Chức năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {sliders.map((slider, index) =>
                            <tr key={index}>
                                <td className="text-center"><input type="checkbox" /></td>
                                <td className="text-center">{slider.name}</td>
                                <td className="text-center">{slider.link}</td>
                                <td className="text-center">
                                    <img
                                        style={{ width: 150 }}
                                        className="img-fluid"
                                        src={`${urlImage}slider/${slider.image}`}
                                        alt={slider.name} />
                                </td>
                                <td className="text-center">{slider.position}</td>
                                <td className="text-center">
                                    <button onClick={() => restore(slider.id)} className="btn btn-sm btn-success me-1">
                                        <FaTrashRestore />
                                    </button>
                                    <button onClick={() => sliderDelete(slider.id)} className="btn btn-sm btn-danger me-1">
                                        <FaTrash />
                                    </button>
                                </td>
                                <td className="text-center">{slider.id}</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default SliderList;