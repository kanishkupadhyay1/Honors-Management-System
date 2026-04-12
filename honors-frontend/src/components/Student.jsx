import { useEffect, useState } from "react";
import api from "../api/api";

export default function Student() {
  const [students, setStudents] = useState([]);
  const [student, setStudent] = useState({
    name: "",
    emailId: "",
    phoneNumber: "",
    year: "",
    deptId: "",
    status: ""
  });

  useEffect(() => {
    api.get("/students").then(res => setStudents(res.data));
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();
    api.post("/students", student).then(() => {
      alert("Student Added");
    });
  };

  return (
    <div className="page">
      <div className="section">
        <h2>Students</h2>
        <div className="card-grid">
          <div className="stat-card">
            <div className="stat-title">Total Students</div>
            <div className="stat-value">{students.length}</div>
          </div>
          <div className="stat-card">
            <div className="stat-title">Active Status</div>
            <div className="stat-value">
              {students.filter(s => String(s.status || "").toLowerCase() === "active").length}
            </div>
          </div>
          <div className="stat-card">
            <div className="stat-title">Departments</div>
            <div className="stat-value">
              {new Set(students.map(s => s.deptId)).size || 0}
            </div>
          </div>
        </div>
      </div>

      <form onSubmit={handleSubmit}>
        <input placeholder="Name" onChange={e => setStudent({...student, name:e.target.value})}/>
        <input placeholder="Email" onChange={e => setStudent({...student, emailId:e.target.value})}/>
        <input placeholder="Phone" onChange={e => setStudent({...student, phoneNumber:e.target.value})}/>
        <input placeholder="Year" onChange={e => setStudent({...student, year:e.target.value})}/>
        <input placeholder="Dept ID" onChange={e => setStudent({...student, deptId:e.target.value})}/>
        <input placeholder="Status" onChange={e => setStudent({...student, status:e.target.value})}/>
        <button>Add Student</button>
      </form>

      <div className="table-wrap">
        <table>
          <thead>
            <tr>
              <th>ID</th><th>Name</th><th>Email</th><th>Year</th><th>Dept</th><th>Status</th>
            </tr>
          </thead>
          <tbody>
            {students.map(s => (
              <tr key={s.studentId}>
                <td>{s.studentId}</td>
                <td>{s.name}</td>
                <td>{s.emailId}</td>
                <td>{s.year}</td>
                <td>{s.deptId}</td>
                <td><span className="tag">{s.status || "N/A"}</span></td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
