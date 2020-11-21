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