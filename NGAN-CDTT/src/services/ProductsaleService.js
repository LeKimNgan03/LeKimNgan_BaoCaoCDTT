import httpAxios from "../httpAxios";

function getAll() {
    return httpAxios.get('productsale/index');
}

function getById(id) {
    return httpAxios.get(`productsale/show/${id}`);
}

function create(productsale) {
    return httpAxios.post('productsale/store', productsale);
}

function update(productsale, id) {
    return httpAxios.post(`productsale/update/${id}`, productsale);
}

function remove(id) {
    return httpAxios.delete(`productsale/destroy/${id}`);
}

function sortdelete(id) {
    return httpAxios.post(`productsale/sortdelete/${id}`);
}

function restore(id) {
    return httpAxios.post(`productsale/restore/${id}`);
}

function getTrash() {
    return httpAxios.get('productsale/trash');
}

const productsaleservice = {
    getAll,
    getById,
    create,
    update,
    remove,
    getTrash,
    restore,
    sortdelete
}

export default productsaleservice;