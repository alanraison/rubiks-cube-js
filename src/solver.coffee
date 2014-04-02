Cube = require('./cube.coffee')

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

solve = (cube) ->
    tryMoves = (cube, moves, cubes) ->
        Object.keys(moves(cube))
    tryMoves(cube, [''], [cube]) unless (cube.isSolved)
    'O'

module.exports = {
    solve: solve
}
