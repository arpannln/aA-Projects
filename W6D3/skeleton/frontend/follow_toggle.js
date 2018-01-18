const APIUtil = require('./api_util');

class FollowToggle { 
  constructor(el, options) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id') || options.userId; 
    this.followState = (this.$el.data('initial-follow-state') || options.followState);
    console.log('Hi');
    this.render();
  }
  
  render() {
    if (this.followState === 'followed') {
      this.$el.prop('disabled', false);
      this.$el.html('Unfollow!');
    } else if (this.followState === 'unfollowed'){  
      this.$el.prop('disabled', false);
      this.$el.html('Follow!');
    }
  }
  
  handleClick(event) {
    const followToggle = this;

    event.preventDefault();

    if (this.followState === 'followed') {
      this.followState = 'unfollowing';
      this.render();
      APIUtil.unfollowUser(this.userId).then(() => {
        followToggle.followState = 'unfollowed';
        followToggle.render();
      });
    } else if (this.followState === 'unfollowed') {
      this.followState = 'following';
      this.render();
      APIUtil.followUser(this.userId).then(() => {
        followToggle.followState = 'followed';
        followToggle.render();
      });
    }
  }
}





module.exports = FollowToggle; 