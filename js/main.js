// analytics
var _gaq=[['_setAccount','UA-3746173-1'],['_trackPageview']];
(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
s.parentNode.insertBefore(g,s)}(document,'script'));

processDatesFromTimestamp = function(startTime) {
	console.log(startTime);
	var refreshDate = new Date(startTime * 1000);
	console.log(refreshDate);
};

jQuery(document).ready(function($) {
	$.ajax({
		url: 'https://opentechcalendar.co.uk/index.php/group/14/jsonp',
		dataType: 'jsonp',
		success: function(opentechData){
			var events = opentechData['data'];
			// console.log(events[0]['start']['timestamp']);
			processDatesFromTimestamp(events[0]['start']['timestamp']);
		}
	});

}); // doc ready

// <p>Refresh Glasgow takes place on the <strong>third Wednesday</strong> of the month. The next pub meet is on <time datetime="2013-08-21T18:30Z" class="dtstart"><strong title="2013-08-21T18:30Z" class="value-title">Wednesday 21st August</strong> at <strong>1830</strong></time> usually there will be folks arriving from nearer 1800 though.</p>