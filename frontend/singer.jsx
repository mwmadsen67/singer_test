import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";

import App from "./components/app";

document.addEventListener("DOMContentLoaded", () => {
    // debugger
    const store = configureStore();

    // TESTING
    window.getState = store.getState;
    // TESTING

    // debugger
    const root = document.getElementById("root");
    ReactDOM.render(<App store={store} />, root);
});