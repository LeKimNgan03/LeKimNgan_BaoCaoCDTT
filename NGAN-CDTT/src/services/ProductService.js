import httpAxios from "../httpAxios";

function getAll() {
    return httpAxios.get('product/index');
}

function getById(id) {
    return httpAxios.get(`product/show/${id}`);
}

function create(product) {
    return httpAxios.post('product/store', product);
}

function update(product, id) {
    return httpAxios.post(`product/update/${id}`, product);
}

function remove(id) {
    return httpAxios.delete(`product/destroy/${id}`);
}

function sortdelete(id) {
    return httpAxios.post(`product/sortdelete/${id}`);
}

function restore(id) {
    return httpAxios.post(`product/restore/${id}`);
}

function getTrash() {
    return httpAxios.get('product/trash');
}

// 
function getProductAll(limit, page = 1) {
    return httpAxios.get(`product_all/${limit}/${page}`);
}

function getProductHome(limit, category_id) {
    return httpAxios.get(`product_home/${limit}/${category_id}`);
}

function getProductCategory(category_id, limit, page = 1) {
    return httpAxios.get(`product_category/${category_id}/${limit}/${page}`);
}

function getProductCategoryById(category_id, limit) {
    return httpAxios.get(`product_category/${category_id}/${limit}`);
}

function getProductBySlug(slug) {
    return httpAxios.get(`product_detail/${slug}`);
}

function getProductBrandById(brand_id, limit) {
    return httpAxios.get(`product_brand/${brand_id}/${limit}`);
}

function getSearch(key) {
    return httpAxios.get(`search/${key}`);
}

const productservice = {
    getProductAll,
    getProductHome,
    getProductCategory,
    getProductCategoryById,
    getProductBySlug,
    getProductBrandById,
    getSearch,
    getAll,
    getById,
    create,
    update,
    remove,
    getTrash,
    restore,
    sortdelete
}

export default productservice;