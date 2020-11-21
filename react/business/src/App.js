import React, { useState } from 'react';
import './App.css';
import {Route, Switch } from 'react-router-dom';
import { ThemeProvider } from '@material-ui/core/styles';
import { theme } from './Theme';
import { makeStyles } from '@material-ui/core';

import Dashboard from './pages/Dashboard'; 
import Inventory from './pages/Inventory';
import Orders from './pages/Orders';

import TopNav from './pages/components/TopNav';
import SideNav from './pages/components/SideNav';

const drawerWidth = 240;

const useStyles = makeStyles((theme) => ({
  // necessary for content to be below app bar
  toolbar: theme.mixins.toolbar,
  content: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.default,
    padding: theme.spacing(3),
    width: `calc(100% - ${drawerWidth}px)`,
    marginLeft: drawerWidth,
  },
  appBar: {
    width: `calc(100% - ${drawerWidth}px)`,
    marginLeft: drawerWidth,
  },
}))

function App() {

  const classes = useStyles();
  //const [currPage, setPage] = useState("");

  return (
    <ThemeProvider theme={theme}>
      <div className="App">
        <TopNav />
        <SideNav />
        <Switch>
          <main className={classes.content}>
            <div className={classes.toolbar} />
            <Route exact path="/">
                <Dashboard />
            </Route>
            <Route path="/inventory">
                <Inventory />
            </Route>
            <Route path="/orders">
                <Orders />
            </Route>
          </main>          
        </Switch>
      </div>
    </ThemeProvider>
  );
}

export default App;
