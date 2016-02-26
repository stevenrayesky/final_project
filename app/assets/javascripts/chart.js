var render = function(resource) {
	var rect_width = 100;
	var rect_height = 50;
	var data = resource;
	var tree_id = data.id;

	// var svg = d3.select(".main_container").append("svg")
	// .attr("width", 1000)
	// .attr("height", 1000)
	// .append("g")
	// .attr("transform", "translate(50, 50)");

	var svg = d3.select(".main_g");

	var tree = d3.layout.tree()
	.size([700, 400]);

	var nodes = tree.nodes(resource);
	var links = tree.links(nodes);

	// Bind data
	var node = svg.selectAll("node").data(nodes);
	
	// Enter phase
	node.enter().append("g")
	.attr("class", "node")
	.attr("transform", function (d) { return "translate(" + d.x + "," + d.y + ")"; })
	.attr("data", function (d) { return d.id})

	// Update phase
	node
	.append("rect")
	.attr("class", "rect")
	.attr("width", rect_width)
	.attr("height", rect_height)
	.attr("fill", "steelblue")
	node.append("text")
	.attr("text-anchor", "middle")
	.attr("x", 50)
	.attr("y", 30)
	.text(function (d) { return d.first_name; });

	// Exit phase
	node.exit().remove();

	var diagonal = d3.svg.diagonal()
	.projection(function (d) { return [d.x + (rect_width/2), d.y + rect_height]; });

	svg.selectAll(".link")
	.data(links)
	.enter()
	.append("path")
	.attr("class", "link")
	.attr("fill", "none")
	.attr("stroke", "grey")
	.attr("d", diagonal);

// ready function is in trees.js
ready();

};

$(document).on('page:load page:change', function(){
	console.log("Remove svgs...")
	// $('svg').remove();
	window.setTimeout(function(){
			if ($('.options_modal').length == 1 ) {
		console.log("Rendering...")
		render(gon.familymembers)
	}
	},1000);

});


// gon.watch('familymembers', render);

// $(document).on('page:change', function(){
// 	render(gon.familymembers);
// });
// $(document).on('ajax:complete', render(gon.familydelete));
// render(gon.familymembers);

// $(document).on("page:change ready ajax:complete", function(){
	// alert("struff");
	// $('body').append("HELLO");
// 	$('.show_tree').click(function(){
// 		render(gon.familymembers);
// 		// $('svg').toggle(5000);
// 	})
// 	setTimeout(function(){
// 			$('.show_tree').click();

// 		}, 400)
// });
// $(document).on('page:load', render(gon.familymembers));

// function checkVariable() {
// 	console.log("Checking gon.familymembers...")
// 	if ($('.options_modal').length == 1 ) {
// 		console.log("gon is defined")
// 		console.log("Rendering...")
// 		render(gon.familymembers);
// }else {
// 		console.log("Checking again...")
// 		window.setTimeout("checkVariable();",3000);
// 		};
// };

// $(document).on('page:load', function(){

// 	checkVariable();

// });






// $(document).on('page:load', function(){
// 	setTimeout(function() {
// 		console.log("setTimeout...")
// 		render(gon.familymembers)}
// 		,3000)
// });



 // if ($('body').length) {
 // 	console.log("modal?")
 // 	checkVariable();
 // } else {
 // 	console.log("No modal")
 // }





