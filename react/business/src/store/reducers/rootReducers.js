
const initState = {
  user: {
    name: 'food3',
    address: 'adressfs',
    latitude: "324",
    longitude: "24"
  },

  food: [
    {id: 0, name:'Test', price:100},    
  ],

  commodities: [
    {id: 1, name:'Wheat', price:100},
    {id: 2, name:'Tomato', price:100},
    {id: 3, name:'Cheese', price:100},
    {id: 4, name:'Sauce', price:100},
    {id: 5, name:'Oil', price:100},
  ],

  orders: [
    {order_id:0, food_name: "Test", food_id: 0, qty: 1, status:"Accepted"},
  ],
}

const rootReducer = (state = initState, action) => {
  if(action.type === "SET_FOOD_LIST") {
    return {
      ...state,
      food: [...state.food, ...action.foodList]
    }
  }
  else if(action.type == "SET_ORDER_LIST") {
    return {
      ...state,
      orders: [...state.orders, ...action.orders]
    }
  }
  else {
    return {...state}
  }
}

export default rootReducer;



