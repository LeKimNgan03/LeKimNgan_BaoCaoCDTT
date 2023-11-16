import DashBoard from "../pages/backend/DashBoard"

import BrandCreate from "../pages/backend/Brand/BrandCreate";
import BrandList from "../pages/backend/Brand/BrandList";
import BrandShow from "../pages/backend/Brand/BrandShow";
import BrandUpdate from "../pages/backend/Brand/BrandUpdate";
import BrandTrash from "../pages/backend/Brand/BrandTrash";

import CategoryList from "../pages/backend/Category/CategoryList";
import CategoryCreate from "../pages/backend/Category/CategoryCreate";
import CategoryShow from "../pages/backend/Category/CategoryShow";
import CategoryUpdate from "../pages/backend/Category/CategoryUpdate";
import CategoryTrash from "../pages/backend/Category/CategoryTrash";

import ContactList from "../pages/backend/Contact/ContactList";
import ContactShow from "../pages/backend/Contact/ContactShow";
import ContactUpdate from "../pages/backend/Contact/ContactUpdate";
import ContactCreate from "../pages/backend/Contact/ContactCreate";
import ContactTrash from "../pages/backend/Contact/ContactTrash";

import MenuList from "../pages/backend/Menu/MenuList";
import MenuCreate from "../pages/backend/Menu/MenuCreate";
import MenuShow from "../pages/backend/Menu/MenuShow";
import MenuUpdate from "../pages/backend/Menu/MenuUpdate";
import MenuTrash from "../pages/backend/Menu/MenuTrash";

import OrderList from "../pages/backend/Order/OrderList";
import OrderCreate from "../pages/backend/Order/OrderCreate";
import OrderShow from "../pages/backend/Order/OrderShow";
import OrderUpdate from "../pages/backend/Order/OrderUpdate";
import OrderTrash from "../pages/backend/Order/OrderTrash";

import OrderdetailList from "../pages/backend/Orderdetail/OrderdetailList";
import OrderdetailCreate from "../pages/backend/Orderdetail/OrderdetailCreate";
import OrderdetailShow from "../pages/backend/Orderdetail/OrderdetailShow";
import OrderdetailUpdate from "../pages/backend/Orderdetail/OrderdetailUpdate";
import OrderdetailTrash from "../pages/backend/Orderdetail/OrderdetailTrash";

import PolicyList from "../pages/backend/Policy/PolicyList";
import PolicyCreate from "../pages/backend/Policy/PolicyCreate";
import PolicyShow from "../pages/backend/Policy/PolicyShow";
import PolicyUpdate from "../pages/backend/Policy/PolicyUpdate";
import PolicyTrash from "../pages/backend/Policy/PolicyTrash";

import PostList from "../pages/backend/Post/PostList";
import PostCreate from "../pages/backend/Post/PostCreate";
import PostShow from "../pages/backend/Post/PostShow";
import PostUpdate from "../pages/backend/Post/PostUpdate";
import PostTrash from "../pages/backend/Post/PostTrash";

import ProductList from "../pages/backend/Product/ProductList";
import ProductCreate from "../pages/backend/Product/ProductCreate";
import ProductShow from "../pages/backend/Product/ProductShow";
import ProductUpdate from "../pages/backend/Product/ProductUpdate";
import ProductTrash from "../pages/backend/Product/ProductTrash";

import ProductsaleList from "../pages/backend/Productsale/ProductsaleList";
import ProductsaleCreate from "../pages/backend/Productsale/ProductsaleCreate";
import ProductsaleShow from "../pages/backend/Productsale/ProductsaleShow";
import ProductsaleUpdate from "../pages/backend/Productsale/ProductsaleUpdate";
import ProductsaleTrash from "../pages/backend/Productsale/ProductsaleTrash";

import SliderList from "../pages/backend/Slider/SliderList";
import SliderCreate from "../pages/backend/Slider/SliderCreate";
import SliderShow from "../pages/backend/Slider/SliderShow";
import SliderUpdate from "../pages/backend/Slider/SliderUpdate";
import SliderTrash from "../pages/backend/Slider/SliderTrash";

import TopicList from "../pages/backend/Topic/TopicList";
import TopicCreate from "../pages/backend/Topic/TopicCreate";
import TopicShow from "../pages/backend/Topic/TopicShow";
import TopicUpdate from "../pages/backend/Topic/TopicUpdate";
import TopicTrash from "../pages/backend/Topic/TopicTrash";

