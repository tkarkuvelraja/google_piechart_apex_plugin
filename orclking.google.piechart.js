/*
 * Google Pie Chart
 * Plug-in Type: Region
 * Summary: Google visualization: PieChart region plugin used to display visualization of data in the form of pie chart.
 *
 * ----- Contact information ----
 *
 * Developed by * Evaluate Consulting Services, Bangalore
 * Contact: info@evaluatecs.com
 *
 * @author Karkuvelraja Thangamariappan - tkarkuvelraja@gmail.com
 * Profile: https://www.linkedin.com/in/karkuvelrajathangamariappan
 * Twitter: https://twitter.com/tkarkuvelraja
 * Blog: http://orclking.blogspot.com/
 */

function drawPieChart(regionId,chart_width,chart_height,chart_title,chart_is_3d) 
{
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Region');
  data.addColumn('number', 'Value');
  var gData=JSON.parse($("div.piechart-data-"+regionId).html());
  if (gData.data.length>0)
  {
      for (var i = 0, len = gData.data.length; i < len; ++i) {
           var rec = gData.data[i];
          data.addRow([rec.region,rec.val]);
       }
   }
     
      var piechart_options = {title:chart_title,
                                 width:chart_width,
                                 height:chart_height,
								 is3D: chart_is_3d};
								 
	  var piechart = new google.visualization.PieChart(document.getElementById('piechart_div_'+regionId));
	  piechart.draw(data, piechart_options);
	 

};