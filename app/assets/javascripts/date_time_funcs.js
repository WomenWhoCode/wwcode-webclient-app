convertEventsDates = function(events){
  for(var i=0;i<events.length;i++){
    var UTC_time = new Date(events[i].event_date).getTime();
    var event_time_offset = -8*3600;
    //need conversion code depending on time-zone depending on network geo-cords. e.g. Google Maps Time Zone API.Trying Pacific time, no DST as example here.
    var date_at_event_time_zone= new Date(UTC_time+event_time_offset * 1000);
    events[i].month=monthNames[date_at_event_time_zone.getUTCMonth()];
    events[i].day=date_at_event_time_zone.getUTCDate();
    var hourAndAMPM=convertToAMPM(date_at_event_time_zone.getUTCHours());
    events[i].hour=hourAndAMPM[0];
    events[i].ampm=hourAndAMPM[1];
    events[i].minute=Ensure2DigitsWithLeadZero(date_at_event_time_zone.getUTCMinutes());
  };
  return events;
};

convertToAMPM = function(hour){        
    var result = [];
    hour = Math.floor(parseInt(hour))%24;
    if (hour>12 && hour < 24){
      result.push(hour-12);
      result.push("PM");
    }
    else if (hour==0 || hour==24) {
      result.push(12);
      result.push("AM");
    }
    else if (hour==12){
      result.push(12);
      result.push("PM");
    }
    else {
      result.push(hour);
      result.push("AM");
    }
    return result;
};

Ensure2DigitsWithLeadZero = function(number){
  var numStr = number.toString();
  if (numStr.length==1){
    numStr = "0" + numStr;
  }
  return numStr;
}

var monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
];
