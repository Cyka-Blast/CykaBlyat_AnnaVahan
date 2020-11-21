import React, { Component, useEffect } from 'react'
import { connect } from 'react-redux';
import * as actionCreators from '../../store/actions/actions';
import DashboardMenuTable from './dashboardMenuTable';
import Divider from '@material-ui/core/Divider';


class DashboardMenu extends Component {

  componentDidMount() {
    this.props.getFoodList();
    console.log(this.props.food)
  }


  render() {

    const food = this.props.food;
    
    return (
      <div>
        <b>Menu</b>
        <Divider />
        <DashboardMenuTable foodList={food}/>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return state
}


export default connect(mapStateToProps, actionCreators)(DashboardMenu);
