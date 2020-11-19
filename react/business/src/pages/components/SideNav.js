import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Drawer from '@material-ui/core/Drawer';
import List from '@material-ui/core/List';
import Divider from '@material-ui/core/Divider';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import HomeIcon from '@material-ui/icons/Home';
//import ShoppingCart from '@material-ui/core/ShoppingCart';
import MenuIcon from '@material-ui/icons/RestaurantMenu';
import Container from '@material-ui/core/Container';
import { Typography } from '@material-ui/core';

const drawerWidth = 240;

const useStyles = makeStyles((theme) => ({
  root: {
    display: 'flex',
  },
  drawer: {
    width: drawerWidth,
    flexShrink: 0,
   
  },
  drawerPaper: {
    width: drawerWidth,
    backgroundColor: theme.palette.primary.main,
    color: theme.palette.common.white
  },
  listItemIcon: {
    color: theme.palette.common.white
  },
  topContainer: {
    height: '15vh',
    paddingTop: '5vh',
    color: theme.palette.common.white
  }
  
}));

export default function SideNav() {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Drawer
        className={classes.drawer}
        variant="permanent"
        classes={{
          paper: classes.drawerPaper,
        }}
        anchor="left"
      >
        <Container className={classes.topContainer}>
          <Typography variant="h5" align="left" gutterBottom="true">Dashboard</Typography>
        </Container>
        <div className={classes.toolbar} />
        <Divider />
        <List>
          {['Dashboard', 'My Menu', 'Orders'].map((text, index) => (
            <ListItem button key={text}>
              <ListItemIcon className={classes.listItemIcon}>{index % 2 === 0 ? <HomeIcon /> : <MenuIcon />}</ListItemIcon>
              <ListItemText primary={text} />
            </ListItem>
          ))}
        </List>
        
      </Drawer>
    </div>
  );
}