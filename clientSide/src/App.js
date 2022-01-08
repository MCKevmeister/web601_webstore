import React from "react";
import {Route, BrowserRouter} from "react-router-dom";
import Home from "./components/Home";
import Nav from "./components/Nav";
import SignIn from "./components/SignIn";
// import SignUp from "./components/SignUp";

function App() {
    return (
        <BrowserRouter>
            <div className="App">
                <Nav />
                <Route path="/" element={<Home />} />
                <Route path="/signin" element={<SignIn />} />
                {/*<Route path="/signup" element={<SignUp />} />*/}
            </div>
        </BrowserRouter>
    );
}

export default App;
