#require('underscore')
Face = require('./face.coffee')

# Blue = 1, top, north against white
# Orange = 2
# White = 3
# Red = 4
# Yellow = 5
# Green = 6, bottom, north against yellow

r = 'red'
b = 'blue'
w = 'white'
y = 'yellow'
g = 'green'
o = 'orange'

class SquareFace
    colour = null
    constructor: (@colour) -> colour = @colour

class CornerCube
    leftFace = topFace = frontFace = null
    constructor: (@left, @top, @front) ->
        leftFace = @left
        topFace = @top
        frontFace = @front

class EdgeCube
    topFace = frontFace = null
    constructor: (@top, @front) ->
        topFace = @top
        frontFace = @front

module.export = class Cube
    blueFace = yellowFace = greenFace = whiteFace = orangeFace = redFace = null
    constructor: (@blueFace, @orangeFace, @whiteFace, @redFace, 
            @yellowFace, @greenFace) ->
        blueFace = @blueFace
        orangeFace = @orangeFace
        whiteFace = @whiteFace
        redFace = @redFace
        yellowFace = @yellowFace
        greenFace = @greenFace
    print: () ->
        blueFace.print + "\n\n" +
        orangeFace.print + "\n\n" + 
        whiteFace.print + "\n\n" + 
        redFace.print + "\n\n" +
        yellowFace.print + "\n\n" +
        greenFace.print
    
    rotateBlueFace: () ->
        new Cube(rotateNamedFace(blueFace), 
            new Face(yellowFace.nw, yellowFace.n, yellowFace.ne,
                orangeFace.w, orangeFace.c, orangeFace.e,
                orangeFace.sw, orangeFace.s, orangeFace.se),
            new Face(orangeFace.nw, orangeFace.n, orangeFace.ne,
                whiteFace.w, whiteFace.c, whiteFace.e,
                whiteFace.sw, whiteFace.s, whiteFace.se),
            new Face(whiteFace.nw, whiteFace.n, whiteFace.ne,
                redFace.w, redFace.c, redFace.e,
                redFace.sw, redFace.s, redFace.se),
            new Face(redFace.nw, redFace.n, redFace.ne,
                yellowFace.w, yellowFace.c, yellowFace.e,
                yellowFace.sw, yellowFace.s, yellowFace.se),
            greenFace)
    rotateOrangeFace: () ->
        new Cube(new Face(blueFace.nw, blueFace.n, whiteFace.se,
                blueFace.w, blueFace.c, whiteFace.e,
                blueFace.sw, blueFace.s, whiteFace.ne),
            new Face(orangeFace.ne, orangeFace.e, orangeFace.se,
                orangeFace.n, orangeFace.c, orangeFace.s,
                orangeFace.nw, orangeFace.w, orangeFace.sw),
            new Face(greenFace.se, whiteFace.n, whiteFace.ne,
                greenFace.e, whiteFace.c, whiteFace.e,
                greenFace.ne, whiteFace.s, whiteFace.se),
            redFace,
            new Face(yellowFace.nw, yellowFace.n, blueFace.ne,
                yellowFace.w, yellowFace.c, blueFace.e,
                yellowFace.sw, yellowFace.s, blueFace.sw),
            new Face(greenFace.nw, greenFace.n, yellowFace.ne,
                greenFace.w, greenFace.c, yellowFace.e,
                greenFace.sw, greenFace.s, yellowFace.sw))
    rotateWhiteFace: () ->
        new Cube(new Face(redFace.nw,redFace.w,redFace.sw,
                blueFace.w, blueFace.c, blueFace.e,
                blueFace.sw, blueFace.s, blueFace.se),
            new Face(orangeFace.nw, orangeFace.n, blueFace.nw,
                orangeFace.w, orangeFace.c, blueFace.n,
                orangeFace.sw, orangeFace.s, blueFace.ne),
            new Face(whiteFace.ne, whiteFace.e, whiteFace.se,
                whiteFace.n, whiteFace.c, whiteFace.s,
                whiteFace.nw, whiteFace.w, whiteFace.sw),
            new Face(greenFace.sw, redFace.n, redFace.ne,
                greenFace.s, redFace.c, redFace.w,
                greenFace.se, redFace.s, redFace.se),
            yellowFace,
            new Face(greenFace.nw, greenFace.n, greenFace.nw,
                greenFace.w, greenFace.c, greenFace.e,
                orangeFace.se, orangeFace.e, orangeFace.ne))
    rotateRedFace: () ->
        new Cube(new Face(yellowFace.nw, blueFace.n, blueFace.ne,
                yellowFace.w, blueFace.c, blueFace.e,
                yellowFace.sw, blueFace.s, blueFace.se),
            orangeFace,
            new Face(whiteFace.nw, whiteFace.n, blueFace.sw,
                whiteFace.w, whiteFace.c, blueFace.w,
                whiteFace.sw, whiteFace.s, blueFace.nw),
            rotateNamedFace(redFace),
            new Face(greenFace.nw, yellowFace.n, yellowFace.ne,
                greenFace.w, yellowFace.c, yellowFace.e,
                greenFace.sw, yellowFace.s, yellowFace.se))
    rotateNamedFace: (face) ->
        new Face(face.ne, face.e, face.se,
            face.n, face.c, face.s,
            face.nw, face.w, face.sw)

