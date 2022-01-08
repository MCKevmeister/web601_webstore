import React from "react";
import {Route, Router} from "react-router-dom";
import Home from "./components/Home";
import Nav from "./components/Nav";
import SignIn from "./components/SignIn";
// import SignUp from "./components/SignUp";

const App = () => {
    return (
        <Router>
            <Nav />

            <Route path="/" component={Home} exact/>
            <Route path="/signin" component={SignIn} />
            {/*<Route exact path="/signup" element={<SignUp />} />*/}
        </Router>
    );
}

export default App;
