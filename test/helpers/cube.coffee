"use strict"
models = require('../../src/models.coffee')
Face = models.face
Cube = models.cube
pad = (s, pad) ->
    "#{s}#{ pad.substring(s.length + 1)}"
renderFace = (f) ->
    l = Math.max(f.nw.length, f.n.length, f.ne.length,
        f.w.length, f.c.length, f.e.length,
        f.sw.length, f.s.length, f.se.length)
    p = (" " for x in [0..l]).join('')
    """Face[
#{pad(f.nw,p)} #{pad(f.n,p)} #{pad(f.ne,p)}
#{pad(f.w,p)} #{pad(f.c,p)} #{pad(f.e,p)}
#{pad(f.sw,p)} #{pad(f.s,p)} #{pad(f.se,p)}
]"""

renderCube = (c) ->
    """Cube[
blue: """ + renderFace(c.blueFace) + """
orange: """ + renderFace(c.orangeFace) + """
white: """ + renderFace(c.whiteFace) + """
red: """ + renderFace(c.redFace) + """
yellow: """ + renderFace(c.yellowFace) + """
green: """ + renderFace(c.greenFace) + "\n]"

module.exports = (chai, utils) ->
    Assertion = chai.Assertion


    Assertion.addMethod('faceLike', (expected) ->
        actual = this._obj
        new Assertion(actual).to.be.instanceof(Face )

        this.assert(
            actual.nw is expected.nw and
            actual.n is expected.n and
            actual.ne is expected.ne and
            actual.w is expected.w and
            actual.c is expected.c and
            actual.e is expected.e and
            actual.sw is expected.sw and
            actual.s is expected.s and
            actual.se is expected.se,
            "expected " + renderFace(expected) +
            " but got " + renderFace(actual),
            "expected a different face to " + renderFace(expected),
            expected
        )
    )

    Assertion.addMethod('cubeLike', (expected) ->
        actual = this._obj
        new Assertion(actual).to.be.instanceof(Cube )

        this.assert(
            actual.blueFace.isEqualTo(expected.blueFace) and
            actual.orangeFace.isEqualTo(expected.orangeFace) and
            actual.whiteFace.isEqualTo(expected.whiteFace) and
            actual.redFace.isEqualTo(expected.redFace) and
            actual.yellowFace.isEqualTo(expected.yellowFace) and
            actual.greenFace.isEqualTo(expected.greenFace),
            "expected " + renderCube(expected) +
            " but got " + renderCube(actual),
            "expected a different cube to " + renderCube(expected),
            expected
        )
    )