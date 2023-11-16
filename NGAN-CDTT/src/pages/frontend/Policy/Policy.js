import { useEffect, useState } from "react";
import policyservice from "../../../services/PolicyService";

function Policy() {
    const [policy, setPolicy] = useState([]);
    useEffect(() => {
        {
            policyservice.getById(4).then((result) => {
                setPolicy(result.data.policy);
            });
        }
    }, [])

    return (
        <div className="row">
            <h4 className="p-4 pb-0 fw-light text-uppercase">{policy.title}</h4>

            <p className="p-4 pb-0 pt-2">{policy.subtitle}</p>

            <p className="p-4 pb-0 pt-2">{policy.detail}</p>
        </div>
    );
}

export default Policy;