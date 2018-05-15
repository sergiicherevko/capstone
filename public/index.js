/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      events: [],
      sportFilter: "",
      map: null
    };
  },
  created: function() {
    axios.get("/v1/events").then(
      function(response) {
        this.events = response.data;
        console.log("events", this.events);
        console.log('put events on map', this.map);

        var map = this.map;
              var geocoder = new google.maps.Geocoder();
              this.events.forEach(
                function(event) {
                  geocoder.geocode({ address: event.address }, function(
                    results,
                    status
                  ) {
                    console.log("geocode", event.address, results, status);
                    if (status === "OK") {
                      map.setCenter(results[0].geometry.location);
                      this.marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location
                      });
                    } else {
                      alert(
                        "Geocode was not successful for the following reason: " +
                          status
                      );
                    }
                  });
                }.bind(this)
              );
            }.bind(this)
    );
  },
  mounted: function() {
    var chase_tower = { lat: 39.769653, lng: -86.157143 };
    var map = new google.maps.Map(document.getElementById("map"), {
      zoom: 14,
      center: chase_tower
    });
    this.map = map;
    var places = [];
    places.forEach(function(place) {
      var marker = new google.maps.Marker({
        position: place,
        map: map
      });

      var infowindow = new google.maps.InfoWindow({
        content: place.description
      });

      marker.addListener("click", function() {
        infowindow.open(map, marker);
      });
    });
  },
  methods: {
    validSport: function(inputEventName) {
      var lowerInputEventName = inputEventName.name.toLowerCase();
      var lowerSportFilter = this.sportFilter.toLowerCase();
      return lowerInputEventName.includes(lowerSportFilter);
    }
  },
  computed: {}
};

var CreateEventPage = {
  template: "#create-event",
  data: function() {
    return {
      eventName: "",
      address: "",
      available_datetime: "",
      description: "",
      sports: [],
      sport_id: 1,
      errors: []  
    };
  },
  created: function() {
    axios.get("/v1/sports").then(function(response) {
      console.log('sports', response.data);
      this.sports = response.data;
    }.bind(this))
  },
  methods: {
    submit: function() {
      var params = {
        // input_image_url: this.image_url,
        input_sport_id: this.sport_id,
        input_event_name: this.eventName,
        input_address: this.address,
        input_available_datetime: this.available_datetime,
        input_description: this.description
      };
      axios
        .post("/v1/events", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var CreateRequestPage = {
  template: "#create-request",
  data: function() {
    return {
      message: "",
      errors: []  
    };
  },
  created: function() {
    axios.get("/v1/requests").then(function(response) {
      console.log('requests', response.data);
      this.requests = response.data;
    }.bind(this))
  },
  methods: {
    submit: function() {
      var params = {
        input_message: this.message,
        input_event_id: this.$route.params.id
      };
      axios
        .post("/v1/requests", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var Event = {
  template: "#event",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v1/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },  
    { path: "/create_event", component: CreateEventPage },        
    { path: "/events/:id/create_request", component: CreateRequestPage }        
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});


var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});