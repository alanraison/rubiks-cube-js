chai = require('chai')
chai.should()
faceAssertions = require('./helpers/cube.coffee')
chai.use(faceAssertions)

describe.only 'Cube', () ->
    Cube = require '../src/cube.coffee'
    Face = require '../src/face.coffee'

    constantFace = (c) ->
        new Face("#{c}nw","#{c}n","#{c}ne",
            "#{c}w","#{c}c","#{c}e",
            "#{c}sw","#{c}s","#{c}se")

    rotatedFace = (c) ->
        new Face("#{c}ne","#{c}e","#{c}se",
            "#{c}n","#{c}c","#{c}s",
            "#{c}nw","#{c}w","#{c}sw")

    face = (nw, n, ne, w, c, e, sw, s, se) ->
        new Face("#{nw}nw", "#{n}n", "#{ne}ne",
            "#{w}w", "#{c}c", "#{e}e",
            "#{sw}sw", "#{s}s","#{se}se"
        )

    initial = new Cube(constantFace('b'),
        constantFace('o'),
        constantFace('w'),
        constantFace('r'),
        constantFace('y'),
        constantFace('g'))

    it 'equates equivalent cubes', () ->
        second = new Cube(constantFace('b'),
            constantFace('o'),
            constantFace('w'),
            constantFace('r'),
            constantFace('y'),
            constantFace('g'))
        initial.isEqualTo(second).should.be.true

    it 'does not equate different cubes', () ->
        second = new Cube(constantFace('y'),
            constantFace('g'),
            constantFace('b'),
            constantFace('w'),
            constantFace('o'),
            constantFace('r'))
        initial.isEqualTo(second).should.be.false

    describe 'twisting blue face', () ->
        actual = initial.rotateBlueFace()

        it 'twists blue face correctly', () ->
            actual.blueFace.should.be.a.faceLike(rotatedFace 'b')
        it 'twists green face correctly', () ->
            actual.greenFace.should.be.a.faceLike(constantFace 'g')
        it 'twists orange face correctly', () ->
            actual.orangeFace.should.be.a.faceLike(face(
                'y','y','y','o','o','o','o','o','o'
            ))
        it 'twists white face correctly', () ->
            actual.whiteFace.should.be.a.faceLike(face(
                'o','o','o','w','w','w','w','w','w'
            ))
        it 'twists red face correctly', () ->
            actual.redFace.should.be.a.faceLike(face(
                'w','w','w','r','r','r','r','r','r'
            ))
        it 'twists yellow face correctly', () ->
            actual.yellowFace.should.be.a.faceLike(face(
                'r','r','r','y','y','y','y','y','y'
            ))

    describe 'twisting orange face', () ->
        actual = initial.rotateOrangeFace()

        it 'twists orange face correctly', () ->
            actual.orangeFace.should.be.a.faceLike(rotatedFace 'o')
        it 'twists red face correctly', () ->
            actual.redFace.should.be.a.faceLike(constantFace 'r')
        it 'twists blue face correctly', () ->
            actual.blueFace.should.be.a.faceLike(new Face(
                'bnw','bn','wsw','bw','bc','ww','bsw','bs','wnw'
            ))
        it 'twists white face correctly', () ->
            actual.whiteFace.should.be.a.faceLike(new Face(
                'gse','wn','wne','ge','wc','we','gne','ws','wse'
            ))
        it 'twists green face correctly', () ->
            actual.greenFace.should.be.a.faceLike(face(
                'g','g','y','g','g','y','g','g','y'
            ))
        it 'twists yellow face correctly', () ->
            actual.yellowFace.should.be.a.faceLike(face(
                'y','y','b','y','y','b','y','y','b'
            ))

    describe 'twisting white face', () ->
        actual = initial.rotateWhiteFace()

        it 'twists white face correctly', () ->
            actual.whiteFace.should.be.a.faceLike(rotatedFace 'w')
        it 'twists yellow face correctly', () ->
            actual.yellowFace.should.be.a.faceLike(constantFace 'y')
        it 'twists blue face correctly', () ->
            actual.blueFace.should.be.a.faceLike(new Face(
                'rsw','rw','rnw','bw','bc','be','bsw','bs','bse'
            ))
        it 'twists orange face correctly', () ->
            actual.orangeFace.should.be.a.faceLike(new Face(
                'onw','on','bnw','ow','oc','bn','osw','os','bne'
            ))
        it 'twists green face correctly', () ->
            actual.greenFace.should.be.a.faceLike(new Face(
                'gnw','gn','gne','gw','gc','ge','ose','oe','one'
            ))
        it 'twists red face correctly', () ->
            actual.redFace.should.be.a.faceLike(new Face(
                'gsw','rn','rne','gs','rc','re','gse','rs','rse'
            ))

    describe 'twisting red face', () ->
        actual = initial.rotateRedFace()

        it 'twists red face correctly', () ->
            actual.redFace.should.be.a.faceLike(rotatedFace 'r')
        it 'twists orange face correctly', () ->
            actual.orangeFace.should.be.a.faceLike(constantFace 'o')
        it 'twists blue face correctly', () ->
            actual.blueFace.should.be.a.faceLike(face(
                'y','b','b','y','b','b','y','b','b'
            ))
        it 'twists white face correctly', () ->
            actual.whiteFace.should.be.a.faceLike(new Face(
                'wnw','wn','bsw','ww','wc','bw','wsw','ws','bnw'
            ))
        it 'twists green face correctly', () ->
            actual.greenFace.should.be.a.faceLike(new Face(
                'wse','gn','gne','we','gc','ge','wne','gs','gse'
            ))
        it 'twists yellow face correctly', () ->
            actual.yellowFace.should.be.a.faceLike(face(
                'g','y','y','g','y','y','g','y','y'
            ))

    describe 'twisting yellow face', () ->
        actual = initial.rotateYellowFace()

        it 'twists yellow face correctly', () ->
            actual.yellowFace.should.be.a.faceLike(rotatedFace 'y')
        it 'twists white face correctly', () ->
            actual.whiteFace.should.be.a.faceLike(constantFace 'w')
        it 'twists blue face correctly', () ->
            actual.blueFace.should.be.a.faceLike(new Face(
                'bnw','bn','bne','bw','bc','be','onw', 'ow','osw'
            ))
        it 'twists orange face correctly', () ->
            actual.orangeFace.should.be.a.faceLike(new Face(
                'gne','on','one','gn','oc','oe','gnw','os','ose'
            ))
        it 'twists green face correctly', () ->
            actual.greenFace.should.be.a.faceLike(new Face(
                'rne','re','rse','gw','gc','ge','gsw','gs','gse'
            ))
        it 'twists red face correctly', () ->
            actual.redFace.should.be.a.faceLike(new Face(
                'rnw','rn','bse','rw','rc','bs','rsw','rs','bsw'
            ))

    describe 'twisting green face', () ->
        actual = initial.rotateGreenFace()

        it 'twists green face correctly', () ->
            actual.greenFace.should.be.a.faceLike(rotatedFace 'g')
        it 'twists blue face correctly', () ->
            actual.blueFace.should.be.a.faceLike(constantFace 'b')
        it 'twists orange face correctly', () ->
            actual.orangeFace.should.be.a.faceLike(face(
                'o','o','o','o','o','o','w','w','w'
            ))
        it 'twists white face correctly', () ->
            actual.whiteFace.should.be.a.faceLike(face(
                'w','w','w','w','w','w','r','r','r'
            ))
        it 'twists red face correctly', () ->
            actual.redFace.should.be.a.faceLike(face(
                'r','r','r','r','r','r','y','y','y'
            ))
        it 'twists yellow face correctly', () ->
            actual.yellowFace.should.be.a.faceLike(face(
                'y','y','y','y','y','y','o','o','o'
            ))