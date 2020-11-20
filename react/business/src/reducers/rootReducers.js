
const initState = {
  data: [
    {id:1, data:"Hello this is data 1"},
    {id:2, data:"Hello this is data 2"},
    {id:3, data:"Hello this is data 3"},
  ]
}

const rootReducer = (state = initState, action) => {
  return state;
}

export default rootReducer;