import { BsTelephoneFill } from "react-icons/bs";
import { GoMail, GoLocation } from "react-icons/go";
import { Link } from "react-router-dom";

function Footer() {
    return (
        <footer
            className="text-center text-lg-start"
            style={{ backgroundColor: `#E8E2E2` }}>
            <div className="container p-6 pb-0 p-2">
                <section className="">
                    <div className="row">
                        <div className="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                            <h6 className="text-uppercase mb-4 font-weight-bold">douce muse</h6>
                            <p>
                                Trang phục bạn sẽ không bao giờ là hoàn chỉnh nếu không có nước hoa!
                            </p>
                            <p>
                                Nước hoa tốt thực sự là một loại cocktail mạnh hòa trộn những kỷ niệm và cảm xúc.
                            </p>
                        </div>

                        <hr className="w-100 clearfix d-md-none" />

                        <div className="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                            <h6 className="text-uppercase mb-4 font-weight-bold">Hỗ trợ</h6>
                            <p><Link to="/gioi-thieu" className="text-dark text-decoration-none">Giới thiệu</Link></p>
                            <p><Link to="/san-pham" className="text-dark text-decoration-none">Sản phẩm</Link></p>
                            <p><Link to="/blog" className="text-dark text-decoration-none">Bài viết</Link></p>
                            <p><Link to="/lien-he" className="text-dark text-decoration-none">Liên hệ</Link></p>
                        </div>

                        <hr className="w-100 clearfix d-md-none" />

                        <div className="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                            <h6 className="text-uppercase mb-4 font-weight-bold">Chính sách</h6>
                            <p><Link to="/chinh-sach-van-chuyen" className="text-dark text-decoration-none">Chính sách vận chuyển</Link></p>
                            <p><Link to="/chinh-sach-doi-tra" className="text-dark text-decoration-none">Chính sách đổi trả</Link></p>
                            <p><Link to="/chinh-sach-bao-mat" className="text-dark text-decoration-none">Chính sách bảo mật</Link></p>
                            <p><Link to="/dieu-khoan" className="text-dark text-decoration-none">Điều khoản dịch vụ</Link></p>
                        </div>

                        <hr className="w-100 clearfix d-md-none" />

                        <div className="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                            <h6 className="text-uppercase mb-4 font-weight-bold">Liên hệ</h6>
                            <p><i className="fas fa-home mr-3" /><GoLocation /> TP.Thủ Đức, TP.HCM</p>
                            <p><i className="fas fa-envelope mr-3" /><GoMail /> info@gmail.com</p>
                            <p><i className="fas fa-phone mr-3" /><BsTelephoneFill /> + 01 234 567 88</p>
                            <p><i className="fas fa-phone mr-3" /><BsTelephoneFill /> + 01 234 567 88</p>
                        </div>
                    </div>
                </section>
            </div>
        </footer>
    );
}

export default Footer;