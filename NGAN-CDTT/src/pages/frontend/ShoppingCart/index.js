import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import { urlImage } from "../../../config";
import { AiOutlineClose } from 'react-icons/ai';

function ShoppingCart() {
    const [cart, setCart] = useState([]);
    const [cartCount, setCartCount] = useState(0);

    useEffect(() => {
        const cartData = localStorage.getItem('cart');
        if (cartData) {
            setCart(JSON.parse(cartData));
        }
    }, []);

    useEffect(() => {
        setCartCount(calculateCartCount(cart));
    }, [cart]);

    const updateQuantity = (index, quantity) => {
        const updatedCart = [...cart];
        updatedCart[index].quantity = quantity;
        updatedCart[index].total = updatedCart[index].price * quantity;
        setCart(updatedCart);
        setCartCount(calculateCartCount(updatedCart));
        localStorage.setItem('cart', JSON.stringify(updatedCart)); // Cập nhật lại localStorage
    };

    const removeProduct = (index) => {
        const updatedCart = [...cart];
        updatedCart.splice(index, 1);
        setCart(updatedCart);
        setCartCount(calculateCartCount(updatedCart));
        localStorage.setItem('cart', JSON.stringify(updatedCart)); // Cập nhật lại localStorage
    };

    const calculateCartCount = (cartItems) => {
        return cartItems.reduce((total, item) => total + item.quantity, 0);
    };

    // Format Number Price
    function renderNumber(number) {
        // Using the ternary operator to avoid the error
        const digits = (number || '').toString().split("");
        let result = "";
        for (let i = 0; i < digits.length; i++) {
            result += digits[i];
            if (i % 3 === 0) {
                result += ".";
            }
        }
        return result;
    }

    return (
        <section className="shopping-cart mx-2">
            <h4 className="p-3 pb-0 fw-bold text-uppercase text-center">Giỏ hàng của bạn</h4>
            <div className="container my-4">
                {cart.map((product, index) => {
                    return index != null ? (
                        <table className="table">
                            <thead>
                                <tr>
                                    <th className="text-center" scope="col">Sản phẩm</th>
                                    <th className="text-center" scope="col">Giá</th>
                                    <th className="text-center" scope="col">Số lượng</th>
                                    <th className="text-center" scope="col">Thành tiền</th>
                                    <th className="text-center" scope="col">Xóa</th>
                                </tr>
                            </thead>
                            <tbody key={index}>
                                <tr>
                                    {/* Img & Name */}
                                    <td className="product col-md-2">
                                        <div className="product">
                                            <figure className="product-media">
                                                <Link to={`/product-detail/${product.slug}`}>
                                                    <img
                                                        style={{ width: 150 }}
                                                        src={`${urlImage}product/${product.image}`}
                                                        alt="Product image" />
                                                </Link>
                                                <p className="text-center">{product.name}</p>
                                            </figure>
                                        </div>
                                    </td>

                                    {/* Price */}
                                    <td className="price-col text-center">{renderNumber(product.price)}VNĐ</td>

                                    {/* Quantity */}
                                    <td className="quantity-col col-md-1">
                                        <div className="cart-product-quantity">
                                            <input
                                                type="number"
                                                className="form-control text-center"
                                                defaultValue={product.quantity || 1} // Mặc định số lượng là 1
                                                min={1}
                                                max={100}
                                                step={1}
                                                data-decimals={0}
                                                required=""
                                                onChange={(e) => updateQuantity(index, parseInt(e.target.value))}
                                            />
                                        </div>
                                    </td>

                                    {/* Total Price */}
                                    <td className="total-col text-center" >{renderNumber(product.total || product.price)}VNĐ</td>

                                    {/* Remove Button */}
                                    <td className="remove-col text-center">
                                        <div className="btn btn-sm btn-outline-dark rounded-4 me-1" onClick={() => removeProduct(index)}>
                                            <AiOutlineClose />
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    ) : (
                        <p key={index}>Không có sản phẩm nào trong giỏ hàng. Quay lại cửa hàng để tiếp tục mua sắm.</p>
                    );
                })}
                <div className="border rounded-5 p-3">
                    <h4 className="text-end">Tổng tiền: VNĐ</h4>
                    <div className="d-flex justify-content-end mt-3">
                        <Link to="/">
                            <button className="btn btn-light rounded-4 mx-3">Tiếp tục mua hàng</button>
                        </Link>
                        <Link to="/">
                            <button className="btn btn-danger rounded-4">Tiến hành đặt hàng</button>
                        </Link>
                    </div>
                </div>
            </div>
        </section>
    );
}

export default ShoppingCart;