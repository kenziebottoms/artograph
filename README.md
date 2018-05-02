# Artograph

An app to geographically visualize and organize tattoo artist information.

> ### `car·to·graph`
>
> `/ˈkɑr tə ˌgræf/`, noun
>
> an illustrated map

## Goals
- [ ] Users can search a list of artists by
    - [x] name,
    - [ ] tags,
    - [ ] location.
- [ ] User can select their current location and receive a filterable list of tattoo artists ordered by distance from that point.
- [ ] User can enter in tattoo artist information for other users to browse.
- [ ] Users can add tags to artists that other users can search by.

### Stretch Goals
- [ ] Users can up- and downvote others’ tags.
- [ ] Users can look up an Instagram account and the app will try and guess/scrape the artist’s information and location.
- [ ] App will scrape instagram to show recent tattoos.
- [ ] App will automatically geolocate user.

## Tech
- [Geolocation](https://developer.mozilla.org/en-US/docs/Web/API/Geolocation), MDN
- [Google Maps Javascript API](https://developers.google.com/maps/documentation/javascript/)
    - [Marker clustering](https://developers.google.com/maps/documentation/javascript/marker-clustering)
    - [(Reverse) geocoding](https://developers.google.com/maps/documentation/geocoding/intro#ReverseGeocoding)
- [Sequelize](http://docs.sequelizejs.com/)
- [Sass](http://sass-lang.com/)

## Links
- [Previous front-end-only attempt](https://github.com/kenziebottoms/inkmap)
- [Instagram scraping practice](https://github.com/kenziebottoms/scram)

## Node Endpoints

| Path | Method | Result |
| ---- | ------ | ------ |
| `/insta/meta/:username` | `GET` | Scrape Instagram user metadata |
| `/insta/posts/:username` | `GET` | Scrape recent Instagram user posts |
| `/register` | `POST` | Register |
| `/login` | `POST` | Login |
| `/logout` | `POST` | Logout |
| `/artists` | `GET` | Get all artists |
| `/artists:/id` | `GET` | Get one artist by `id` |

## Angular Routes

| Path | Description |
| ---- | ----------- |
| `/#!/` | Homepage |