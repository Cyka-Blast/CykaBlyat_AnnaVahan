import React from 'react';
import './App.css';
import { ThemeProvider } from '@material-ui/core/styles';
import { theme } from './Theme';

import Dashboard from './pages/Dashboard'; 

function App() {
  return (
    <ThemeProvider theme={theme}>
      <div className="App">
        <Dashboard />

      </div>
    </ThemeProvider>
  );
}

export default App;
