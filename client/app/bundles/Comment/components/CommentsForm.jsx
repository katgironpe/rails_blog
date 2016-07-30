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

    //_.bindAll(this, 'handleSubmit');
  }

  render() {
    return (
      <section className="container comments-form">
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
