import React, { PropTypes } from 'react';
import _ from 'lodash';

export default class CommentsForm extends React.Component {
  static propTypes = {
  };

  constructor(props, context) {
    super(props, context);

    _.bindAll(this, 'handleSubmit');
  }

  handleSubmit(e) {
    e.preventDefault();
    const { name, body } = this.refs;
    console.log(`Send ${name.value} and ${body.value}`)
  }

  render() {
    return (
      <section className="container comments-form">
        <hr />
        <form id="new-comment" className="comment-form" onSubmit={::this.handleSubmit}>
          <fieldset>
            <div className="form-group">
              <label>Name</label>
              <input name="comment_user_name" ref="name" required="true" type="text" placeholder="Your Full Name" className="form-control" />
            </div>
            <div className="form-group">
              <label>Comment</label>
              <textarea name="comment_body" ref="body" required="true" placeholder="Your comment" className="form-control" />
            </div>
          </fieldset>
          <button className="create-comment-btn btn btn-primary" type="submit">Post your comment</button>
        </form>
      </section>
    );
  }
}
