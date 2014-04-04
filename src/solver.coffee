Cube = require('./models.coffee').cube
#helpers = require './solverHelper.coffee'
_ = require 'underscore'

moves = {
    'b': (cube) -> cube.rotateBlueFace(),
    'B': (cube) -> cube.rotateBlueFace().rotateBlueFace().rotateBlueFace(),
    'o': (cube) -> cube.rotateOrangeFace(),
    'O': (cube) -> cube.rotateOrangeFace().rotateOrangeFace().rotateOrangeFace(),
    'w': (cube) -> cube.rotateWhiteFace(),
    'W': (cube) -> cube.rotateWhiteFace().rotateWhiteFace().rotateWhiteFace(),
    'r': (cube) -> cube.rotateRedFace(),
    'R': (cube) -> cube.rotateRedFace().rotateRedFace().rotateRedFace(),
    'y': (cube) -> cube.rotateYellowFace(),
    'Y': (cube) -> cube.rotateYellowFace().rotateYellowFace().rotateYellowFace(),
    'g': (cube) -> cube.rotateGreenFace(),
    'G': (cube) -> cube.rotateGreenFace().rotateGreenFace().rotateGreenFace()
}

class Solver
    constructor: (@allKnownCubes) ->

    haveNotSeen: (cube) ->
        not _.some(@allKnownCubes, (c) -> c.isEqualTo(cube))

    nextGeneration: (currentGeneration) ->
        _.flatten(for path, cube of currentGeneration
            _.flatten(for move, change of moves when this.haveNotSeen(newCube = change(cube))
                ["#{path}#{move}", newCube]
            )
        )

module.exports =
    solve: (cube) ->
        allKnownCubes = [cube]
        'O'
    Solver: Solver