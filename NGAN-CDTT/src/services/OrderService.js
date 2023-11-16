import httpAxios from "../httpAxios";

function getAll() {
    return httpAxios.get('order/index');
}

function getById(id) {
    return httpAxios.get(`order/show/${id}`);
}

function create(order) {
    return httpAxios.post('order/store', order);
}

function update(order, id) {
    return httpAxios.post(`order/update/${id}`, order);
}

function remove(id) {
    return httpAxios.delete(`order/destroy/${id}`);
}

function sortdelete(id) {
    return httpAxios.post(`order/sortdelete/${id}`);
}

function restore(id) {
    return httpAxios.post(`order/restore/${id}`);
}

function getTrash() {
    return httpAxios.get('order/trash');
}

const orderservice = {
    getAll,
    getById,
    create,
    update,
    remove,
    getTrash,
    restore,
    sortdelete
}

export default orderservice;