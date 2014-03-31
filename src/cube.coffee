Face = require('./face.coffee')

# Blue = 1, top, north against white
# Orange = 2
# White = 3
# Red = 4
# Yellow = 5
# Green = 6, bottom, north against yellow

class Cube
    constructor: (@blueFace, @orangeFace, @whiteFace, @redFace, 
            @yellowFace, @greenFace) ->
    print: () ->
        @blueFace.print + "\n\n" +
        @orangeFace.print + "\n\n" + 
        @whiteFace.print + "\n\n" + 
        @redFace.print + "\n\n" +
        @yellowFace.print + "\n\n" +
        @greenFace.print

    isSolved: () ->
        @blueFace.solved? and
        @orangeFace.solved? and
        @whiteFace.solved? and
        @redFace.solved? and
        @yellowFace.solved? and
        @greenFace.solved?
    isEqualTo: (other) ->
        @blueFace.equal? other.blueFace and
        @orangeFace.equal? other.orangeFace and
        @whiteFace.equal? other.whiteFace and
        @redFace.equal? other.redFace and
        @yellowFace.equal? other.yellowFace and
        @greenFace.equal? other.greenFace

    rotateNamedFace = (face) ->
        new Face(face.ne, face.e, face.se,
            face.n, face.c, face.s,
            face.nw, face.w, face.sw)
    
    rotateBlueFace: () ->
        new Cube(rotateNamedFace(@blueFace), 
            new Face(@yellowFace.nw, @yellowFace.n, @yellowFace.ne,
                @orangeFace.w, @orangeFace.c, @orangeFace.e,
                @orangeFace.sw, @orangeFace.s, @orangeFace.se),
            new Face(@orangeFace.nw, @orangeFace.n, @orangeFace.ne,
                @whiteFace.w, @whiteFace.c, @whiteFace.e,
                @whiteFace.sw, @whiteFace.s, @whiteFace.se),
            new Face(@whiteFace.nw, @whiteFace.n, @whiteFace.ne,
                @redFace.w, @redFace.c, @redFace.e,
                @redFace.sw, @redFace.s, @redFace.se),
            new Face(@redFace.nw, @redFace.n, @redFace.ne,
                @yellowFace.w, @yellowFace.c, @yellowFace.e,
                @yellowFace.sw, @yellowFace.s, @yellowFace.se),
            @greenFace)
    rotateOrangeFace: () ->
        new Cube(new Face(@blueFace.nw, @blueFace.n, @whiteFace.sw,
                @blueFace.w, @blueFace.c, @whiteFace.w,
                @blueFace.sw, @blueFace.s, @whiteFace.nw),
            rotateNamedFace(@orangeFace),
            new Face(@greenFace.se, @whiteFace.n, @whiteFace.ne,
                @greenFace.e, @whiteFace.c, @whiteFace.e,
                @greenFace.ne, @whiteFace.s, @whiteFace.se),
            @redFace,
            new Face(@yellowFace.nw, @yellowFace.n, @blueFace.ne,
                @yellowFace.w, @yellowFace.c, @blueFace.e,
                @yellowFace.sw, @yellowFace.s, @blueFace.se),
            new Face(@greenFace.nw, @greenFace.n, @yellowFace.ne,
                @greenFace.w, @greenFace.c, @yellowFace.e,
                @greenFace.sw, @greenFace.s, @yellowFace.se))
    rotateWhiteFace: () ->
        new Cube(new Face(@redFace.sw,@redFace.w,@redFace.nw,
                @blueFace.w, @blueFace.c, @blueFace.e,
                @blueFace.sw, @blueFace.s, @blueFace.se),
            new Face(@orangeFace.nw, @orangeFace.n, @blueFace.nw,
                @orangeFace.w, @orangeFace.c, @blueFace.n,
                @orangeFace.sw, @orangeFace.s, @blueFace.ne),
            rotateNamedFace(@whiteFace),
            new Face(@greenFace.sw, @redFace.n, @redFace.ne,
                @greenFace.s, @redFace.c, @redFace.e,
                @greenFace.se, @redFace.s, @redFace.se),
            @yellowFace,
            new Face(@greenFace.nw, @greenFace.n, @greenFace.ne,
                @greenFace.w, @greenFace.c, @greenFace.e,
                @orangeFace.se, @orangeFace.e, @orangeFace.ne))
    rotateRedFace: () ->
        new Cube(new Face(@yellowFace.nw, @blueFace.n, @blueFace.ne,
                @yellowFace.w, @blueFace.c, @blueFace.e,
                @yellowFace.sw, @blueFace.s, @blueFace.se),
            @orangeFace,
            new Face(@whiteFace.nw, @whiteFace.n, @blueFace.sw,
                @whiteFace.w, @whiteFace.c, @blueFace.w,
                @whiteFace.sw, @whiteFace.s, @blueFace.nw),
            rotateNamedFace(@redFace),
            new Face(@greenFace.nw, @yellowFace.n, @yellowFace.ne,
                @greenFace.w, @yellowFace.c, @yellowFace.e,
                @greenFace.sw, @yellowFace.s, @yellowFace.se),
            new Face(@whiteFace.se, @greenFace.n, @greenFace.ne,
                @whiteFace.e, @greenFace.c, @greenFace.e,
                @whiteFace.ne, @greenFace.s, @greenFace.se))
    rotateYellowFace: () ->
        new Cube(new Face(@blueFace.nw, @blueFace.n, @blueFace.ne,
                @blueFace.w, @blueFace.c, @blueFace.e,
                @orangeFace.nw, @orangeFace.w, @orangeFace.sw),
            new Face(@greenFace.ne, @orangeFace.n, @orangeFace.ne,
                @greenFace.n, @orangeFace.c, @orangeFace.e,
                @greenFace.nw, @orangeFace.s, @orangeFace.se),
            @whiteFace,
            new Face(@redFace.nw, @redFace.n, @blueFace.se,
                @redFace.w, @redFace.c, @blueFace.s,
                @redFace.sw, @redFace.s, @blueFace.sw),
            rotateNamedFace(@yellowFace),
            new Face(@redFace.ne, @redFace.e, @redFace.se,
                @greenFace.w, @greenFace.c, @greenFace.e,
                @greenFace.sw, @greenFace.s, @greenFace.se))
    rotateGreenFace: () ->
        new Cube(@blueFace,
            new Face(@orangeFace.nw, @orangeFace.n, @orangeFace.ne,
                @orangeFace.w, @orangeFace.c, @orangeFace.e,
                @whiteFace.sw, @whiteFace.s, @whiteFace.se),
            new Face(@whiteFace.nw, @whiteFace.n, @whiteFace.ne,
                @whiteFace.w, @whiteFace.c, @whiteFace.e,
                @redFace.sw, @redFace.s, @redFace.se),
            new Face(@redFace.nw, @redFace.n, @redFace.ne,
                @redFace.w, @redFace.c, @redFace.e,
                @yellowFace.sw, @yellowFace.s, @yellowFace.se),
            new Face(@yellowFace.nw, @yellowFace.n, @yellowFace.ne,
                @yellowFace.w, @yellowFace.c, @yellowFace.e,
                @orangeFace.sw, @orangeFace.s, @orangeFace.se),
                rotateNamedFace(@greenFace))

module.exports = Cube
