Raphael.fn.connection = function (obj1, obj2, line, bg) {

    if (obj1.line && obj1.from && obj1.to) {
        line = obj1;
        obj1 = line.from;
        obj2 = line.to;
    }
    var bb1 = obj1.getBBox(),
        bb2 = obj2.getBBox(),
        p = [{x: bb1.x + bb1.width / 2, y: bb1.y - 1},
        {x: bb1.x + bb1.width / 2, y: bb1.y + bb1.height + 1},
        {x: bb1.x - 1, y: bb1.y + bb1.height / 2},
        {x: bb1.x + bb1.width + 1, y: bb1.y + bb1.height / 2},
        {x: bb2.x + bb2.width / 2, y: bb2.y - 1},
        {x: bb2.x + bb2.width / 2, y: bb2.y + bb2.height + 1},
        {x: bb2.x - 1, y: bb2.y + bb2.height / 2},
        {x: bb2.x + bb2.width + 1, y: bb2.y + bb2.height / 2}],
        d = {}, dis = [];
    for (var i = 0; i < 4; i++) {
        for (var j = 4; j < 8; j++) {
            var dx = Math.abs(p[i].x - p[j].x),
                dy = Math.abs(p[i].y - p[j].y);
            if ((i == j - 4) || (((i != 3 && j != 6) || p[i].x < p[j].x) && ((i != 2 && j != 7) || p[i].x > p[j].x) && ((i != 0 && j != 5) || p[i].y > p[j].y) && ((i != 1 && j != 4) || p[i].y < p[j].y))) {
                dis.push(dx + dy);
                d[dis[dis.length - 1]] = [i, j];
            }
        }
    }
    if (dis.length == 0) {
        var res = [0, 4];
    } else {
        res = d[Math.min.apply(Math, dis)];
    }
    var x1 = p[res[0]].x,
        y1 = p[res[0]].y,
        x4 = p[res[1]].x,
        y4 = p[res[1]].y;
    dx = Math.max(Math.abs(x1 - x4) / 2, 10);
    dy = Math.max(Math.abs(y1 - y4) / 2, 10);
    var x2 = [x1, x1, x1 - dx, x1 + dx][res[0]].toFixed(3),
        y2 = [y1 - dy, y1 + dy, y1, y1][res[0]].toFixed(3),
        x3 = [0, 0, 0, 0, x4, x4, x4 - dx, x4 + dx][res[1]].toFixed(3),
        y3 = [0, 0, 0, 0, y1 + dy, y1 - dy, y4, y4][res[1]].toFixed(3);
    var path = ["M", x1.toFixed(3), y1.toFixed(3), "C", x2, y2, x3, y3, x4.toFixed(3), y4.toFixed(3)].join(",");
    if (line && line.line) {
        line.bg && line.bg.attr({path: path});
        line.line.attr({path: path});
    } else {
        var color = typeof line == "string" ? line : "#000";
        return {
            bg: bg && bg.split && this.path(path).attr({stroke: bg.split("|")[0], fill: "none", "stroke-width": bg.split("|")[1] || 3}),
            line: this.path(path).attr({stroke: color, fill: "none"}),
            from: obj1,
            to: obj2
        };
    }
};

var parts = window.location.search.substr(1).split("&");
var get = {};
for (var i = 0; i < parts.length; i++) {
    var temp = parts[i].split("=");
    get[decodeURIComponent(temp[0])] = decodeURIComponent(temp[1]);
}

var el,
    app = get.app;
    
window.onload = function () {
    $.getJSON('schemas/' + app + '.json', function( schema ) {
        var dragger = function () {
                this.ox = this.type == "rect" ? this.attr("x") : this.attr("cx");
                this.oy = this.type == "rect" ? this.attr("y") : this.attr("cy");
                this.animate({"fill-opacity": .2}, 500);
            },
            move = function (dx, dy) {
                var att = this.type == "rect" ? {x: this.ox + dx, y: this.oy + dy} : {cx: this.ox + dx, cy: this.oy + dy};
                this.attr(att);
                for (var i = connections.length; i--;) {
                    r.connection(connections[i]);
                }
                r.safari();
            },
            up = function () {
                this.animate({"fill-opacity": 0}, 500);
            },
            r = Raphael("org-chart", "95%", "95%"),
            connections = [],
            shapes = [],
            getNode = function( x, y, h, w, text ) {
                var eltext = r.set();
                el = r.rect( x, y, h, w).attr({fill: '#00AA60', stroke: '#00AA60', "fill-opacity": 0, "stroke-width": 1, cursor: "move"});;
                text = r.text(x+h/2, y+w/2, text).attr({fill: '#00AA60', font: '30px Myriad Pro Regular'})
                eltext.push(el);
                eltext.push(text);
                return (eltext);
            },
            getFieldNode = function( x, y, h, w, text ) {
                var eltext = r.set();
                el = r.rect( x, y, h, w).attr({fill: '#00AA60', stroke: '#00AA60', "fill-opacity": 0, cursor: "move"});;
                text = r.text(x+h/2, y+w/2, text).attr({fill: '#00AA60', font: '24px Myriad Pro Regular'})
                eltext.push(el);
                eltext.push(text);
                return (eltext);
            };
        
        var w = r.canvas.offsetWidth - 50;
        var app = schema.app;
        var root = getNode(w/2, 50, 160, 75, app.title);
        shapes.push(root);
        
        var collections = app.collections;
        var n = collections.length;
        for( var i = 0; i<n; i++){
            var col = collections[i];
            colNode = getNode((i+1)*w/(n+1), 250, 160, 75, col.name);
            shapes.push(colNode);
            connections.push(r.connection(root, colNode, "#fff", "#fff|5"));
            var fields = col.fields;
            var nf = fields.length;
            var wf = w/n;
            for( var j = 0; j<nf; j++){
                var field = fields[j];
                if(j<nf/2)
                    y = 450 + (j*400/(nf-1));
                else
                    y = 450 + ((nf-j)*450/(nf-1));
                fieldNode = getFieldNode( i*w/n + (j+0.5)*wf/(nf), y, 100, 50, field.name);
                shapes.push(fieldNode);
                connections.push(r.connection(colNode, fieldNode, "#fff"));
            }
        }
        for( var i = 0; i<shapes.length; i++){
            shapes[i].drag(move, dragger, up);
        }
    });
};