
`var _gaq=[['_setAccount','UA-3746173-1'],['_trackPageview']];
(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
s.parentNode.insertBefore(g,s)}(document,'script'));`

processEvent = (refreshEvent) ->
	refreshDate = moment.unix refreshEvent.start.timestamp
	humanDate = refreshDate.format "dddd, MMMM Do"
	humanTime = refreshDate.format "HHmm"
	schemaTime = refreshDate.format "YYYY-MM-DDTHH:mm"
	nextEvent = refreshEvent.summary
	outputString = " The next event is <strong>#{nextEvent}</strong> on <time datetime=\"#{schemaTime}\" class=\"dtstart\"><strong title=\"#{schemaTime}\" class=\"value-title\">#{humanDate}</strong> at <strong>#{humanTime}</strong></time> usually there will be folks arriving from nearer 1800 though."
	$('.when-is-refresh').append outputString


jQuery(document).ready ($) ->
	$.ajax {
		url: 'https://opentechcalendar.co.uk/index.php/group/14/jsonp',
		dataType: 'jsonp',
		success: (opentechData) ->
			events = opentechData.data
			processEvent events[0]
	}