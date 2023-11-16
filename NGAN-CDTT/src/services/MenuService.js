import httpAxios from "../httpAxios";

function getAll() {
    return httpAxios.get('menu/index');
}

function getById(id) {
    return httpAxios.get(`menu/show/${id}`);
}

function create(menu) {
    return httpAxios.post('menu/store', menu);
}

function update(menu, id) {
    return httpAxios.post(`menu/update/${id}`, menu);
}

function remove(id) {
    return httpAxios.delete(`menu/destroy/${id}`);
}

function sortdelete(id) {
    return httpAxios.post(`menu/sortdelete/${id}`);
}

function restore(id) {
    return httpAxios.post(`menu/restore/${id}`);
}

function getTrash() {
    return httpAxios.get('menu/trash');
}

// 
function getByParentId(position, parent_id) {
    return httpAxios.get(`menu_list/${position}/${parent_id}`);
}

const menuservice = {
    getByParentId,
    getAll,
    getById,
    create,
    update,
    remove,
    getTrash,
    restore,
    sortdelete
}

export default menuservice;