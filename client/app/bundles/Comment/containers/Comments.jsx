import React, { PropTypes } from 'react';
import CommentsForm from '../components/CommentsForm';
import CommentsWidget from '../components/CommentsWidget';
import _ from 'lodash';

export default class Comments extends React.Component {
  static propTypes = {
  };

  constructor(props, context) {
    super(props, context);

    this.state = {
      comments: this.props.comments,
      comment: {
        commentable_id: '',
        commentable_type: '',
        user_name: '',
        body: ''
      },
      errors: {}
    };
  }

  render() {
    return (
      <section>
        <CommentsForm />
        <CommentsWidget comments={ this.state.comments } />
      </section>
    );
  }
}
