import React from 'react'
import {Grid, Button} from '@material-ui/core';
import FoodTable from './components/foodTable';
import CommodityTable from './components/commodityTable';

export default function MyMenu() {
  return (
    <div>
      <h1>Inventory</h1>
      <Grid container spacing={2}>
        <Grid item xs={6}>
          
          <FoodTable />
        </Grid>
        <Grid item xs={6}>
          
          <CommodityTable />
        </Grid>
      </Grid>
    </div>
  )
}
