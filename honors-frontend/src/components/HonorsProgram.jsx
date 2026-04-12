import { useEffect, useState } from "react";
import api from "../api/api";

export default function HonorsProgram() {
  const [programs, setPrograms] = useState([]);
  const [program, setProgram] = useState({
    programName: "",
    departmentId: "",
    maxSeats: "",
    startYear: "",
    status: ""
  });

  useEffect(() => {
    api.get("/programs").then(res => setPrograms(res.data));
  }, []);

  const submit = e => {
    e.preventDefault();
    api.post("/programs", program).then(() => {
      alert("Program Added");
      api.get("/programs").then(res => setPrograms(res.data));
    });
  };

  return (
    <div className="page">
      <div className="section">
        <h2>Honors Programs</h2>
        <div className="card-grid">
          <div className="stat-card">
            <div className="stat-title">Total Programs</div>
            <div className="stat-value">{programs.length}</div>
          </div>
          <div className="stat-card">
            <div className="stat-title">Active Programs</div>
            <div className="stat-value">
              {programs.filter(p => String(p.status || "").toLowerCase() === "active").length}
            </div>
          </div>
        </div>
      </div>
      <form onSubmit={submit}>
        <input placeholder="Program Name" onChange={e => setProgram({...program, programName:e.target.value})}/>
        <input placeholder="Department ID" onChange={e => setProgram({...program, departmentId:e.target.value})}/>
        <input placeholder="Max Seats" onChange={e => setProgram({...program, maxSeats:e.target.value})}/>
        <input placeholder="Start Year" onChange={e => setProgram({...program, startYear:e.target.value})}/>
        <input placeholder="Status" onChange={e => setProgram({...program, status:e.target.value})}/>
        <button>Add Program</button>
      </form>
      <ul>
        {programs.map(p => (
          <li key={p.programId}>
            <span>{p.programName} | Seats: {p.maxSeats} | Dept: {p.departmentId}</span>
            <span className="tag">{p.status || "N/A"}</span>
          </li>
        ))}
      </ul>
    </div>
  );
}
