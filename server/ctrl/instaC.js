'use strict';

const request = require('request');
const INSTA = 'https://www.instagram.com';
const _ = require('lodash');

// get all page data from React object
const getSharedData = user => {
  return new Promise((resolve, reject) => {
    request(`${INSTA}/${user}`, (err, response, body) => {
      if (err) return reject({
        status: 500,
        message: "Instagram's being a bitch."
      });
      // find the `_sharedData` variable in `body`
      let script = body.split('window._sharedData')[1];
      // grab the next JSON object starting with `{` until it ends with `;`
      script = script.slice(script.indexOf('{')).split(';')[0];
      resolve(JSON.parse(script));
    });
  });
};

// translate raw scraped data into my API's version
module.exports.getInfo = user => {
  return new Promise((resolve, reject) => {
    getSharedData(user)
      .then(data => {
        let { user } = data.entry_data.ProfilePage[0].graphql;
        let {
          biography,
          external_url,
          edge_followed_by,
          edge_follow,
          id,
          full_name,
          profile_pic_url_hd,
          username
        } = user;

        let feed = data.entry_data.ProfilePage[0].graphql.user.edge_owner_to_timeline_media.edges;
        feed = feed.slice(0,4).map(f => {
          return {
            thumb: f.node.thumbnail_src,
            shortcode: f.node.shortcode
          };
        });

        let response = {
          bio: biography,
          website: external_url,
          followers: edge_followed_by.count,
          following: edge_follow.count,
          id,
          full_name,
          image: profile_pic_url_hd,
          username,
          posts: feed
        };
        resolve(response);
      })
      .catch(err => reject(err));
    });
}

// scrape 4 most recent image URLs and post links
module.exports.getUserPosts = uid => {
  return new Promise((resolve, reject) => {
    getSharedData(uid)
      .then(data => {
        let feed = data.entry_data.ProfilePage[0].graphql.user.edge_owner_to_timeline_media.edges;
        feed = feed.slice(0,4);
        feed = feed.map(f => {
          return {
            thumb: f.node.thumbnail_src,
            shortcode: f.node.shortcode
          };
        });
        resolve(feed);
      })
      .catch(err => reject(err));
  });
};