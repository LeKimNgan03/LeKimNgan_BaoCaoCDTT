import { BsTelephoneFill } from "react-icons/bs";
import { GoMail, GoLocation } from "react-icons/go";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import contactservice from '../../../services/ContactService';

function Contact() {
    const navigate = useNavigate();
    const [contact, setContact] = useState([]);

    useEffect(() => {
        {
            contactservice.getAll().then((result) => {
                setContact(result.data.contacts);
            });
        }
    }, []);

    const [name, setName] = useState("");
    const [email, setEmail] = useState("");
    const [content, setContent] = useState("");
    const [status, setStatus] = useState(1);

    async function contactStore(event) {
        event.preventDefault();
        const contact = new FormData();
        contact.append("name", name);
        contact.append("email", email);
        contact.append("content", content);
        contact.append("status", status);
        try {
            await contactservice.create(contact).then((res) => {
                alert(res.data.message);
                navigate("/lien-he", { replace: true });
                window.location.reload();
            });
        } catch (error) {
            console.error(error.response.data);
        }
    }

    return (
        <form onSubmit={contactStore} method="post">
            <h4 className="p-3 pb-0 fw-light text-uppercase">LIÊN HỆ VỚI CHÚNG TÔI</h4>

            <hr className="mx-3" />

            <div className="row p-3">
                <div className="col-md-3">
                    <h5 className="pb-2">Địa chỉ của chúng tôi</h5>
                    <p><span
                        className="p-1 rounded-4"
                        style={{
                            marginRight: 5,
                            backgroundColor: `#E8E2E2`,
                            color: `#000`
                        }}><GoLocation /></span> TP.Thủ Đức, TP.HCM</p>

                    <p><span
                        className="p-1 rounded-4"
                        style={{
                            marginRight: 5,
                            backgroundColor: `#E8E2E2`,
                            color: `#000`
                        }}><GoMail /></span> info@gmail.com</p>

                    <p><span
                        className="p-1 rounded-4"
                        style={{
                            marginRight: 5,
                            backgroundColor: `#E8E2E2`,
                            color: `#000`
                        }}><BsTelephoneFill /></span> + 01 234 567 88</p>

                    <p><span
                        className="p-1 rounded-4"
                        style={{
                            marginRight: 5,
                            backgroundColor: `#E8E2E2`,
                            color: `#000`
                        }}><BsTelephoneFill /></span> + 01 234 567 88</p>
                </div>

                <div className="col-md-9">
                    <h5 className="pb-2">Thông tin liên hệ</h5>
                    <div className="contact-form">
                        <div className="mb-3">
                            <input
                                type="text"
                                name="name"
                                value={name}
                                onChange={(e) => setName(e.target.value)}
                                className="form-control"
                                id="exampleFormControlInput1"
                                placeholder="Tên của bạn" />
                        </div>

                        <div className="mb-3">
                            <input
                                type="email"
                                name="name"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                                className="form-control"
                                id="exampleFormControlInput1"
                                placeholder="Địa chỉ Email" />
                        </div>

                        <div className="mb-3">
                            <textarea
                                name="name"
                                value={content}
                                onChange={(e) => setContent(e.target.value)}
                                className="form-control"
                                id="exampleFormControlTextarea1"
                                rows="3"
                                placeholder="Nội dung" />
                        </div>

                        <button
                            className="btn btn-outline-light text-dark"
                            style={{ backgroundColor: `#E8E2E2` }}
                            type="submit">
                            Gửi đi
                        </button>
                    </div>
                </div>
            </div>
        </form>
    );
}

export default Contact;