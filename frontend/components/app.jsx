import React from 'react';
import { Provider } from 'react-redux';

import SongFormContainer from './songs/song_form_container';
import SongIndexContainer from './songs/song_index_container';

const App = ({ store }) => {
    // debugger
    return (
        <Provider store={store}>
            <>
                <div className="logo">
                    <img src="assets/whale.png" alt="whale" />
                    <h1>SINGER</h1>
                </div>
                <SongFormContainer />
                <SongIndexContainer />
            </>
        </Provider>
    );
};
export default App;