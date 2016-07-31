import React, { PropTypes } from 'react';
import _ from 'lodash';
import CommentsWidget from '../components/CommentsWidget';

export default class CommentsForm extends React.Component {
  static propTypes = {
  };

  constructor(props, context) {
    super(props, context);

    this.state = {
      comments: this.props.comments,
      user_name: null,
      body: null
    };

    _.bindAll(this, 'handleSubmit');
  }

  componentDidMount() {
    const { commentable_id } = this.props;

    $.get(`/post/${commentable_id}/comments`, function(result) {
      this.setState({
        comments: result
      });
    }.bind(this));
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
    const { user_name, body, comments } = this.state;

    const { commentable_id, commentable_type } = this.props;

    const data = {
      comment: {
        commentable_id: commentable_id,
        commentable_type: commentable_type,
        user_name: user_name,
        body: body,
        errors: []
      }
    };

    if (user_name == null || body == null) {
      this.setState(
        { errors: ['Please enter your name and comment'] }
      )
      return
    }

    if (comments.length > 0 && user_name.trim() && body.trim()) {
      $.ajax({
        type: 'POST',
        url: '/comments',
        data: data
      })
      .done(function(data) {
        const comments = [data].concat(this.state.comments);
        this.setState(
          { comments: comments },
        );
      }.bind(this));
    }
    this.clearForm();
  }

  render() {
    return (
      <section className="comments">
        <section className="container comments-form">
          <hr />
          <form id="new-comment" className="comment-form" onSubmit={::this.handleSubmit} >
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
        <CommentsWidget comments={ this.state.comments } />
      </section>
    );
  }
}
