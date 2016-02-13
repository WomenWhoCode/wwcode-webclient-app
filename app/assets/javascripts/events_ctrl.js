(function () {
  "use strict";

  angular.module("app").controller("eventsCtrl", function($scope, $http) {

    $scope.setup = function() {
      $scope.events=convertEventsDates($scope.events);
      $scope.events.selected_id=null;
      $scope.setupColors();
    //   $http.get("/api/v1/people.json").then(function(response) {
    //     $scope.people = response.data;
    //     console.log(response);
    //   });
    }

    $scope.setupColors = function(){ $scope.events.defaultBgColorHead="#00B6AA";
      $scope.events.defaultBgColorBody="#FAFAFA";
      for (var i=0;i<$scope.events.length;i++){   
        $scope.events[i].bgColorHead=$scope.events.defaultBgColorHead;
        $scope.events[i].bgColorBody=$scope.events.defaultBgColorBody;
      }
    }

    $scope.select_event = function(event) {
      $scope.events.selected_id=event.id;
      $scope.setupColors();//reset the color settings so that any other events that were previously clicked are no longer highlighted
      $scope.mouseoverEvent(event);
    }

    $scope.highlightSelectedEvent =function(event){
      event.bgColorHead="#009688";
    }

    $scope.mouseoverEvent = function(event){
      event.bgColorHead="#faa73f";
      event.bgColorBody="#EEEEEE";
    }

    $scope.mouseleaveEvent = function(event){
      if (event.id == $scope.events.selected_id){
        $scope.        highlightSelectedEvent(event);
      }
      else{
      event.bgColorHead=$scope.events.defaultBgColorHead;
      event.bgColorBody=$scope.events.defaultBgColorBody;
      }
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

