import httpAxios from "../httpAxios";

function getAll() {
    return httpAxios.get('brand/index');
}

function getById(id) {
    return httpAxios.get(`brand/show/${id}`);
}

function create(brand) {
    return httpAxios.post('brand/store', brand);
}

function update(brand, id) {
    return httpAxios.post(`brand/update/${id}`, brand);
}

function remove(id) {
    return httpAxios.delete(`brand/destroy/${id}`);
}

function sortdelete(id) {
    return httpAxios.post(`brand/sortdelete/${id}`);
}

function restore(id) {
    return httpAxios.post(`brand/restore/${id}`);
}

function getTrash() {
    return httpAxios.get('brand/trash');
}

const brandservice = {
    getAll,
    getById,
    create,
    update,
    remove,
    getTrash,
    restore,
    sortdelete
}

export default brandservice;