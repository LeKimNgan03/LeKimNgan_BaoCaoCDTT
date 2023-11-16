import { Link, useNavigate } from "react-router-dom";
import userservice from "../../../services/UserService";
import { useState } from "react";

function Login() {
    const navigate = useNavigate();
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");

    async function loginAdd(event) {
        event.preventDefault();
        var user = new FormData();
        user.append("email", email);
        user.append("password", password);
        try {
            await userservice.Login(user)
                .then((res) => {
                    if (res.data.success === true) {
                        alert(res.data.message);
                        navigate('/', { replace: true });
                    }
                    else {
                        alert(res.data.message);
                        navigate('/login', { replace: true });
                    }
                });
        } catch (error) {
            console.error(error);
        }
    }

    return (
        <section className="vh-100 d-flex">
            <div className="container-fluid h-custom">
                <div className="row d-flex justify-content-center align-items-center h-100">
                    <div className="col-xl-4 ">
                        <form onSubmit={loginAdd} method="">
                            <h1 className="fs-1 text-uppercase fw-bold text-center my-2">Đăng nhập</h1>
                            {/* <!-- Email input --> */}
                            <div className="form-outline mb-4">
                                <input type="email" className="form-control form-control-lg"
                                    value={email} onChange={(e) => setEmail(e.target.value)}
                                    placeholder="Email" />
                            </div>

                            {/* <!-- Password input --> */}
                            <div className="form-outline mb-3">
                                <input type="password" className="form-control form-control-lg"
                                    value={password} onChange={(e) => setPassword(e.target.value)}
                                    placeholder="Mật khẩu" />
                                <a href="#!" className="text-body text-decoration-none"><p className="text-end">Quên mật khẩu?</p></a>
                            </div>

                            {/* Login Button */}
                            <div className="text-center text-lg-start mt-4 pt-2">
                                <Link to="/">
                                    <button type="button" className="btn btn-lg text-dark w-100"
                                        style={{ paddingLeft: `2.5rem`, paddingRight: `2.5rem`, backgroundColor: `#E8E2E2` }}>
                                        Đăng nhập
                                    </button>
                                </Link>
                                <p className="small fw-bold mt-2 pt-1 mb-0 text-center">Bạn chưa có tài khoản?
                                    <Link to="/register" className="link-danger mx-1">Đăng ký</Link>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    );
}

export default Login;