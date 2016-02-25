$(document).ready(function () {

	var rect_width = 100;
	var rect_height = 50;
	var data = gon.familymembers
	var tree_id = data.id

	var canvas = d3.select(".main_container").append("svg")
		.attr("width", 1000)
		.attr("height", 1000)
		.append("g")
			.attr("transform", "translate(50, 50)");

	var tree = d3.layout.tree()
		.size([500, 400]);

	var nodes = tree.nodes(gon.familymembers);
	var links = tree.links(nodes);

	var node = canvas.selectAll("node")
		.data(nodes)
		.enter()
		.append("g")
			.attr("class", "node")
			.attr("transform", function (d) { return "translate(" + d.x + "," + d.y + ")"; })
			.attr("data", function (d) { return d.id})
			// .wrap("<div class='outer_g_div'></div>")
	// node.append("a")
	// 	.attr("controller", "familymembers")
	// 	.attr("rel", "nofollow")
	// 	.attr("href", function (d) { return "/trees/" + tree_id + "/familymembers/" + d.id})
	// 	.attr("data-method", "get");

	node.append("rect")
		.attr("class", "rect")
		.attr("width", rect_width)
		.attr("height", rect_height)
		.attr("fill", "steelblue")


	node.append("text")
		.attr("text-anchor", "middle")
		.attr("x", 50)
		.attr("y", 30)
		.text(function (d) { return d.first_name; });

	var diagonal = d3.svg.diagonal()
		.projection(function (d) { return [d.x + (rect_width/2), d.y + rect_height]; });

	canvas.selectAll(".link")
		.data(links)
		.enter()
		.append("path")
			.attr("class", "link")
			.attr("fill", "none")
			.attr("stroke", "grey")
			.attr("d", diagonal);

});