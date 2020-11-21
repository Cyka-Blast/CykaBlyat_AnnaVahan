import React, { Component, useEffect } from 'react'
import { connect } from 'react-redux';
import * as actionCreators from '../../store/actions/actions';
import DashboardOrderTable from './dashboardOrderTable';
import Divider from '@material-ui/core/Divider';


class DashboardOrder extends Component {

  componentDidMount() {
    this.interval = setInterval(() => this.setState({ time: Date.now() }), 1000);
    this.props.getOrderList();
    //console.log(this.props.food)
    console.log("Order Fired")
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }


  render() {

    const orders = this.props.orders;
    
    return (
      <div>
        <h2>Orders</h2>
        <Divider />
        <DashboardOrderTable orderList={orders}/>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return state
}


export default connect(mapStateToProps, actionCreators)(DashboardOrder);