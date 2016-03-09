var render = function(data) {
	console.log('Running Render...');
	console.log(data);
	var rectW = 100;
	var rectH = 50;
	var tree_id = data.id;
	var docWidth = $(document).width();
	var margin = {
		top: 20,
		right: 20,
		bottom: 20,
		left: 20
	}

	// This function finds how deep the tree is.
	getDepth = function (root) {
	    var depth = 0;
	    if (root.children) {
	        root.children.forEach(function (d) {
	            var tmpDepth = getDepth(d)
	            if (tmpDepth > depth) {
	                depth = tmpDepth
	            }
	        })
	    }
	    return 1 + depth
	};

	// Ordinal scale to return color of rects.
	var scale = d3.scale.ordinal()
		.domain(["male", "female", "transgender"])
		.range(["steelblue", "pink", "green"]);

	var svg = d3.select(".main_g")
		.attr('transform', function(d) { return "translate(" + docWidth/ 2 + "," + 0 + ")"; } );

	var tree = d3.layout.tree()
	.nodeSize([150, 100]);

	var nodes = tree.nodes(data);
	var links = tree.links(nodes);

	// Bind data
	var node = svg.selectAll(".node")
		.data(nodes, function(d) { return d.id; });


	// node Enter phase
	node.enter()
		.append("g")
			.attr('opacity', 0)
			.attr("class", "node")
			.attr("data", function (d) { return d.id});

	// node Update Phase
		node
		.transition().duration(1000).attr("transform", function (d) { return "translate(" + d.x + "," + (d.y + rectH) + ")"; })
		.transition().duration(1000).attr('opacity', 1.0);

	var rects = node.append("rect")
		.attr("class", "rect")
		.attr("width", rectW)
		.attr("height", rectH)
		.attr("rx", 10)
		.attr("yx", 10)
		.attr("fill", function(d) { return scale(d.gender)});

	var texts = node.append("text")
		.attr("text-anchor", "middle")
		.attr("x", 50)
		.attr("y", 30)
		.attr('fill', 'black')
		.text(function (d) { if(d.spouse != null) {
		return d.first_name + " and " + d.spouse;
		} else {
			return d.first_name
		};});

	// Exit phase
	node.exit().transition().duration(1000).remove();

	var diagonal = d3.svg.diagonal()
	.projection(function (d) { return [d.x + (rectW/2), d.y + rectH]; });

	// Bind data to link
	var link = svg.selectAll(".link")
	.data(links, function(d){ return d.target.id });
	
	// link Enter Phase
	link.enter()
	.insert('path', '.node')
	.attr("class", "link")
	.attr("fill", "none")
	.attr("stroke", "grey")
	.attr("data", function (d) { return d.id})
	.call(transition);

	

	function transition(path) {
  path.transition()
      .duration(1500)
      .attrTween("stroke-dasharray", tweenDash)
};

function tweenDash() {
  var l = this.getTotalLength(),
      i = d3.interpolateString("0," + l, l + "," + l);
  return function(t) { return i(t); };
};

	// link Update Phase
	link
	.attr("d", diagonal)
	.attr("stroke-dasharray", "1, 0");
	// .call(transition);

	// link Exit Phase
	link.exit()
		.transition().duration(1000).attr('stroke', 'none')
		.transition().duration(2000).remove();

// ready function is in trees.js
ready();
	
};

$(document).on('page:load page:change', function(){
	console.log("Remove svgs...")
	// $('svg').remove();
	window.setTimeout(function(){
			if ($('.options_modal').length == 1 ) {
		console.log("Rendering...");
		render($('.main_svg').data('chart'));
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





