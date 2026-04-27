import { useEffect, useState } from "react";
import api from "../api/api";

const labels = {
  students: "Students",
  departments: "Departments",
  programs: "Programs",
  applications: "Applications",
  semesters: "Semesters",
  academicPerformance: "Academic Performance",
  eligibilityCriteria: "Eligibility Criteria",
  selections: "Selections"
};

export default function DatabaseStatus() {
  const [status, setStatus] = useState(null);
  const [error, setError] = useState("");

  useEffect(() => {
    api.get("/db-status")
      .then(res => {
        setStatus(res.data);
        setError("");
      })
      .catch(() => setError("Unable to connect to MySQL through the backend."));
  }, []);

  const countEntries = status
    ? Object.entries(status).filter(([key]) => key !== "database")
    : [];

  return (
    <div className="page">
      <div className="section">
        <h2>Database Status</h2>
        {status && <p className="muted">Connected database: {status.database}</p>}
        {error && <p className="error-text">{error}</p>}
      </div>

      <div className="card-grid">
        {countEntries.map(([key, value]) => (
          <div className="stat-card" key={key}>
            <div className="stat-title">{labels[key] || key}</div>
            <div className="stat-value">{value}</div>
          </div>
        ))}
      </div>
    </div>
  );
}
