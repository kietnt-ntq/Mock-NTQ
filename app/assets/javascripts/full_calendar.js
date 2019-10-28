var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    var group_id = $("#calendar").data("group-id");
    calendar.fullCalendar({
      header: {
        left: 'prev',
        center: 'title',
        right: 'next'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      events: '/groups/' + group_id + '/events.json',

      select: function(start, end) {
        var currentDate = moment().format('YYYY-MM-DD');
        var date = moment(start).format('YYYY-MM-DD');
        if(date >= currentDate) {
          var group_id = $("#calendar").data("group-id");
          $.getScript('/groups/' + group_id +'/events/new?startDate=' + date, function() {});
          calendar.fullCalendar('unselect');
        }

      },

      eventDrop: function(event, delta, revertFunc) {
        var  event_data = {
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },

      eventClick: function(event, jsEvent, view) {
        $.getScript(event.edit_url, function() {});
      }
    });
  })
};

$(document).ready(function(){
  initialize_calendar();
});