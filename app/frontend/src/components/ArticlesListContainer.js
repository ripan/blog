import React, { Component } from "react";
import axios from "axios";

class ArticlesListContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      articles: [],
    };
  }

  loadArticles() {
    axios
      .get("http://localhost:3000/api/v1/articles")
      .then((res) => {
        this.setState({ articles: res.data });
      })
      .catch((error) => console.log(error));
  }

  likeArticle = (id) => {
    axios
      .post(`http://localhost:3000/api/v1/likes`, {resource_id: id, resource_type: "Article"})
      .then((res) => {
        const articleIndex = this.state.articles.findIndex(
          (x) => x.id === id
        );
        const article = this.state.articles[articleIndex];
        article.likes_count++;
        this.setState({
          articles: this.state.articles
        });
      })
      .catch((error) => console.log(error));
  };

  componentDidMount() {
    this.loadArticles();
  }

  render() {
    return (
      <div>
        <div className="listContainer">
        </div>
        <div className="wrapItems">
          <center>
          <h1>List Articles</h1>
          <table className="listItems">
            <thead>
              <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Likes</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              {this.state.articles.map((article) => {
                return (
                  <tr className="item" article={article} key={article.id}>
                    <td><strong>{article.id}</strong></td>
                    <td><p className="itemDisplay">{article.title}</p></td>
                    <td><label className="itemDisplay">{article.likes_count}</label></td>
                    <td><button className="likeItemButton" onClick={(e) => this.likeArticle(article.id)}>Like</button></td>
                  </tr>
                );
              })}
            </tbody>
          </table>
          </center>
        </div>
      </div>
    );
  }
}

export default ArticlesListContainer;
