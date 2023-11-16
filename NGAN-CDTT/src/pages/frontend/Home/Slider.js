import { useEffect, useState } from "react";
import { urlImage } from '../../../config';
import sliderservice from "../../../services/SliderService";

function Slider() {
    const [sliders, setSliders] = useState([]);
    useEffect(() => {
        {
            sliderservice.getByPosition('slidershow').then((result) => {
                setSliders(result.data.sliders);
            });
        }
    }, []);

    return (
        <div id="carouselExampleAutoplaying" className="carousel slide" data-bs-ride="carousel">
            <div className="carousel-inner">
                {sliders.map((slider, index) => {
                    return index === 0 ? (
                        <div className="carousel-item active" key={index}>
                            <img src={`${urlImage}slider/${slider.image}`} className="d-block w-100" alt={slider.name} />
                        </div>
                    ) : (
                        <div className="carousel-item" key={index}>
                            <img src={`${urlImage}slider/${slider.image}`} className="d-block w-100" alt={slider.name} />
                        </div>
                    );
                })}
            </div>

            <button
                className="carousel-control-prev"
                type="button"
                data-bs-target="#carouselExampleAutoplaying"
                data-bs-slide="prev">
                <span className="carousel-control-prev-icon" aria-hidden="true" />
                <span className="visually-hidden">Previous</span>
            </button>

            <button
                className="carousel-control-next"
                type="button"
                data-bs-target="#carouselExampleAutoplaying"
                data-bs-slide="next">
                <span className="carousel-control-next-icon" aria-hidden="true" />
                <span className="visually-hidden">Next</span>
            </button>
        </div>
    );
}

export default Slider;