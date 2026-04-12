import { BrowserRouter, Routes, Route, Link } from "react-router-dom";
import "./App.css";
import Student from "./components/Student";
import Application from "./components/Application";
import HonorsProgram from "./components/HonorsProgram";
import Department from "./components/Department";
import Semester from "./components/Semester";
import EligibilityCriteria from "./components/EligibilityCriteria";
import AcademicPerformance from "./components/AcademicPerformance";
import Selection from "./components/Selection";
import EligibilityCheck from "./components/EligibilityCheck";

function App() {
  return (
    <BrowserRouter>
      <div className="app-shell">
        <header className="app-header">
          <div className="brand">
            <div className="brand-badge">UH</div>
            <div className="brand-text">
              <div className="brand-title">University Honors</div>
              <div className="brand-subtitle">Admissions & Eligibility Console</div>
            </div>
          </div>
        </header>

        <nav className="app-nav">
          <Link to="/">Students</Link>
          <Link to="/applications">Applications</Link>
          <Link to="/programs">Programs</Link>
          <Link to="/departments">Departments</Link>
          <Link to="/semesters">Semesters</Link>
          <Link to="/eligibility-criteria">Eligibility Criteria</Link>
          <Link to="/academic-performance">Academic Performance</Link>
          <Link to="/selections">Selections</Link>
          <Link to="/eligibility-check">Eligibility Check</Link>
        </nav>

        <main className="app-main">
          <Routes>
            <Route path="/" element={<Student />} />
            <Route path="/applications" element={<Application />} />
            <Route path="/programs" element={<HonorsProgram />} />
            <Route path="/departments" element={<Department />} />
            <Route path="/semesters" element={<Semester />} />
            <Route path="/eligibility-criteria" element={<EligibilityCriteria />} />
            <Route path="/academic-performance" element={<AcademicPerformance />} />
            <Route path="/selections" element={<Selection />} />
            <Route path="/eligibility-check" element={<EligibilityCheck />} />
          </Routes>
        </main>
      </div>
    </BrowserRouter>
  );
}

export default App;
