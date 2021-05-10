import React from 'react';

class SongForm extends React.Component {
    constructor(props) {
        // debugger
        super(props)

        this.state = { body: "" };
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    update(field) {
        // debugger
        return (e) => {
            // debugger
            this.setState({ [field]: e.target.value });
        };
    }

    handleSubmit(e) {
        // debugger
        e.preventDefault();

        this.props.addSong({ body: this.state.body });
        this.setState({ body: "" })
    }

    render() {
        // debugger
        return (
            <>
                <h2 className='new-song_header'>Sing a new Song!</h2>

                <form className='new-song_form' onSubmit={this.handleSubmit}>
                    <label htmlFor="song-body">Body</label>
                    <input
                        type="text"
                        id="song-body"
                        onChange={this.update("body")}
                        value={this.state.body}
                    />

                    <button>Send it!</button>
                </form>
            </>
        );
    }
}
export default SongForm;