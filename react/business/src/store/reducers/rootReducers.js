
const initState = {
  user: {
    name: 'food3',
    address: 'adressfs',
    latitude: "324",
    longitude: "24"
  },

  food: [
    {id: 1, name:'Biryani', price:100},
    {id: 2, name:'Pulao', price:100},
    {id: 3, name:'Masaale Bhaat', price:100},
    {id: 4, name:'Prawns Biryani', price:100},
    {id: 5, name:'Fried Rice', price:100},
    {id: 5, name:'Fried Rice', price:100},
    {id: 5, name:'Fried Rice', price:100},
    {id: 5, name:'Fried Rice', price:100},
  ],

  commodities: [
    {id: 1, name:'Wheat', price:100},
    {id: 2, name:'Tomato', price:100},
    {id: 3, name:'Cheese', price:100},
    {id: 4, name:'Sauce', price:100},
    {id: 5, name:'Oil', price:100},
    {id: 5, name:'Oil', price:100},
    {id: 5, name:'Oil', price:100},
    {id: 5, name:'Oil', price:100},
  ],

  orders: [
    {client:1, foodList: ["a", "b", "c"], price:300, status:"Accepted"},
    {client:2, foodList: ["a", "b", "c"], price:400, status:"Processing"},
    {client:3, foodList: ["a", "b", "c"], price:100, status:"Ready"},
    {client:4, foodList: ["a", "b", "c"], price:120, status:"Delivered"},
    {client:5, foodList: ["a", "b", "c"], price:500, status:"Delivered"},
  ],
}

const rootReducer = (state = initState, action) => {
  if(action.type === "SET_FOOD_LIST") {
    return {
      ...state,
      food: [...state.food, ...action.foodList]
    }
  }
  else {
    return {...state}
  }
}

export default rootReducer;



