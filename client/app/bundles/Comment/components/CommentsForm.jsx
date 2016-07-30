import React, { PropTypes } from 'react';
import _ from 'lodash';

export default class CommentsForm extends React.Component {
  static propTypes = {
  };

  constructor(props, context) {
    super(props, context);

    _.bindAll(this, 'handleSubmit');
  }

  clearForm() {
    document.getElementById('new-comment').reset();
  }

  handleNameChange(e) {
    this.setState({ user_name: e.target.value });
  }

  handleCommentChange(e) {
    this.setState({ body: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const { user_name, body } = this.state;
    const { commentable_id, commentable_type } = this.props;
    console.log(`Send ${user_name}, ${commentable_id}, ${commentable_type} and ${body}`)
    this.clearForm()
  }

  render() {
    return (
      <section className="container comments-form">
        <hr />
        <form id="new-comment" className="comment-form" onSubmit={::this.handleSubmit}>
          <fieldset>
            <div className="form-group">
              <label>Name</label>
              <input name="comment_user_name" ref="user_name" onChange={::this.handleNameChange} type="text" placeholder="Your Full Name" className="form-control" />
            </div>
            <div className="form-group">
              <label>Comment</label>
              <textarea name="comment_body" ref="body" onChange={::this.handleCommentChange} placeholder="Your comment" className="form-control" />
            </div>
          </fieldset>
          <button className="create-comment-btn btn btn-primary" type="submit">Post your comment</button>
        </form>
      </section>
    );
  }
}
