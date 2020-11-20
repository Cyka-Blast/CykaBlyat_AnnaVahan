import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
//import img1 from '../../static/undrawOnlineGroceries.svg';
//import img2 from '../../static/undrawOnlineGroceriesAccent.svg';
import placeholderImg from '../../static/undrawHealthyOptionsAccent.svg';


const useStyles = makeStyles((theme) => ({
  paper: {
    padding: theme.spacing(2),
    textAlign: 'center',
    height: '85vh',
    width: '100%',
    border: 'none',
    boxShadow: 'none'
  },
  innerPaper: {
    padding: theme.spacing(2),
    height: '25vh',
    borderRadius: '20px'
  },
  innerPaperMenu: {
    padding: theme.spacing(2),
    height: '55vh',
    borderRadius: '20px'
  },
  innerPaperOrders:{
    padding: theme.spacing(2),
    height: '83.5vh',
    borderRadius: '20px'
  },
  placeholderImg: {
    padding: theme.spacing(2),
    width: '100%',
    height: '100%',
  }
}));

export default function DashboardCards() {

  const classes = useStyles();

  return (
    <div>
      {/* Entire card container on dashboard */}
      <Grid container>
        {/* Left Section */}
        <Grid item xs={8}>
          {/* This paper is to properly size the right section. This contains more grid */}
          <Paper className={classes.paper}>
            {/* Container for actual Cards */}
            <Grid container spacing={3}>
              {/* Image Card */}
              <Grid item xs={6} >
                <Paper className={classes.innerPaper} elevation={5}>
                  <img src={placeholderImg} alt="jash" className={classes.placeholderImg}/>
                </Paper>
              </Grid>
              {/* Statistics Card */}
              <Grid item xs={6} >
                <Paper className={classes.innerPaper} elevation={5}>
                  Statistics Stuff with an image
                </Paper>
              </Grid>
              {/* Menu Items Display Card */}
              <Grid item xs={12} >
                <Paper className={classes.innerPaperMenu} elevation={5}>
                  A
                </Paper>
              </Grid>
            </Grid>
          </Paper>          
        </Grid>
        {/* Right Section */}
        <Grid container xs={4}>
          <Paper className={classes.paper}>
            <Grid item>
              <Paper className={classes.innerPaperOrders} elevation={5}>
              B  
              </Paper>  
            </Grid>            
          </Paper>
        </Grid>
      </Grid>
    </div>
  )
}
