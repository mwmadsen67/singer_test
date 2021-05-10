import React from 'react';

class SongIndex extends React.Component {

    constructor(props) {
        // debugger
        super(props)
    }

    componentDidMount() {
        this.props.fetchSongs();
    }


    render() {
        // debugger
        if (this.props.songs.length == 0) {
            return <span>No songs yet!</span>;
        }

        const songLis = this.props.songs.map(song => {
            return (
                <li key={song.id}>
                    {song.body} - {this.props.users[song.authorId].username}
                </li>
            )
        });

        return <ul className='songs'>{songLis}</ul>;
    }

};

export default SongIndex;