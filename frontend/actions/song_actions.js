import * as APIUtil from "../util/song_api_util";

export const RECEIVE_SONG = 'RECEIVE_SONG';
export const RECEIVE_SONGS = 'RECEIVE_SONGS';

export const receiveSongs = payload => {
    // debugger
    return {
        type: RECEIVE_SONGS,
        payload: payload
    }
}

export const receiveSong = song => {
    // debugger
    return {
        type: RECEIVE_SONG,
        song: song
    }
}



//thunk action creators

export const fetchSong = songId => {
    return (dispatch) => {
        return APIUtil.fetchSong(songId).then(song => {
            return dispatch(receiveSong(song));
        })
    }
}

export const fetchSongs = () => {
    // debugger
    return (dispatch) => {
        // debugger
        return APIUtil.fetchSongs().then((payload) => {
            // debugger
            return dispatch(receiveSongs(payload))
        })
    }
}

export const createSong = song => {
    // debugger 
    return (dispatch) => {
        // debugger
        return APIUtil.createSong(song).then((newSong) => {
            // debugger
            return dispatch(receiveSong(newSong))
        })
    }
}