Clone project 

Run command:  
  $dfx start  
  $dfx deploy  
  
Để thêm reactjs:  
  $npm install --save react react-dom  
  $npm install --save-dev typescript ts-loader
  
Tạo mới file tsconfig.json https://internetcomputer.org/assets/files/sample-tsconfig-f5ba846a507ee58d95f5168d548b9c00.json   
Bỏ comment trong file webpack.config.json   
   ```
   entry: {  
      // The frontend.entrypoint points to the HTML file for this build, so we need  
     // to replace the extension to `.js`.  
      // thay js bằng jsx   
      index: path.join(__dirname, frontend_entry).replace(/\.html$/, ".jsx"),  
   },
   ```
   
   ```
   // enable ts-loader
   module: {
   rules: [
     { test: /\.(ts|tsx|jsx)$/, loader: "ts-loader" },
     { test: /\.css$/, use: ['style-loader','css-loader'] }
   ]
  },
   ```   
 Đổi file index.js trong thư mục  frontend/src thành index.jsx, trông như thế này   
 ```
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
```   
Thêm ``` <div id="app"></div> ``` vào index.html   

ez :>
   
