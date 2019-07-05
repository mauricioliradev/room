var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro',
      'Outubro', 'Novembro', 'Dezembro'],
      monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Aug', 'Set', 'Out', 'Nov', 'Dez'],
      dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
      dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
      buttonText: {
          today:    'HOJE',
          month:    'Mês',
          week:     'Semana',
          day:      'Dia'
      },
      themeSystem: 'bootstrap4',
      header: {
        left: 'title',
        right: 'prev, next, today',
      },
      defaultView: 'agendaWeek',
      views: {
        week: {
          titleFormat: '[Semana de] D MMMM YYYY',
          titleRangeSeparator: ' à ',
        }
      },
      weekNumbers: true,
      minTime: "06:00",
      maxTime: "24:00",
      selectable: true,
      selectHelper: true,
      slotLabelFormat:"HH:mm",
      editable: false,
      eventLimit: false,
      allDaySlot: false,
      timeFormat: "HH:mm",
      eventSources: [
        '/events.json'
      ],
      selectAllow: function(selectInfo) {
        return moment().diff(selectInfo.start) <= 0
      },
      dayClick: function( date, allDay, jsEvent, view ) { 
        var myDate = new Date();

        if (moment(date).format("MM/DD/YYYY HH:mm") < moment(myDate).format("MM/DD/YYYY HH:mm") ) {
          //TRUE Clicked date smaller than today + daysToadd
          alert("Não é possivel criar reservas em data inferior a data atual!");
        }
            
      },
      select: function(start, end) {
        $.getScript('/events/new', function() {
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
        });

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(event, delta, revertFunc) {
        event_data = { 
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH',
        });
      },
      
      eventClick: function(event, jsEvent, view) {
        var myDate = new Date();

        if (moment(event.start).format("MM/DD/YYYY HH:mm") < moment(myDate).format("MM/DD/YYYY HH:mm") ) {
          //TRUE Clicked date smaller than today + daysToadd
          alert("Não é possivel alterar reservas em data inferior a data atual!");
        } else {          
          var currentUser = $('span#initial-vars').data().currentUser.id;
          if (event.user == currentUser ) {
            $.getScript(event.edit_url, function() {
              $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
              $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
            });
          } else {
            alert("Não é possivel alterar reservas de outros usuários!");
          }          
        }
      }
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);

