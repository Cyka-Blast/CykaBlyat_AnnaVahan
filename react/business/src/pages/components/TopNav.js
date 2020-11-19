import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import CssBaseline from '@material-ui/core/CssBaseline';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import IconButton from '@material-ui/core/IconButton';
import Typography from '@material-ui/core/Typography';
import Container from '@material-ui/core/Container';
import NotificationsIcon from '@material-ui/icons/Notifications';

const drawerWidth = 240;

const useStyles = makeStyles((theme) => ({
  appBar: {
    width: `calc(100% - ${drawerWidth}px)`,
    marginLeft: drawerWidth,
    backgroundColor: theme.palette.common.white,
    color: theme.palette.common.black
  }, 
  logo: {
    flexGrow: 1,
  }, 
}));

export default function TopNav() {
  const classes = useStyles();
  return (
    <div>
    <CssBaseline />
      <AppBar position="fixed" className={classes.appBar}>
        <Toolbar>
          <Typography variant="h6" noWrap color="primary" className={classes.logo}>
            AnnaVahan
          </Typography>          
          <IconButton aria-label="notiffications" >
            <NotificationsIcon />
          </IconButton>          
        </Toolbar>
      </AppBar>
    </div>
  )
}
