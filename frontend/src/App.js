import React, { useState, useEffect } from 'react';
import axios from 'axios';

function App() {
  const [status, setStatus] = useState('');

  useEffect(() => {
    axios.get('http://localhost:3000/health')
      .then(response => {
        setStatus(response.data.status);
      })
      .catch(error => {
        console.error('Error fetching status:', error);
        setStatus('Error connecting to server');
      });
  }, []);

  return (
    <div style={{ padding: '20px' }}>
      <h1>Catalog Service Frontend</h1>
      <p>Backend Status: {status}</p>
    </div>
  );
}

export default App;