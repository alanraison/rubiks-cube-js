"use strict"
Cube = require('./models.coffee').cube
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

module.exports =
    solve: (cube) ->
        currentGeneration = {"": cube}
        allKnownCubes = [cube]
        while (solution = _.find(_.pairs(currentGeneration), (x) -> x[1].isSolved())) is undefined
            currentGeneration = this.nextGeneration(currentGeneration, allKnownCubes)
            allKnownCubes = allKnownCubes.concat(_.values(currentGeneration))
        solution[0]

    haveSeen: (cube, allKnownCubes) ->
        _.some(allKnownCubes, (c) -> c.isEqualTo(cube))

    nextGeneration: (currentGeneration, allKnownCubes) ->
        nextGen = {}
        for path, cube of currentGeneration
            for move, change of moves when not this.haveSeen(newCube = change(cube), allKnownCubes)
                key = "#{path}#{move}"
                nextGen[key] = newCube
        nextGen
