import express from "express";
const app = express();
const PORT = process.env.PORT || 3000;


app.get("/status", (req, res) => {
  res.json({ ok: true, time: new Date().toISOString() });
});

app.listen(PORT, () => {
  console.log(`Listen to http://localhost:${PORT}`);
});