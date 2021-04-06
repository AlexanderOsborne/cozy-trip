# Cozy Weather

### About this App

This application was built to power a front end application that allows users to log in, plan a roadtrip, forecast the weather currently and on arrival. 

Users are able to query the API to find create routes for directions and recieve the weather forecast for thier destination on thier estimated arrival time. They can also retrieve an image related to thier search.


<!-- [AWS here](https://www.example.com) -->

## Versions

- Ruby 2.5.3

- Rails 5.2.4.3

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]


<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
      <ul>
        <li><a href="#usage">Usage</a></li>
      </ul>
      <ul>
        <li><a href="#testing">Testing</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>

### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [RSpec](https://github.com/rspec/rspec-rails)
* [OpenWeather API](https://openweathermap.org/)
* [Mapquest API](https://developer.mapquest.com/)
* [Unsplash API](https://unsplash.com/developers)
* [JSONAPI-Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)


<!-- GETTING STARTED -->
## Getting Started

This project is currently not deployed with any online platforms. So in order to utilize these data endpoints you will have to Fork/clone and test the endpoints locally.

## Prerequisites
- Ruby 2.5.3
- Rails 5.2.4.3
- Postgresql (Most recent version)

### Installation

1. Clone the repo
  ```
  git clone https://github.com/AlexanderOsborne/cozy-trip.git
  ```
  
2. Install dependencies, gem file can be found [here](https://github.com/AlexanderOsborne/cozy-trip/blob/main/Gemfile).
  ```
  bundle install
  ```
  
3. Create DB and seed
  ```
  rake db:{drop,create,migrate}
  ```
  
4. Figaro install, this will create an application.yml to house your API keys.
  ```
  bundle exec figaro install
  ```

5. Add API keys to application.yml 
  Keys can be obtained here
  - [Geocoding](https://developer.mapquest.com/)
  - [OpenWeather](https://openweathermap.org/)
  - [Unsplash](https://unsplash.com/developers)

```
GEOCODING_KEY: <Your key here]>
OPENWEATHER_KEY: <Your key here>
UNSPLASH_KEY: <Your key here>
```

6. Launch local server
  ```
  rails s
  ```

<!-- USAGE -->
## Usage
[Postman](https://www.postman.com/) is recommended to run these endpoints but they can also be done via your local server.

1. Retrieve weather for a city, returns 7 daily forecast and 48 hourly forecast.
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```
Example response
```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}
```

2. Background image for a city, returns an image associated with the destination.
```
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
```

Expected response
```
status: 200
body:

{
  "data": {
    "type": "image",
    "id": null,
    "attributes": {
      "image": {
        "location": "denver,co",
        "image_url": "https://unsplash.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
        "credit": {
          "source": "unsplash.com",
          "author": "quinntheislander",
          "logo": "https://unsplash.com/static/img/logo_square.png"
        }
      }
    }
  }
}

```

3. User registration, allows a user to register.
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

Expected response
```
status: 201
body:

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}

```

4. Login, this allows a user to log in and create roadtrips.
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
```

Expected response
```
status: 200
body:

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

5. Road trip, this will return travel time and forecast for arrival. Will return an impossible trip if no route overland exsist or if the route is disabled(bridge out).
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

Expected response
```
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
```


<!-- TESTING -->
## Testing
 
The sweater_weather application is fully tested using RSpec reporting ~100% test coverage determined by SimpleCov. To run the test suite, setup the application and run ```bundle exec rspec``` in the terminal. To run a specific test run ```bundle exec rspec <test file path>```. To open the coverage report generated by SimpleCov run ```open coverage/index.html```.

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.


<!-- CONTACT -->
## Contact

Project Link: [https://github.com/AlexanderOsborne/cozy-trip](https://github.com/AlexanderOsborne/cozy-trip)

See the [open issues](https://github.com/viewingparty/viewing_party/issues) for a list of proposed features (and known issues).


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Img Shields](https://shields.io)
* [MIT Open Source License](https://opensource.org/licenses/MIT)
* [GitHub Pages](https://pages.github.com)
* [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)






<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/AlexanderOsborne/cozy-trip.svg?style=for-the-badge
[contributors-url]: https://github.com/AlexanderOsborne/cozy-trip/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/AlexanderOsborne/cozy-trip.svg?style=for-the-badge
[forks-url]: https://github.com/AlexanderOsborne/cozy-trip/network/members
[stars-shield]: https://img.shields.io/github/stars/AlexanderOsborne/cozy-trip.svg?style=for-the-badge
[stars-url]: https://github.com/AlexanderOsborne/cozy-trip/stargazers
[issues-shield]: https://img.shields.io/github/issues/AlexanderOsborne/cozy-trip.svg?style=for-the-badge
[issues-url]: https://github.com/AlexanderOsborne/cozy-trip/issues
[product-screenshot]: images/screenshot.png

