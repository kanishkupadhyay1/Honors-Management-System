import { useEffect, useState } from "react";
import api from "../api/api";

export default function EligibilityCriteria() {
  const [criteriaList, setCriteriaList] = useState([]);
  const [criteria, setCriteria] = useState({
    programId: "",
    minCgpa: "",
    minCredits: "",
    maxBacklogs: ""
  });

  useEffect(() => {
    api.get("/eligibility-criteria").then(res => setCriteriaList(res.data));
  }, []);

  const submit = e => {
    e.preventDefault();
    api.post("/eligibility-criteria", criteria).then(() => {
      alert("Criteria Added");
      api.get("/eligibility-criteria").then(res => setCriteriaList(res.data));
    });
  };

  return (
    <div className="page">
      <div className="section">
        <h2>Eligibility Criteria</h2>
        <div className="card-grid">
          <div className="stat-card">
            <div className="stat-title">Criteria Sets</div>
            <div className="stat-value">{criteriaList.length}</div>
          </div>
        </div>
      </div>
      <form onSubmit={submit}>
        <input placeholder="Program ID" onChange={e => setCriteria({...criteria, programId:e.target.value})}/>
        <input placeholder="Min CGPA" onChange={e => setCriteria({...criteria, minCgpa:e.target.value})}/>
        <input placeholder="Min Credits" onChange={e => setCriteria({...criteria, minCredits:e.target.value})}/>
        <input placeholder="Max Backlogs" onChange={e => setCriteria({...criteria, maxBacklogs:e.target.value})}/>
        <button>Add Criteria</button>
      </form>
      <ul>
        {criteriaList.map(c => (
          <li key={c.criteriaId}>
            <span>Program {c.programId} | Min CGPA {c.minCgpa} | Min Credits {c.minCredits}</span>
            <span className="tag">Max Backlogs {c.maxBacklogs}</span>
          </li>
        ))}
      </ul>
    </div>
  );
}
