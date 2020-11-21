import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';

const useStyles = makeStyles({
  table: {
    minWidth: 6,
    boxShadow: "0",
  },
});


export default function DashboardOrderTable(props) {
  const classes = useStyles();

  return (
    <div>
      <TableContainer component={Paper} elevation={0}>
        <Table stickyHeader className={classes.table} aria-label="simple table">
          <TableHead>
            <TableRow>
              <TableCell><b>Order ID</b></TableCell>
              <TableCell align="right"><b>Food</b></TableCell>
              <TableCell align="right"><b>Price</b></TableCell>
              <TableCell align="right"><b>Qty.</b></TableCell>
              <TableCell align="right"><b>Status</b></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {props.orderList.map((order) => (
              <TableRow key={order.order_id}>
                <TableCell component="th" scope="row">
                  {order.order_id}
                </TableCell>
                <TableCell align="right">{order.food}</TableCell>
                <TableCell align="right">{order.qty}</TableCell>
                <TableCell align="right">{order.price}</TableCell>
                <TableCell align="right">{order.status}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </div>
  );
}
