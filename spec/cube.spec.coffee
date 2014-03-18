jasmine = require('jasmine-node')
describe 'Cube', () ->
    cubeMatchers = require('./cubeMatchers.coffee')
    Cube = require('../cube.coffee')
    Face = require('../face.coffee')

    beforeEach ->
        jasmine.addMatchers(cubeMatchers)

    constantFace = (c) ->
        new Face(c,c,c,
            c,c,c,
            c,c,c)

    it "twists red face correctly", () ->
        initial = new Cube(constantFace('b'),
            constantFace('o'),
            constantFace('w'),
            constantFace('r'),
            constantFace('y'),
            constantFace('g'))
        actual = initial.rotateRedFace()
        expect(actual.redFace).toBeAFaceLike ['r','r','r','r','r','r','r','r','r']
