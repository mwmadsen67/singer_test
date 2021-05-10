import { connect } from 'react-redux';
import { createSong } from '../../actions/song_actions';

import SongForm from './song_form';


const mapStateToProps = state => {
    // debugger
    return {
        songs: state.songs
    };
};

const mapDispatchToProps = dispatch => {
    // debugger
    return {
        addSong: body => {
            // debugger
            dispatch(createSong(body))
        }
    };
};

export default connect(mapStateToProps, mapDispatchToProps)(SongForm);