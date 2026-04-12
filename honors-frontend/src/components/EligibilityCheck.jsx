import { useEffect, useState } from "react";
import api from "../api/api";

export default function EligibilityCheck() {
  const [students, setStudents] = useState([]);
  const [programs, setPrograms] = useState([]);
  const [criteriaList, setCriteriaList] = useState([]);
  const [performance, setPerformance] = useState([]);
  const [studentId, setStudentId] = useState("");
  const [programId, setProgramId] = useState("");
  const [result, setResult] = useState(null);

  useEffect(() => {
    Promise.all([
      api.get("/students"),
      api.get("/programs"),
      api.get("/eligibility-criteria"),
      api.get("/academic-performance")
    ]).then(([s, p, c, a]) => {
      setStudents(s.data);
      setPrograms(p.data);
      setCriteriaList(c.data);
      setPerformance(a.data);
    });
  }, []);

  const toNumber = (value) => {
    const n = Number(value);
    return Number.isNaN(n) ? null : n;
  };

  const checkEligibility = () => {
    const student = students.find(s => String(s.studentId) === String(studentId));
    const program = programs.find(p => String(p.programId) === String(programId));
    const criteria = criteriaList.find(c => String(c.programId) === String(programId));
    const records = performance.filter(p => String(p.studentId) === String(studentId));

    if (!student || !program) {
      setResult({ ok: false, message: "Select a valid student and program." });
      return;
    }
    if (!criteria) {
      setResult({ ok: false, message: "No eligibility criteria found for this program." });
      return;
    }
    if (records.length === 0) {
      setResult({ ok: false, message: "No academic performance records found for this student." });
      return;
    }

    const gpas = records.map(r => toNumber(r.semesterGpa)).filter(n => n !== null);
    const credits = records.reduce((sum, r) => sum + (toNumber(r.creditsEarned) || 0), 0);
    const maxBacklogs = records.reduce((max, r) => {
      const b = toNumber(r.backlogs) || 0;
      return b > max ? b : max;
    }, 0);
    const cgpa = gpas.length ? (gpas.reduce((sum, g) => sum + g, 0) / gpas.length) : null;

    const minCgpa = toNumber(criteria.minCgpa);
    const minCredits = toNumber(criteria.minCredits) || 0;
    const maxAllowedBacklogs = toNumber(criteria.maxBacklogs);
    const deptMatch = student.deptId && program.departmentId
      ? Number(student.deptId) === Number(program.departmentId)
      : true;

    const checks = [];
    if (cgpa === null) checks.push("CGPA not available.");
    if (minCgpa !== null && cgpa !== null && cgpa < minCgpa) checks.push("CGPA below minimum.");
    if (credits < minCredits) checks.push("Credits below minimum.");
    if (maxAllowedBacklogs !== null && maxBacklogs > maxAllowedBacklogs) checks.push("Backlogs above maximum.");
    if (!deptMatch) checks.push("Student department does not match program department.");

    if (checks.length === 0) {
      setResult({
        ok: true,
        message: "Eligible for honors.",
        cgpa,
        credits,
        maxBacklogs
      });
    } else {
      setResult({
        ok: false,
        message: "Not eligible: " + checks.join(" "),
        cgpa,
        credits,
        maxBacklogs
      });
    }
  };

  return (
    <div className="page">
      <div className="section">
        <h2>Eligibility Check</h2>
        <div className="card-grid">
          <div className="stat-card">
            <div className="stat-title">Students</div>
            <div className="stat-value">{students.length}</div>
          </div>
          <div className="stat-card">
            <div className="stat-title">Programs</div>
            <div className="stat-value">{programs.length}</div>
          </div>
          <div className="stat-card">
            <div className="stat-title">Criteria Sets</div>
            <div className="stat-value">{criteriaList.length}</div>
          </div>
        </div>
      </div>
      <div className="section">
        <input placeholder="Student ID" value={studentId} onChange={e => setStudentId(e.target.value)} />
        <input placeholder="Program ID" value={programId} onChange={e => setProgramId(e.target.value)} />
        <button onClick={checkEligibility}>Check</button>
      </div>
      {result && (
        <div>
          <div className={result.ok ? "result-badge result-ok" : "result-badge result-no"}>
            {result.ok ? "Eligible" : "Not Eligible"}
          </div>
          <p>{result.message}</p>
          <p>Computed CGPA: {result.cgpa !== null ? result.cgpa.toFixed(2) : "N/A"}</p>
          <p>Total Credits: {result.credits ?? "N/A"}</p>
          <p>Max Backlogs: {result.maxBacklogs ?? "N/A"}</p>
        </div>
      )}
      <h3>Students</h3>
      <ul>
        {students.map(s => (
          <li key={s.studentId}>
            <span>{s.studentId} - {s.name}</span>
            <span className="tag">Dept {s.deptId}</span>
          </li>
        ))}
      </ul>
      <h3>Programs</h3>
      <ul>
        {programs.map(p => (
          <li key={p.programId}>
            <span>{p.programId} - {p.programName}</span>
            <span className="tag">Dept {p.departmentId}</span>
          </li>
        ))}
      </ul>
    </div>
  );
}
