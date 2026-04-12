import { useState, useEffect } from "react";
import api from "../api/api";

export default function Application() {
  const [apps, setApps] = useState([]);
  const [app, setApp] = useState({
    studentId: "",
    programId: "",
    applicationDate: "",
    status: ""
  });

  useEffect(() => {
    api.get("/applications").then(res => setApps(res.data));
  }, []);

  const submit = e => {
    e.preventDefault();
    api.post("/applications", app).then(() => {
      alert("Application Submitted");
      api.get("/applications").then(res => setApps(res.data));
    });
  };

  return (
    <div className="page">
      <div className="section">
        <h2>Applications</h2>
        <div className="card-grid">
          <div className="stat-card">
            <div className="stat-title">Total Applications</div>
            <div className="stat-value">{apps.length}</div>
          </div>
          <div className="stat-card">
            <div className="stat-title">Pending</div>
            <div className="stat-value">
              {apps.filter(a => String(a.status || "").toLowerCase() === "pending").length}
            </div>
          </div>
          <div className="stat-card">
            <div className="stat-title">Approved</div>
            <div className="stat-value">
              {apps.filter(a => String(a.status || "").toLowerCase() === "approved").length}
            </div>
          </div>
        </div>
      </div>

      <form onSubmit={submit}>
        <input placeholder="Student ID" onChange={e=>setApp({...app, studentId:e.target.value})}/>
        <input placeholder="Program ID" onChange={e=>setApp({...app, programId:e.target.value})}/>
        <input placeholder="Application Date (YYYY-MM-DD)" onChange={e=>setApp({...app, applicationDate:e.target.value})}/>
        <input placeholder="Status" onChange={e=>setApp({...app, status:e.target.value})}/>
        <button>Apply</button>
      </form>

      <ul>
        {apps.map(a => (
          <li key={a.applicationId}>
            <span>Student {a.studentId} -> Program {a.programId}</span>
            <span className="tag">{a.status || "N/A"}</span>
          </li>
        ))}
      </ul>
    </div>
  );
}
