import songsReducer from './songs_reducer';
import usersReducer from './users_reducer';

const entitiesReducer = (state = {}, action) => {
    // debugger
    return {
        songs: songsReducer(state.songs, action),
        users: usersReducer(state.users, action)
    };
};

export default entitiesReducer;