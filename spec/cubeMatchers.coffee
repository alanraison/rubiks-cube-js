module.exports = 
    toBeAFaceLike: (util, customEqualityTesters) -> 
        compare: (actual, expected) ->
            [nw,n,ne,w,c,e,sw,s,se] = expected
            result.pass = 
                util.equals(actual.nw, nw, customEqualityTesters) and
                util.equals(actual.n, n, customEqualityTesters) and
                util.equals(actual.ne, ne, customEqualityTesters) and
                util.equals(actual.w, w, customEqualityTesters) and
                util.equals(actual.c, c, customeEqualityTesters) and
                util.equals(actual.e, e, customEqualityTesters) and
                util.equals(actual.sw, sw, customEqualityTesters) and
                util.equals(actual.s, s, customEqualityTesters) and
                util.equals(actual.se, se, customEqualityTesters)
#            if (result.pass)
#                result.message = "Expected a face matching
##{nw} #{n} #{ne}
##{w} #{c} #{e}
##{sw} #{s} #{se}"
#            else
#                result.message = "Expected a face matching
##{nw} #{n} #{ne}
##{w} #{c} #{e}
##{sw} #{s} #{se}
#but got
##{nw} #{n} #{ne}
##{w} #{c} #{e}
##{sw} #{s} #{se}"

    toBeACubeLike: (util, customEqualityTesters) ->
        compare: (actual, expected) ->
            result.pass = util.equals(actual.blueFace, expected.blueFace, customEqualityTesters) and
                util.equals(actual.orangeFace, expected.orangeFace, customEqualityTesters) and
                util.equals(actual.whiteFace, expected.whiteFace, customEqualityTesters) and
                util.equals(actual.redFace, expected.redFace, customEqualityTesters) and
                util.equals(actual.yellowFace, expected.yellowFace, customEqualityTesters) and
                util.equals(actual.greenFace, expected.greenFace, customEqualityTesters)
