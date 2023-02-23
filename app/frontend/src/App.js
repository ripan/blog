import React, { Component }  from 'react';
import './App.css';
import ArticlesListContainer from "./components/ArticlesListContainer";

class App extends Component {
  render() {
    return (
      <div className="mainContainer">
        <ArticlesListContainer />
      </div>
    );
  }
}

export default App;
