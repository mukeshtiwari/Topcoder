#! /usr/bin/env node

var fs = require("fs");
var path = require("path");
var tc = null;

function init() {
  var gettcHome = process.env.GETTC_HOME || path.join(process.env.HOME, ".gettc");
  var includeDir = path.join(gettcHome, "include", "javascript");
  tc = require(path.join(includeDir, "topcoder"));
}

function main() {
  try {
    var input = fs.readFileSync(process.argv[2], { encoding: "ascii" });
    var reader = new tc.Reader(input);
        var dStart = reader.next('int[]'); reader.next();
    var dEnd = reader.next('int[]'); reader.next();
    var paintPerBrush = reader.next('int');

    var OneHandRoadPainting = require("./OneHandRoadPainting");
    var result = OneHandRoadPainting.fastest(dStart, dEnd, paintPerBrush);

    var writer = new tc.Writer();
    writer.next(result, "long");
    fs.writeFileSync(process.argv[3], writer.toString(), { encoding: "ascii" });
  } catch (err) {
    console.log(err.toString());
    console.trace();
  }
}

init();
main();
