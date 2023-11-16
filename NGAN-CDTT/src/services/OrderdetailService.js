import httpAxios from "../httpAxios";

function getAll() {
    return httpAxios.get('orderdetail/index');
}

function getById(id) {
    return httpAxios.get(`orderdetail/show/${id}`);
}

function create(orderdetail) {
    return httpAxios.post('orderdetail/store', orderdetail);
}

function update(orderdetail, id) {
    return httpAxios.post(`orderdetail/update/${id}`, orderdetail);
}

function remove(id) {
    return httpAxios.delete(`orderdetail/destroy/${id}`);
}

function sortdelete(id) {
    return httpAxios.post(`orderdetail/sortdelete/${id}`);
}

function restore(id) {
    return httpAxios.post(`orderdetail/restore/${id}`);
}

function getTrash() {
    return httpAxios.get('orderdetail/trash');
}

const orderdetailservice = {
    getAll,
    getById,
    create,
    update,
    remove,
    getTrash,
    restore,
    sortdelete
}

export default orderdetailservice;