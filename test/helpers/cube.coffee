Face = require '../../src/face.coffee'
module.exports = (chai, utils) ->
    Assertion = chai.Assertion

    Assertion.addMethod('faceLike', (expected) ->
        actual = this._obj
        new Assertion(actual).to.be.instanceof(Face )

        this.assert(
            actual.isEqualTo expected,
            """expected Face[
nw: #{expected.nw} n: #{expected.n} ne: #{expected.ne}
w: #{expected.w} c: #{expected.c} e: #{expected.e}
sw: #{expected.sw} s: #{expected.s} se: #{expected.se}] but got Face[
nw: #{actual.nw} n: #{actual.n} ne: #{actual.ne}
w: #{actual.w} c: #{actual.c} e: #{actual.e}
sw: #{actual.sw} s: #{actual.s} se: #{actual.se}""",
            """expected a different face to Face[
nw: #{expected.nw} n: #{expected.n} ne: #{expected.ne}
w: #{expected.w} c: #{expected.c} e: #{expected.e}
sw: #{expected.sw} s: #{expected.s} se: #{expected.se}]""",
            expected
        )
    )