</div>
<!-- /row --> 
</div>
<!-- /container --> 
</div>
<!-- /main-inner --> 
<!-- </div> -->
<!-- /main -->
<!-- /footer --> 
<!-- Le javascript
  ================================================== --> 
  <!-- Placed at the end of the document so the pages load faster --> 
  <script src="js/jquery-1.7.2.min.js"></script> 
  <script src="js/excanvas.min.js"></script> 
  <script src="js/chart.min.js" type="text/javascript"></script> 
  <script src="js/bootstrap.js"></script>
  <script language="javascript" type="text/javascript" src="js/full-calendar/fullcalendar.min.js"></script>
  <script src="js/base.js"></script> 
  <script>     

    var lineChartData = {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [
      {
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        data: [65, 59, 90, 81, 56, 55, 40]
      },
      {
        fillColor: "rgba(151,187,205,0.5)",
        strokeColor: "rgba(151,187,205,1)",
        pointColor: "rgba(151,187,205,1)",
        pointStrokeColor: "#fff",
        data: [28, 48, 40, 19, 96, 27, 100]
      }
      ]

    }
var barChartData = {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
        {
            fillColor: "rgba(220,220,220,0.5)",
            strokeColor: "rgba(220,220,220,1)",
            data: [65, 59, 90, 81, 56, 55, 40]
        },
        {
            fillColor: "rgba(151,187,205,0.5)",
            strokeColor: "rgba(151,187,205,1)",
            data: [28, 48, 40, 19, 96, 27, 100]
        }
        ]

    }
var myLine = new Chart(document.getElementById("bar-chart").getContext("2d")).Bar(barChartData);
    var myLine = new Chart(document.getElementById("area-chart").getContext("2d")).Line(lineChartData);


    var barChartData = {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [
      {
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,1)",
        data: [65, 59, 90, 81, 56, 55, 40]
      },
      {
        fillColor: "rgba(151,187,205,0.5)",
        strokeColor: "rgba(151,187,205,1)",
        data: [28, 48, 40, 19, 96, 27, 100]
      }
      ]

    }    

    $(document).ready(function() {
      var date = new Date();
      var d = date.getDate();
      var m = date.getMonth();
      var y = date.getFullYear();
      var calendar = $('#calendar').fullCalendar({
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        selectable: true,
        selectHelper: true,
        select: function(start, end, allDay) {
          var title = prompt('Event Title:');
          if (title) {
            calendar.fullCalendar('renderEvent',
            {
              title: title,
              start: start,
              end: end,
              allDay: allDay
            },
                true // make the event "stick"
                );
          }
          calendar.fullCalendar('unselect');
        },
        editable: true,
        events: [
        {
          title: 'All Day Event',
          start: new Date(y, m, 1)
        },
        {
          title: 'Long Event',
          start: new Date(y, m, d+5),
          end: new Date(y, m, d+7)
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: new Date(y, m, d-3, 16, 0),
          allDay: false
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: new Date(y, m, d+4, 16, 0),
          allDay: false
        },
        {
          title: 'Meeting',
          start: new Date(y, m, d, 10, 30),
          allDay: false
        },
        {
          title: 'Lunch',
          start: new Date(y, m, d, 12, 0),
          end: new Date(y, m, d, 14, 0),
          allDay: false
        },
        {
          title: 'Birthday Party',
          start: new Date(y, m, d+1, 19, 0),
          end: new Date(y, m, d+1, 22, 30),
          allDay: false
        },
        {
          title: 'EGrappler.com',
          start: new Date(y, m, 28),
          end: new Date(y, m, 29),
          url: 'http://EGrappler.com/'
        }
        ]
      });
    });
    
            var doughnutData = [
            {
                value: 30,
                color: "#F7464A"
            },
            {
                value: 50,
                color: "#46BFBD"
            },
            {
                value: 100,
                color: "#FDB45C"
            },
            {
                value: 40,
                color: "#949FB1"
            },
            {
                value: 120,
                color: "#4D5360"
            }

            ];

            var myDoughnut = new Chart(document.getElementById("donut-chart").getContext("2d")).Doughnut(doughnutData);
            var pieData = [
            {
                value: 30,
                color: "#F38630"
            },
            {
                value: 50,
                color: "#E0E4CC"
            },
            {
                value: 100,
                color: "#69D2E7"
            }

            ];

            var myPie = new Chart(document.getElementById("pie-chart").getContext("2d")).Pie(pieData);

            var chartData = [
            {
             value: Math.random(),
             color: "#D97041"
         },
         {
             value: Math.random(),
             color: "#C7604C"
         },
         {
             value: Math.random(),
             color: "#21323D"
         },
         {
             value: Math.random(),
             color: "#9D9B7F"
         },
         {
             value: Math.random(),
             color: "#7D4F6D"
         },
         {
             value: Math.random(),
             color: "#584A5E"
         }
         ];
         var myPolarArea = new Chart(document.getElementById("line-chart").getContext("2d")).PolarArea(chartData);
  </script><!-- /Calendar -->
</body>
</html>
