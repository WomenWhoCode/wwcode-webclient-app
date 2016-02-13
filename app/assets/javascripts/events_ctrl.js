(function () {
  "use strict";

  angular.module("app").controller("eventsCtrl", function($scope, $http) {

    $scope.setup = function() {
      $scope.events=convertEventsDates($scope.events);
      $scope.events.selected_id=null;
    //   $http.get("/api/v1/people.json").then(function(response) {
    //     $scope.people = response.data;
    //     console.log(response);
    //   });
    }
    $scope.select_event = function(id) {
      $scope.events.selected_id=id;
    }
    $scope.events = [
        { 
          id: 1,
          title: "Women Who Code - Medellín",
          event_date: "2016-12-23 18:00:00 UTC",
          time_zone: 'US/Pacific',
          location: "Hack Reactor",
          network: {
            title:"San Francisco"
          }
        },
        { 
          id: 2,
          title: "Algorhitms and Interview Prep - TBD",
          event_date: "2016-01-01 18:45:00 UTC",
          location: "Hack Reactor",
          time_zone: 'US/Pacific',
          network: {
            title:"East Bay"
          }
        },
        { 
          id: 3,
          title: "JavaScript Study Group (Hack Reactor)",
          event_date: "2016-01-23 24:00:00 UTC",
          location: "Hack Reactor",
          time_zone: 'US/Eastern',
          network: {
            title:"New York City"
          }
        }
    ];

    window.$scope = $scope;
  
  });
}());

