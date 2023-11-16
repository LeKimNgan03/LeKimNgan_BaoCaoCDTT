import httpAxios from "../httpAxios";

function getAll() {
    return httpAxios.get('post/index');
}

function getById(id) {
    return httpAxios.get(`post/show/${id}`);
}

function create(post) {
    return httpAxios.post('post/store', post);
}

function update(post, id) {
    return httpAxios.post(`post/update/${id}`, post);
}

function remove(id) {
    return httpAxios.delete(`post/destroy/${id}`);
}

function sortdelete(id) {
    return httpAxios.post(`post/sortdelete/${id}`);
}

function restore(id) {
    return httpAxios.post(`post/restore/${id}`);
}

function getTrash() {
    return httpAxios.get('post/trash');
}

// 
function getPostAll() {
    return httpAxios.get(`post_all`);
}

function getPostById(id) {
    return httpAxios.get(`post_detail/${id}`);
}

function getPostList(type, limit) {
    return httpAxios.get(`post_list/${type}/${limit}`);
}

function getPostByTopic(topic_id, page = 1) {
    return httpAxios.get(`post_topic/${topic_id}/${page}`);
}

function getPostTopicById(topic_id, limit) {
    return httpAxios.get(`post_topic/${topic_id}/${limit}`);
}

const postservice = {
    getPostAll,
    getPostById,
    getPostList,
    getPostByTopic,
    getPostTopicById,
    getAll,
    getById,
    create,
    update,
    remove,
    getTrash,
    restore,
    sortdelete
}

export default postservice;