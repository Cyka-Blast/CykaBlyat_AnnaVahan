import axios from "axios";

export function getFoodList() {
  return(dispatch) => {
    return axios.get('http://127.0.0.1:5000/food').then((response) => {
      dispatch(setFoodList(response.data))
    }).catch(error => console.log(error));
  }
}

export function setFoodList(data) {
  const food = data.filter((item) => {
    return item.owner_id === 1
  })
  return {
    type: "SET_FOOD_LIST",
    foodList: food
  }
}

export function getOrderList() {
  return(dispatch) => {
    return axios.get('http://127.0.0.1:5000/ofood').then((response) => {
      dispatch(setOrderList(response.data))
    }).catch(error => console.log(error));
  }
}

export function setOrderList(data) {
  const orders = data.map((order) => {
    order.status = "Accepted"
    return order
  })
  console.log(orders)
  return {
    type: "SET_ORDER_LIST",
    orders: orders
  }
}