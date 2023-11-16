function ProductSaleItem(props) {
    function renderNumber(number) {
        // Using the ternary operator to avoid the error
        const digits = (number || '').toString().split("");
        let result = "";
        for (let i = 0; i < digits.length; i++) {
            let index = digits.length - 1;
            result += digits[i];
            if (i % 3 === 0 && index !== 0) {
                result += ".";
            }
            index--;
        }
        return result;
    }

    return (
        <div className="col-lg-4">
            <div className="card" style={{ width: `18rem` }}>
                <img src="..." className="card-img-top"/>
                <div className="card-body">
                    <h5 className="card-title">{props.productsale.product_id.name}</h5>
                    <p className="card-text text-center text-danger fw-bold">{renderNumber(props.productsale.pricesale)}VNĐ</p>
                    <p className="card-text">Còn: {props.productsale.qty}</p>
                </div>
            </div>
        </div>
    );
}

export default ProductSaleItem;