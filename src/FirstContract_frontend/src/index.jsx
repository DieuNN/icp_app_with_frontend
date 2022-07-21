import { render } from "react-dom";
import React from "react";
import { FirstContract_backend } from "../../declarations/FirstContract_backend";

const App = () => {
  const [counter, setCounter] = React.useState('');
  
  async function getCounter() {
    const counter = await FirstContract_backend.showCounter();
    console.log(counter);
  }

  async function increase() {
    const counter =await FirstContract_backend.increase()
    console.log(counter)
  }

  return (
    <div style={{ "fontFamily": "sans-serif" }}>
      <p>{counter}</p>  
      <button onClick={getCounter}>Get counter</button>
      <button onClick={increase}>Increase by one</button>
    </div>
  );
}

render(<App></App>, document.getElementById("app"))
