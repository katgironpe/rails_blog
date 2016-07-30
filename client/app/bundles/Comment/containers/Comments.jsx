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
      commentable_id: this.props.commentable_id,
      commentable_type: this.props.commentable_type,
      user_name: '',
      body: '',
      errors: {}
    };
  }

  render() {
    return (
      <section>
        <CommentsForm commentable_id={ this.state.commentable_id } commentable_type={ this.state.commentable_type } user_name={ this.state.user_name } body={ this.state.body } errors={ this.state.errors} />
        <CommentsWidget comments={ this.state.comments } />
      </section>
    );
  }
}
