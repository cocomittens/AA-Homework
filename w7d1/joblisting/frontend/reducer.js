const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case "SWITCH_LOCATION":
      let nextState = merge({}, state);
      const city = {
        city: action.city,
        jobs: action.jobs
      }
      nextState[action.id] = city;
      return nextState;
    default:
      return state;
  }
};

export default reducer;
