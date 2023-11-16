import Home from "../pages/frontend/Home";
import Introduce from "../pages/frontend/Introduce";
import Product from "../pages/frontend/Product";
import Post from "../pages/frontend/Blog";
import Contact from "../pages/frontend/Contact";

import Login from "../pages/frontend/Account/Login";
import Register from "../pages/frontend/Account/Register";

import BlogDetail from "../pages/frontend/BlogDetail";
import BlogTopic from "../pages/frontend/BlogTopic";
import ProductDetail from "../pages/frontend/ProductDetail";
import ProductCategory from "../pages/frontend/ProductCategory";
import ProductBrand from "../pages/frontend/ProductBrand";

import ShoppingCart from "../pages/frontend/ShoppingCart";

import Policy from "../pages/frontend/Policy/Policy";
import PolicyDelivery from "../pages/frontend/Policy/PolicyDelivery";
import PolicyReturn from "../pages/frontend/Policy/PolicyReturn";
import PolicyPrivacy from "../pages/frontend/Policy/PolicyPrivacy";

import Search from "../pages/frontend/Search";

const RouterPublic = [
    { path: '/', component: Home },
    { path: '/gioi-thieu', component: Introduce },
    { path: '/san-pham', component: Product },
    { path: '/blog', component: Post },
    { path: '/lien-he', component: Contact },

    { path: '/login', component: Login },
    { path: '/register', component: Register },

    { path: '/blog-detail/:id', component: BlogDetail },
    { path: '/danh-muc-bai-viet/:slug', component: BlogTopic },
    { path: '/danh-muc-san-pham/:slug', component: ProductCategory },
    { path: '/thuong-hieu/:slug', component: ProductBrand },
    { path: '/product-detail/:slug', component: ProductDetail },

    { path: '/cart', component: ShoppingCart },

    { path: '/chinh-sach-van-chuyen', component: PolicyDelivery },
    { path: '/chinh-sach-doi-tra', component: PolicyReturn },
    { path: '/chinh-sach-bao-mat', component: PolicyPrivacy },
    { path: '/dieu-khoan', component: Policy },

    { path: '/tim-kiem/:key', component: Search },
];

export default RouterPublic;