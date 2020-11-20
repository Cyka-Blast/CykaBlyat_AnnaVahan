
const initState = {
  user: {
    name: 'Leslie Knope',
    address: 'Parks and Recreation Department, Pawney',
    location: 'lat, long'
  },

  food: [
    {id: 1, name:'Biryani', price:100},
    {id: 2, name:'Pulao', price:100},
    {id: 3, name:'Masaale Bhaat', price:100},
    {id: 4, name:'Prawns Biryani', price:100},
    {id: 5, name:'Fried Rice', price:100},
  ],

  order: [],
}

const rootReducer = (state = initState, action) => {
  if(action.type === "SET_FOOD_LIST") {
    return {
      ...state,
      food: [...state.food, action.foodList]
    }
  }
  else {
    return {...state}
  }
}

export default rootReducer;



