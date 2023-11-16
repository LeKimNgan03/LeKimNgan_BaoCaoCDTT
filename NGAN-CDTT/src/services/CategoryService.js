import httpAxios from "../httpAxios";

function getAll() {
    return httpAxios.get('category/index');
}

function getById(id) {
    return httpAxios.get(`category/show/${id}`);
}

function create(category) {
    return httpAxios.post('category/store', category);
}

function update(category, id) {
    return httpAxios.post(`category/update/${id}`, category);
}

function remove(id) {
    return httpAxios.delete(`category/destroy/${id}`);
}

function sortdelete(id) {
    return httpAxios.post(`category/sortdelete/${id}`);
}

function restore(id) {
    return httpAxios.post(`category/restore/${id}`);
}

function getTrash() {
    return httpAxios.get('category/trash');
}

// 
function getCategoryByParentId(parent_id) {
    return httpAxios.get(`category_list/${parent_id}`);
}

function getBySlug(slug) {
    return httpAxios.get(`category/show/${slug}`);
}

const categoryservice = {
    getCategoryByParentId,
    getBySlug,
    getAll,
    getById,
    create,
    update,
    remove,
    getTrash,
    restore,
    sortdelete
}

export default categoryservice;