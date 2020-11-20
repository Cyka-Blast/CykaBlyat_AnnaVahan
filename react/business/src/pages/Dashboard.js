import { makeStyles } from '@material-ui/core';
import React, { Component } from 'react';
import SideNav from './components/SideNav';
import TopNav from './components/TopNav';
import DashboardCards from './components/DashboardCards';

import Typography from '@material-ui/core/Typography';

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

export default function Dashboard() {

  const classes = useStyles();

    return (
      <div>
        <TopNav />
        <SideNav />
        <main className={classes.content}>
          <div className={classes.toolbar} />
          <DashboardCards />
          
        </main>
      </div>
    )
  
}
