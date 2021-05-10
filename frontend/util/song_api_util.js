export const fetchSong = (songId) => {
    // debugger
    return $.ajax({
        method: "GET",
        url: `/api/songs/${songId}`
    })
}

export const fetchSongs = () => {
    // debugger
    return $.ajax({
        method: "GET",
        url: "/api/songs"
    })
}

export const createSong = (song) => {
    // debugger
    return $.ajax({
        method: "POST",
        url: "/api/songs",
        data: { song: song }
    })
}
