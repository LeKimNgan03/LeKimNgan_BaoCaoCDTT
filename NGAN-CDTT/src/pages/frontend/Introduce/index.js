import { useEffect, useState } from "react";
import policyservice from "../../../services/PolicyService";

function Introduce() {
    const [policy, setPolicy] = useState([]);
    useEffect(() => {
        {
            policyservice.getById(5).then((result) => {
                setPolicy(result.data.policy);
            });
        }
    }, [])

    return (
        <div className="">
            <h4 className="p-3 pb-0 fw-light text-uppercase">{policy.title}</h4>

            <hr className="mx-3" />

            <div className="row p-3">
                <p>{policy.subtitle}</p>
                <p>{policy.detail}</p>
            </div>
        </div>
    );
}

export default Introduce;