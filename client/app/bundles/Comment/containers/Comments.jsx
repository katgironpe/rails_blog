import React, { PropTypes } from 'react';
import CommentsForm from '../components/CommentsWidget';
import CommentsWidget from '../components/CommentsWidget';
import _ from 'lodash';

export default class Comments extends React.Component {
  static propTypes = {
  };

  constructor(props, context) {
    super(props, context);

    this.state = { comments: this.props.comments };

    //_.bindAll(this, 'updateName');
  }

  render() {
    return (
      <section>
        <CommentsWidget comments={ this.state.comments } />
      </section>
    );
  }
}
