import React, { PropTypes } from 'react';
import _ from 'lodash';

export default class CommentsForm extends React.Component {
  static propTypes = {
  };

  constructor(props, context) {
    super(props, context);

    _.bindAll(this, 'handleSubmit');
  }

  handleSubmit() {
    console.log('Called')
  }

  render() {
    return (
      <section className="container comments-form">
        <hr />
        <form className="form-horizontal">
          <label for="user_name">Name</label>
          <input
            id="user_name"
            type="text"
          />
          <label for="body">Body</label>
          <textarea id="body" value="body" />
        </form>
      </section>
    );
  }
}
