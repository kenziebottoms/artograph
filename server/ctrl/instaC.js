'use strict';

const request = require('request');
const cheerio = require('cheerio');
const INSTA = 'https://www.instagram.com';
const _ = require('lodash');

// get all page data from React object
const getSharedData = user => {
  return new Promise((resolve, reject) => {
    request(`${INSTA}/${user}`, (err, response, body) => {
      if (err) return reject(err);
      let $ = cheerio.load(body);
      let data = $('script').eq(2).html();
      data = data.split(' = ')[1].slice(0, -1);
      resolve(JSON.parse(data));
    });
  });
};

// scrape user meta data
module.exports.getMeta = user => {
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
        let response = {
          bio: biography,
          website: external_url,
          followers: edge_followed_by.count,
          following: edge_follow.count,
          id,
          full_name,
          image: profile_pic_url_hd,
          username,
          posts: user.edge_owner_to_timeline_media.count
        };
        resolve(response);
      })
      .catch(err => reject(err));
  });
}

// scrape 3 most recent image URLs and post links
module.exports.getUserPosts = uid => {
  return new Promise((resolve, reject) => {
    getSharedData(uid)
      .then(data => {
        let feed = data.entry_data.ProfilePage[0].graphql.user.edge_owner_to_timeline_media.edges;
        feed = feed.slice(0,3);
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