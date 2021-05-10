import { RECEIVE_SONG, RECEIVE_SONGS } from "../actions/song_actions";

const songsReducer = (state = {}, action) => {
    // debugger
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_SONG:
            // debugger
            const newSong = action.song;
            return Object.assign({}, state, {
                [newSong.id]: newSong
            });
        case RECEIVE_SONGS:
            // debugger
            return action.payload.songs;
        default:
            return state;
    }
};

export default songsReducer;