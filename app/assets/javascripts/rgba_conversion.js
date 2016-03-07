function hexToRgba(hex) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? "rgba(" +
        parseInt(result[1], 16) + "," +
        parseInt(result[2], 16) + "," +
        parseInt(result[3], 16) + ",1)"
      : null;
}

function replaceAlpha(rgbaString,alphaString){
  return rgbaString.substring(0,rgbaString.lastIndexOf(",")+1)+alphaString+")"
}
