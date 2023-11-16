import httpAxios from "../httpAxios";

function getAll() {
    return httpAxios.get('policy/index');
}

function getById(id) {
    return httpAxios.get(`policy/show/${id}`);
}

function create(policy) {
    return httpAxios.post('policy/store', policy);
}

function update(policy, id) {
    return httpAxios.post(`policy/update/${id}`, policy);
}

function remove(id) {
    return httpAxios.delete(`policy/destroy/${id}`);
}

function sortdelete(id) {
    return httpAxios.post(`policy/sortdelete/${id}`);
}

function restore(id) {
    return httpAxios.post(`policy/restore/${id}`);
}

function getTrash() {
    return httpAxios.get('policy/trash');
}

const policyservice = {
    getAll,
    getById,
    create,
    update,
    remove,
    getTrash,
    restore,
    sortdelete
}

export default policyservice;