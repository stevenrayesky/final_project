$(document).ready(function () {

	var canvas = d3.select("body").append("svg")
		.attr("width", 1000)
		.attr("height", 1000)
		.append("g")
			.attr("transform", "translate(50, 50)");

	var tree = d3.layout.tree()
		.size([500, 100]);

	var nodes = tree.nodes(gon.familymembers);
	var links = tree.links(nodes);

	var node = canvas.selectAll("node")
		.data(nodes)
		.enter()
		.append("g")
			.attr("class", "node")
			.attr("transform", function (d) { return "translate(" + d.x + "," + d.y + ")"; })

	node.append("circle")
		.attr("r", 5)
		.attr("fill", "steelblue")


	node.append("text")
		.text(function (d) { return d.first_name; });

	var diagonal = d3.svg.diagonal()
		.projection(function (d) { return [d.x, d.y]; });

	canvas.selectAll(".link")
		.data(links)
		.enter()
		.append("path")
			.attr("class", "link")
			.attr("fill", "none")
			.attr("stroke", "grey")
			.attr("d", diagonal);

});