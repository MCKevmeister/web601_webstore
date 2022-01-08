import React from "react";
import {BrowserRouter, Route, Switch} from "react-router-dom";
import Home from "./components/Home";
import Nav from "./components/Nav";
import SignIn from "./components/SignIn";
import Admin from "./components/Admin"
import Cart from "./components/Cart"

// import SignUp from "./components/SignUp";

const App = () => {
    return (
        <div>
            <Nav />
            <BrowserRouter>
                <Switch>
                    <Route path='/' component={Home} exact/>
                    <Route path='/login' component={SignIn} />
                    <Route path='/logout' component={Admin} />
                    <Route path='/admin' component={Admin} />
                    <Route path='/cart' component={Cart} />
                    {/*<Route exact path="/signup" element={<SignUp />} />*/}
                </Switch>
            </BrowserRouter>
        </div>

    );
}

export default App;
