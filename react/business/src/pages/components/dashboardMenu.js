import React, { Component, useEffect } from 'react'
import { connect } from 'react-redux';
import * as actionCreators from '../../store/actions/actions';
import DashboardMenuTable from './dashboardMenuTable';


class DashboardMenu extends Component {

  componentDidMount() {
    this.props.getFoodList();
    //console.log(this.props.food)
  }


  render() {

    const food = this.props.food;
    
    return (
      <div>
        Menu
        <DashboardMenuTable foodList={food}/>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return state
}


export default connect(mapStateToProps, actionCreators)(DashboardMenu);
