import axios from "axios";
import { urlAPI } from "./config";

const httpAxios = axios.create({
    baseURL: urlAPI,
    timeout: 30_000,
    headers: { 'X-Custom-Header': 'foobar' }
});

export default httpAxios;