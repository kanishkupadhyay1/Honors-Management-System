import { useEffect, useState } from "react";
import api from "../api/api";

export default function AcademicPerformance() {
  const [records, setRecords] = useState([]);
  const [record, setRecord] = useState({
    studentId: "",
    semesterId: "",
    semesterGpa: "",
    creditsEarned: "",
    backlogs: ""
  });

  useEffect(() => {
    api.get("/academic-performance").then(res => setRecords(res.data));
  }, []);

  const submit = e => {
    e.preventDefault();
    api.post("/academic-performance", record).then(() => {
      alert("Academic Performance Added");
      api.get("/academic-performance").then(res => setRecords(res.data));
    });
  };

  return (
    <div className="page">
      <div className="section">
        <h2>Academic Performance</h2>
        <div className="card-grid">
          <div className="stat-card">
            <div className="stat-title">Records</div>
            <div className="stat-value">{records.length}</div>
          </div>
        </div>
      </div>
      <form onSubmit={submit}>
        <input placeholder="Student ID" onChange={e => setRecord({...record, studentId:e.target.value})}/>
        <input placeholder="Semester ID" onChange={e => setRecord({...record, semesterId:e.target.value})}/>
        <input placeholder="Semester GPA" onChange={e => setRecord({...record, semesterGpa:e.target.value})}/>
        <input placeholder="Credits Earned" onChange={e => setRecord({...record, creditsEarned:e.target.value})}/>
        <input placeholder="Backlogs" onChange={e => setRecord({...record, backlogs:e.target.value})}/>
        <button>Add Record</button>
      </form>
      <ul>
        {records.map(r => (
          <li key={r.performanceId}>
            <span>Student {r.studentId} | Semester {r.semesterId} | GPA {r.semesterGpa}</span>
            <span className="tag">Credits {r.creditsEarned} | Backlogs {r.backlogs}</span>
          </li>
        ))}
      </ul>
    </div>
  );
}
