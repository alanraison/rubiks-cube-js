Cube = require('./cube.coffee')

solve = (cube) ->
    tryMoves = (cube, moves, cubes) ->

    unless (cube.solved?) tryMoves(cube, [''], [cube])


