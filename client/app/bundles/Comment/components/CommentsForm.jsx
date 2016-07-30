import React, { PropTypes } from 'react';
import _ from 'lodash';

export default class CommentsForm extends React.Component {
  static propTypes = {
  };

  getInitialState() {
    return {
      comment: null,
      errors: {}
    }
  },

  constructor(props, context) {
    super(props, context);

    _.bindAll(this, 'handleChange');
  }

  render() {
    const { comments } = this.props;
    return (
      <section className="container comments">
        <hr />
        <h4>Comments</h4>


        <hr />
        <form className="form-horizontal">
          <label>Name</label>
          <input
            type="text"
          />
          <label>Body</label>
          <input
            type="text"
          />
        </form>
      </section>
    );
  }
}
