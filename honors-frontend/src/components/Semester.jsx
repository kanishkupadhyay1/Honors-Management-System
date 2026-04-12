import { useEffect, useState } from "react";
import api from "../api/api";

export default function Semester() {
  const [semesters, setSemesters] = useState([]);
  const [semester, setSemester] = useState({
    semesterNo: "",
    academicYear: ""
  });

  useEffect(() => {
    api.get("/semesters").then(res => setSemesters(res.data));
  }, []);

  const submit = e => {
    e.preventDefault();
    api.post("/semesters", semester).then(() => {
      alert("Semester Added");
      api.get("/semesters").then(res => setSemesters(res.data));
    });
  };

  return (
    <div className="page">
      <div className="section">
        <h2>Semesters</h2>
        <div className="card-grid">
          <div className="stat-card">
            <div className="stat-title">Total Semesters</div>
            <div className="stat-value">{semesters.length}</div>
          </div>
        </div>
      </div>
      <form onSubmit={submit}>
        <input placeholder="Semester No" onChange={e => setSemester({...semester, semesterNo:e.target.value})}/>
        <input placeholder="Academic Year" onChange={e => setSemester({...semester, academicYear:e.target.value})}/>
        <button>Add Semester</button>
      </form>
      <ul>
        {semesters.map(s => (
          <li key={s.semesterId}>
            <span>Semester {s.semesterNo}</span>
            <span className="tag">{s.academicYear}</span>
          </li>
        ))}
      </ul>
    </div>
  );
}
