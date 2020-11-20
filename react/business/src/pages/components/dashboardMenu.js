import React, { Component } from 'react'
import { connect } from 'react-redux';
import DashboardMenuTable from './dashboardMenuTable';


class DashboardMenu extends Component {
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
   return {
     food: state.food
   }
}

export default connect(mapStateToProps)(DashboardMenu);
