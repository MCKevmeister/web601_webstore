import './App.css';
import {Route, BrowserRouter} from "react-router-dom";
import Nav from "./components/nav.js";
import Home from "./components/Home";
import SignIn from "./components/Signin";
import SignUp from "./components/Signup";

function App() {
    return (
        <BrowserRouter>
            <div className="App">
                <Nav />
                <Route path="/" component={Home} />
                <Route path="signin" component={SignIn} />
                <Route path="signup" component={SignUp} />
            </div>
        </BrowserRouter>
    );
}

export default App;
