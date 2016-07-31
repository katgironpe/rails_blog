import React, { PropTypes } from 'react';
import _ from 'lodash';

export default class CommentsWidget extends React.Component {
  static propTypes = {
  };

  constructor(props, context) {
    super(props, context);
  }

  render() {
    let comments = this.props.comments;
    comments = comments.map( function(comment) {
      if (comment) {
        return (
          <div key={comment.id}>
            <strong>{comment.user_name}</strong>
            <p>{comment.body}</p>
            <hr />
          </div>
        );
      }
    });

    return (
      <section className="container paginated-comments">
        <h4>Comments</h4>

        {comments}
      </section>
    );
  }
}
