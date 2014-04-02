expect = require('chai').expect
Face = require('../src/face.coffee')
Cube = require('../src/cube.coffee')
solver = require('../src/solver.coffee')

describe 'Cube solver', () ->
    it 'can solve a single-move problem', () ->
        problem = new Cube(new Face('b','b','y','b','b','y','b','b','y'),
            new Face('o','o','o','o','o','o','o','o','o'),
            new Face('b','b','b','w','w','w','w','w','w'),
            new Face('r','r','r','r','r','r','r','r','r'),
            new Face('y','y','g','y','y','g','y','y','g'),
            new Face('g','g','w','g','g','w','g','g','w'))
        solution = solver.solve(problem)
        expect(solution).to.equal('o')