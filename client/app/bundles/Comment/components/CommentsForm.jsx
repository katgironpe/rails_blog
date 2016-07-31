import React, { PropTypes } from 'react';
import _                    from 'lodash';
import Pagination           from 'react-js-pagination';
import CommentsWidget       from '../components/CommentsWidget';

export default class CommentsForm extends React.Component {
  static propTypes = {
  };

  constructor(props, context) {
    super(props, context);

    this.state = {
      comments: this.props.comments,
      commentable_id: this.props.commentable_id,
      commentable_type: this.props.commentable_type,
      user_name: null,
      body: null,
      pagination: null,
      formVisible: false,
      showAddComment: true
    };

    _.bindAll(this, 'handleSubmit');
  }

  loadComments(commentable_id, page = null) {
    const commentsUrl =(page !== null) ? `/post/${commentable_id}/comments?page=${page}` : `/post/${commentable_id}/comments`;
    $.get(commentsUrl, function(result) {
      this.setState({
        comments: result.comments,
        pagination: result.pagination
      });
    }.bind(this));
  }

  componentDidMount() {
    const { commentable_id } = this.props;
    this.loadComments(commentable_id);
  }

  clearForm() {
    document.getElementById('new-comment').reset();
    this.setState({ formVisible: false, showAddComment: true });
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
        body: body
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
          {
            comments: comments,
            pagination: data.pagination
          },
        );
      }.bind(this));
    }
    this.clearForm();
  }

  handlePageChange(pageNumber) {
    this.setState({ activePage: pageNumber });
    const { commentable_id } = this.props;
    this.loadComments(commentable_id, pageNumber);
  }

  renderPagination(pagination) {
    if (!pagination) return false;

    return(
      <Pagination
        activePage={ pagination.current_page }
        totalItemsCount={ pagination.total_count }
        onChange={this.handlePageChange.bind(this)}
      />
    )
  }

  showCommentForm(e) {
    e.preventDefault();
    this.setState({ formVisible: true, showAddComment: false });
  }

  renderForm() {
    const { formVisible } = this.state;
    if (!formVisible) return false;

    return (
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
    )
  }

  renderAddComment() {
    const { showAddComment } = this.state;
    if (!showAddComment) return false;

    return (
      <a href="#" className="btn btn-primary" onClick={ ::this.showCommentForm }>Add a comment</a>
    )
  }

  render() {
    return (
      <section className="comments">
        <section className="container comments-form">
          { ::this.renderAddComment() }
          <br />
          {:: this.renderForm() }
          <br />
        </section>
        <CommentsWidget comments={ this.state.comments } pagination={ this.state.pagination } />
        { ::this.renderPagination(this.state.pagination) }
      </section>
    );
  }
}
