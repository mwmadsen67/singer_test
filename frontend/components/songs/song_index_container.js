import { connect } from 'react-redux';
import { fetchSongs } from "../../actions/song_actions";
import SongIndex from './song_index';

const mapStateToProps = (state) => {
    // debugger
    return {
        songs: Object.values(state.entities.songs),
        users: state.entities.users
    };
};




const mapDispatchToProps = (dispatch) => {
    // debugger
    return {
        fetchSongs: () => {
            // debugger
            return dispatch(fetchSongs());
        }
    };
};


export default connect(mapStateToProps, mapDispatchToProps)(SongIndex);










