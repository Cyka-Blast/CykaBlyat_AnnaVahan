
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
    {id: 6, name:'Fried Rice', price:100},
    {id: 7, name:'Fried Rice', price:100},
    {id: 8, name:'Fried Rice', price:100},
  ],

  order: [],
}

const rootReducer = (state = initState, action) => {
  return state;
}

export default rootReducer;