function thunk(store) {
    //will be invoked during the setup
    // debugger
    return (next) => {
        //will be invoked during the setup
        // debugger
        return (action) => {
            // debugger
            if (typeof action === "function") {
                // debugger
                return action(store.dispatch, store.getState);
            }
            // debugger
            return next(action);
        };
    };
}

export default thunk;