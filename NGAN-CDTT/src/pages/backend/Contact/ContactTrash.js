import { useEffect, useState } from "react";
import { FaArrowLeft, FaTrashRestore } from 'react-icons/fa';
import { BsFillTrashFill } from "react-icons/bs";
import { Link } from "react-router-dom";
import contactservice from '../../../services/ContactService';

function ContactList() {
    const [statusde, setStatusDelete] = useState(0);
    const [contacts, setContacts] = useState([]);

    useEffect(() => {
        {
            contactservice.getTrash().then((result) => {
                setContacts(result.data.contacts);
            });
        }
    }, [statusde]);

    function contactDelete(id) {
        contactservice.remove(id).then((result) => {
            console.log(result.data.message);
            setStatusDelete(result.data.id);
        });
    }

    function restore(id) {
        contactservice.restore(id).then((result) => {
            console.log(result.data.message);
            setStatusDelete(result.data.id);
        });
    }

    return (
        <section className="card">
            <div className="card-header">
                <div className="row">
                    <div className="col-md-6">
                        <strong className="text-dark">THÙNG RÁC</strong>
                    </div>
                    <div className="col-md-6 text-end">
                        <Link to="/admin/contact" className="btn btn-sm btn-success">
                            <FaArrowLeft /> Quay Về
                        </Link>
                    </div>
                </div>
            </div>

            <div className="card-body">
                <table className="table table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th style={{ width: 50 }} className="text-center">#</th>
                            <th style={{ width: 130 }} className="text-center">Tên liên hệ</th>
                            <th style={{ width: 130 }} className="text-center">Email</th>
                            <th style={{ width: 130 }} className="text-center">Nội dung</th>
                            <th style={{ width: 140 }} className="text-center">Chức Năng</th>
                            <th style={{ width: 30 }} className="text-center">ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        {contacts.map((contact, index) =>
                            <tr key={index}>
                                <td className="text-center"><input type="checkbox" /></td>
                                <td className="text-center">{contact.name}</td>
                                <td className="text-center">{contact.email}</td>
                                <td className="text-center">{contact.content}</td>
                                <td className="text-center">
                                    <button onClick={() => restore(contact.id)} className="btn btn-sm btn-success me-1">
                                        <FaTrashRestore />
                                    </button>
                                    <button onClick={() => contactDelete(contact.id)} className="btn btn-sm btn-danger">
                                        <BsFillTrashFill />
                                    </button>
                                </td>
                                <td className="text-center">{contact.id}</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </section>
    );
}

export default ContactList;