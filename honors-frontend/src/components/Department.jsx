import { useEffect, useState } from "react";
import api from "../api/api";

export default function Department() {
  const [departments, setDepartments] = useState([]);
  const [department, setDepartment] = useState({
    departmentName: "",
    hodName: "",
    facultyIncharge: ""
  });

  useEffect(() => {
    api.get("/departments").then(res => setDepartments(res.data));
  }, []);

  const submit = e => {
    e.preventDefault();
    api.post("/departments", department).then(() => {
      alert("Department Added");
      api.get("/departments").then(res => setDepartments(res.data));
    });
  };

  return (
    <div className="page">
      <div className="section">
        <h2>Departments</h2>
        <div className="card-grid">
          <div className="stat-card">
            <div className="stat-title">Total Departments</div>
            <div className="stat-value">{departments.length}</div>
          </div>
        </div>
      </div>
      <form onSubmit={submit}>
        <input placeholder="Department Name" onChange={e => setDepartment({...department, departmentName:e.target.value})}/>
        <input placeholder="HOD Name" onChange={e => setDepartment({...department, hodName:e.target.value})}/>
        <input placeholder="Faculty Incharge" onChange={e => setDepartment({...department, facultyIncharge:e.target.value})}/>
        <button>Add Department</button>
      </form>
      <ul>
        {departments.map(d => (
          <li key={d.departmentId}>
            <span>{d.departmentName}</span>
            <span className="tag">HOD: {d.hodName || "N/A"}</span>
          </li>
        ))}
      </ul>
    </div>
  );
}
