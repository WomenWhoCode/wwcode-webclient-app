convertEventsDates = function(events){
  for(var i=0;i<events.length;i++){
    eventMozDate = convertToMozFriendlyDate(events[i].event_date);//need to convert to Firefox-friendly format
    var UTC_datetime_milli = new Date(eventMozDate).getTime();
    //returns the number of milliseconds between the event date (stored in UTC) and 12 AM, Jan 1970, UTC
    var event_time_offset = moment.tz.zone(events[i].time_zone).offset(UTC_datetime_milli);
    //Example: an event happening on Jan 1, 2016 6:30 PM in San Francisco is  stored in the database in 2 columns:
    //event_date: '2016-01-02 02:30:00 UTC' and time_zone 'US/Pacific'
    //moment.tz.zone(timeZoneName).offset is part of the moment-timezone.js library
    // this function returns the offset in minutes - e.g. 480 min (60*8h) for a time zone name like 'US/Pacific Time'
    var date_at_event_time_zone=new Date(UTC_datetime_milli-event_time_offset * 60000);
    //Continuing with the above example, we want to display the month, date, hour, and minutes for an event Jan 1, 2016 6:30 PM in San Francisco
    //We now have the UTC date representation in millisec since Jan 1, 1970: UTC_datetime_milli. 
    //We want to extract from it the month, date, hour, etc.
    // js offers date.getMonth(), date.getDate(), etc, but these convert to the time-zone setting of the device where the page was opened.
    //Thus, if we wanted to view a San Francisco event while in New York - getMonth would convert UTC time to Eastern time which would be wrong
    //The solution is to perform a pseudo-conversion and use getUTCMonth, getUTCDate, etc. 
    //First the pseudo conversion: we have to apply the offset of 480 minutes to the UTC date representation
    //We take UTC_datetime_milli and subtract the event_time_offset converted to milliseconds: 
    //1451701800000 ms - 480 min * 60000 ms/min = 1451413800000
    // By doing this, we changed from 2:30 AM Jan 2, UTC to 6:30PM Jan 1, UTC.
    //We can now disregard the "UTC" part and just extract 6:30PM, Jan 1 - as this is exactly the time we need for this San Francisco event
    //For this we can use the getUTC... functions below to extract desired date/time parts: January, 1, 6(PM), and 30.
    events[i].month=monthNames[date_at_event_time_zone.getUTCMonth()];

    events[i].date=ensure2DigitsWithLeadZero(date_at_event_time_zone.getUTCDate());

    var hourAndAMPM=convertToAMPM(date_at_event_time_zone.getUTCHours());
    events[i].hour=hourAndAMPM[0];
    events[i].ampm=hourAndAMPM[1];

    events[i].minute=ensure2DigitsWithLeadZero(date_at_event_time_zone.getUTCMinutes());
  };
  return events;
};

convertToMozFriendlyDate = function(dateString){
  var index_space_first = dateString.indexOf(" ")
  var index_space_last = dateString.indexOf(" UTC");
  return dateString.slice(0,index_space_first) + "T" + dateString.slice(index_space_first+1,index_space_last) + "Z";
}

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

ensure2DigitsWithLeadZero = function(number){
  var numStr = number.toString();
  if (numStr.length==1){
    numStr = "0" + numStr;
  }
  return numStr;
}

var monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
];

findSoonestEvent = function(events){
  var soonestEvent = events[0];
  for(var i=0;i<events.length;i++){
    if (events[i].event_date<soonestEvent.event_date){
      soonestEvent = events[i];
    }
  }
  return soonestEvent;
}