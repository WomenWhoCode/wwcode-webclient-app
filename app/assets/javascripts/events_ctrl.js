(function () {
  "use strict";

  angular.module("app").controller("EventsCtrl", function($scope, $http) {

    $scope.setup = function() {
      $scope.events=convertEventsDates($scope.events);
      $scope.setupColors();
      $scope.selectEvent(findSoonestEvent($scope.events));
    //   $http.get("/api/v1/people.json").then(function(response) {
    //     $scope.people = response.data;
    //     console.log(response);
    //   });
    }

    $scope.setupColors = function(){ $scope.events.bgColorHeadDefault="#00b6aa";
      $scope.events.bgColorBodyDefault="#fafafa";
      //009688
      $scope.events.bgColorHeadSelected="#009688";
      $scope.events.bgColorBodySelected="#ffffff";
      $scope.events.bgColorHeadMouseover="#faa73f";
      $scope.events.bgColorBodyMouseover="#eeeeee";

      for (var i=0;i<$scope.events.length;i++){   
        $scope.events[i].bgColorHead=$scope.events.bgColorHeadDefault;
        $scope.events[i].bgColorBody=$scope.events.bgColorBodyDefault;
      }
    }

    $scope.selectEvent = function(event) {
      $scope.events.selected_id=event.id;
      $scope.events.selected_title=event.title;
      $scope.events.selected_subscribe_count=event.subscribe_count;
      $scope.setupColors();//reset the color settings so that any other events that were previously clicked are no longer highlighted
      if ( $('#event'+event.id+':hover').length )//if the event's div is still being hovered (moused-over) after selection, return to hover colors:
       {
        $scope.mouseoverEvent(event);
      }
      //the only time the event's div is not hovered (moused-over) after selection is when an event is auto-selected on page load
      else {
        $scope.highlightSelectedEvent(event);
      }
    }

    $scope.highlightSelectedEvent =function(event){
      event.bgColorHead=$scope.events.bgColorHeadSelected;
      event.bgColorBody=$scope.events.bgColorBodySelected;
    }

    $scope.mouseoverEvent = function(event){
      event.bgColorHead=$scope.events.bgColorHeadMouseover;
      event.bgColorBody=$scope.events.bgColorBodyMouseover;
    }

    $scope.mouseleaveEvent = function(event){
      if (event.id == $scope.events.selected_id){
        $scope.        highlightSelectedEvent(event);
      }
      else{
      event.bgColorHead=$scope.events.bgColorHeadDefault;
      event.bgColorBody=$scope.events.bgColorBodyDefault;
      }
    }

    $scope.events = [
        { 
          id: 1,
          title: "Women Who Code - Medellín",
          event_date: "2015-12-23 18:00:00 UTC",
          time_zone: 'US/Pacific',
          location: "Hack Reactor",
          network: {
            title:"San Francisco"
          },
          subscribe_count: 1
        },
        { 
          id: 4,
          title: "Algorhitms and Interview Prep - TBD",
          event_date: "2016-01-01 18:45:00 UTC",
          location: "Hack Reactor",
          time_zone: 'US/Pacific',
          network: {
            title:"East Bay"
          },
          subscribe_count: 11
        },
        { 
          id: 3,
          title: "JavaScript Study Group (Hack Reactor)",
          event_date: "2016-01-23 24:00:00 UTC",
          location: "Hack Reactor",
          time_zone: 'US/Eastern',
          network: {
            title:"New York City"
          },
          subscribe_count: 0
        }
    ];

    window.$scope = $scope;
  
  });
}());

