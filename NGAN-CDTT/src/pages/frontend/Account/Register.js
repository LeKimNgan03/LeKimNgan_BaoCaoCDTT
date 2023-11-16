import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import userservice from "../../../services/UserService";

function Register() {
    const navigate = useNavigate();
    const [email, setEmail] = useState('');
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [status, setStatus] = useState(1);

    async function userStore(event) {
        event.preventDefault();
        const user = new FormData();
        user.append("email", email);
        user.append("username", username);
        user.append("password", password);
        user.append("status", status);
        await userservice.create(user)
        .then((res) => {
            alert(res.data.message)
            navigate('/', { replace: true })
        });
    }

    return (
        <section className="vh-100 d-flex" onSubmit={userStore} method="post">
            <div className="container-fluid h-custom">
                <div className="row d-flex justify-content-center align-items-center h-100">
                    <div className="col-xl-4">
                        <form>
                            <h1 className="fs-1 text-uppercase fw-bold text-center my-2">Đăng ký</h1>
                            {/* <!-- Name input --> */}
                            <div className="form-outline mb-3">
                                <input
                                    type="text"
                                    className="form-control form-control-lg"
                                    value={username}
                                    onChange={(e) => setUsername(e.target.value)}
                                    placeholder="Họ tên" />
                            </div>

                            {/* <!-- Email input --> */}
                            <div className="form-outline mb-3">
                                <input
                                    type="email"
                                    className="form-control form-control-lg"
                                    value={email}
                                    onChange={(e) => setEmail(e.target.value)}
                                    placeholder="Email" />
                            </div>

                            {/* <!-- Password input --> */}
                            <div className="form-outline mb-3">
                                <input
                                    type="password"
                                    className="form-control form-control-lg"
                                    value={password}
                                    onChange={(e) => setPassword(e.target.value)}
                                    placeholder="Nhập mật khẩu" />
                            </div>

                            {/* Register Button */}
                            <div className="text-center text-lg-start mt-4 pt-2">
                                    <button type="submit" className="btn btn-lg text-dark w-100"
                                        style={{ paddingLeft: `2.5rem`, paddingRight: `2.5rem`, backgroundColor: `#E8E2E2` }}>
                                        Đăng ký
                                    </button>
                                <p className="small fw-bold mt-2 pt-1 mb-0 text-center">Bạn đã có tài khoản?
                                    <Link to="/login" className="link-danger mx-1">Đăng nhập</Link>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    );
}

export default Register;