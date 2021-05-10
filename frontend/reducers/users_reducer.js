import { RECEIVE_SONGS } from "../actions/song_actions";

const usersReducer = (state = {}, action) => {
    // debugger
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_SONGS:
            // Object.assign({}, state, action.payload.users)
            return {...state, ...action.payload.users}
        default:
            return state;
    }
};

export default usersReducer;