import { useEffect, useState } from "react";
import api from "../api/api";

export default function Selection() {
  const [selections, setSelections] = useState([]);
  const [selection, setSelection] = useState({
    applicationId: "",
    rankNo: "",
    finalScore: "",
    selectionDate: ""
  });

  useEffect(() => {
    api.get("/selections").then(res => setSelections(res.data));
  }, []);

  const submit = e => {
    e.preventDefault();
    api.post("/selections", selection).then(() => {
      alert("Selection Added");
      api.get("/selections").then(res => setSelections(res.data));
    });
  };

  return (
    <div className="page">
      <div className="section">
        <h2>Selections</h2>
        <div className="card-grid">
          <div className="stat-card">
            <div className="stat-title">Selections</div>
            <div className="stat-value">{selections.length}</div>
          </div>
        </div>
      </div>
      <form onSubmit={submit}>
        <input placeholder="Application ID" onChange={e => setSelection({...selection, applicationId:e.target.value})}/>
        <input placeholder="Rank No" onChange={e => setSelection({...selection, rankNo:e.target.value})}/>
        <input placeholder="Final Score" onChange={e => setSelection({...selection, finalScore:e.target.value})}/>
        <input placeholder="Selection Date (YYYY-MM-DD)" onChange={e => setSelection({...selection, selectionDate:e.target.value})}/>
        <button>Add Selection</button>
      </form>
      <ul>
        {selections.map(s => (
          <li key={s.selectionId}>
            <span>Application {s.applicationId} | Rank {s.rankNo}</span>
            <span className="tag">Score {s.finalScore} | {s.selectionDate}</span>
          </li>
        ))}
      </ul>
    </div>
  );
}
