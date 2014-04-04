expect = require('chai').expect
models = require('../src/models.coffee')
Face = models.face
Cube = models.cube
solver = require('../src/solver.coffee')

describe 'Cube solver', ->
    problem = new Cube(new Face('b','b','y','b','b','y','b','b','y'),
        new Face('o','o','o','o','o','o','o','o','o'),
        new Face('b','b','b','w','w','w','w','w','w'),
        new Face('r','r','r','r','r','r','r','r','r'),
        new Face('y','y','g','y','y','g','y','y','g'),
        new Face('g','g','w','g','g','w','g','g','w'))
    it.skip 'can solve a single-move problem', ->
        solution = solver.solve(problem)
        expect(solution).to.equal('o')

    face = (c) ->
        new Face(c,c,c,c,c,c,c,c,c)
    cube = (c1,c2,c3,c4,c5,c6) ->
        new Cube(face(c1),
            face(c2),
            face(c3),
            face(c4),
            face(c5),
            face(c6))

    describe 'haveNotSeen', () ->
        theSolver = new solver.Solver [
            cube('a','b','c','d','e','f'),
            cube('d','e','f','g','h','i')
        ]
        it 'identifies when a cube has already been seen', () ->
            expect(theSolver.haveNotSeen(cube('d','e','f','g','h','i'))).to.be.false
        it 'identifies when a cube has not already been seen', () ->
            expect(theSolver.haveNotSeen(cube('a','a','a','a','a','a'))).to.be.true

    describe 'generate next generation', () ->
        it 'generates the first generation', ->
            theSolver = new solver.Solver [problem]
            next = theSolver.nextGeneration {"": problem}
            expect(next).to.be.an.instanceof(Array)
            #expect(next)