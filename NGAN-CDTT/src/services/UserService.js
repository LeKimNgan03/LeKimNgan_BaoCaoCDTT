import httpAxios from "../httpAxios";

function getAll() {
    return httpAxios.get('user/index');
}

function getById(id) {
    return httpAxios.get(`user/show/${id}`);
}

function create(user) {
    return httpAxios.post('user/store', user);
}

function update(user, id) {
    return httpAxios.post(`user/update/${id}`, user);
}

function remove(id) {
    return httpAxios.delete(`user/destroy/${id}`);
}

function sortdelete(id) {
    return httpAxios.post(`user/sortdelete/${id}`);
}

function restore(id) {
    return httpAxios.post(`user/restore/${id}`);
}

function getTrash() {
    return httpAxios.get('user/trash');
}

const userservice = {
    getAll,
    getById,
    create,
    update,
    remove,
    getTrash,
    restore,
    sortdelete
}

export default userservice;