import UserList from "../pages/backend/User/UserList";
import UserCreate from "../pages/backend/User/UserCreate";
import UserShow from "../pages/backend/User/UserShow";
import UserUpdate from "../pages/backend/User/UserUpdate";
import UserTrash from "../pages/backend/User/UserTrash";

const RouterPrivate = [
    { path: '/admin', component: DashBoard },

    { path: '/admin/brand', component: BrandList },
    { path: '/admin/brand/create', component: BrandCreate },
    { path: '/admin/brand/update/:id', component: BrandUpdate },
    { path: '/admin/brand/show/:id', component: BrandShow },
    { path: '/admin/brand/trash', component: BrandTrash },

    { path: '/admin/category', component: CategoryList },
    { path: '/admin/category/create', component: CategoryCreate },
    { path: '/admin/category/update/:id', component: CategoryUpdate },
    { path: '/admin/category/show/:id', component: CategoryShow },
    { path: '/admin/category/trash', component: CategoryTrash },

    { path: '/admin/contact', component: ContactList },
    { path: '/admin/contact/create', component: ContactCreate },
    { path: '/admin/contact/update/:id', component: ContactUpdate },
    { path: '/admin/contact/show/:id', component: ContactShow },
    { path: '/admin/contact/trash', component: ContactTrash },

    { path: '/admin/menu', component: MenuList },
    { path: '/admin/menu/create', component: MenuCreate },
    { path: '/admin/menu/update/:id', component: MenuUpdate },
    { path: '/admin/menu/show/:id', component: MenuShow },
    { path: '/admin/menu/trash', component: MenuTrash },

    { path: '/admin/order', component: OrderList },
    { path: '/admin/order/create', component: OrderCreate },
    { path: '/admin/order/update/:id', component: OrderUpdate },
    { path: '/admin/order/show/:id', component: OrderShow },
    { path: '/admin/order/trash', component: OrderTrash },

    { path: '/admin/orderdetail', component: OrderdetailList },
    { path: '/admin/orderdetail/create', component: OrderdetailCreate },
    { path: '/admin/orderdetail/update/:id', component: OrderdetailUpdate },
    { path: '/admin/orderdetail/show/:id', component: OrderdetailShow },
    { path: '/admin/orderdetail/trash', component: OrderdetailTrash },

    { path: '/admin/policy', component: PolicyList },
    { path: '/admin/policy/create', component: PolicyCreate },
    { path: '/admin/policy/update/:id', component: PolicyUpdate },
    { path: '/admin/policy/show/:id', component: PolicyShow },
    { path: '/admin/policy/trash', component: PolicyTrash },

    { path: '/admin/post', component: PostList },
    { path: '/admin/post/create', component: PostCreate },
    { path: '/admin/post/update/:id', component: PostUpdate },
    { path: '/admin/post/show/:id', component: PostShow },
    { path: '/admin/post/trash', component: PostTrash },

    { path: '/admin/product', component: ProductList },
    { path: '/admin/product/create', component: ProductCreate },
    { path: '/admin/product/update/:id', component: ProductUpdate },
    { path: '/admin/product/show/:id', component: ProductShow },
    { path: '/admin/product/trash', component: ProductTrash },

    { path: '/admin/productsale', component: ProductsaleList },
    { path: '/admin/productsale/create', component: ProductsaleCreate },
    { path: '/admin/productsale/update/:id', component: ProductsaleUpdate },
    { path: '/admin/productsale/show/:id', component: ProductsaleShow },
    { path: '/admin/productsale/trash', component: ProductsaleTrash },

    { path: '/admin/slider', component: SliderList },
    { path: '/admin/slider/create', component: SliderCreate },
    { path: '/admin/slider/update/:id', component: SliderUpdate },
    { path: '/admin/slider/show/:id', component: SliderShow },
    { path: '/admin/slider/trash', component: SliderTrash },

    { path: '/admin/topic', component: TopicList },
    { path: '/admin/topic/create', component: TopicCreate },
    { path: '/admin/topic/update/:id', component: TopicUpdate },
    { path: '/admin/topic/show/:id', component: TopicShow },
    { path: '/admin/topic/trash', component: TopicTrash },

    { path: '/admin/user', component: UserList },
    { path: '/admin/user/create', component: UserCreate },
    { path: '/admin/user/update/:id', component: UserUpdate },
    { path: '/admin/user/show/:id', component: UserShow },
    { path: '/admin/user/trash', component: UserTrash },

];

export default RouterPrivate;