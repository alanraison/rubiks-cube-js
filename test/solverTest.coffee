"use strict"
expect = require('chai').expect
models = require('../src/models.coffee')
Face = models.face
Cube = models.cube
solver = require('../src/solver.coffee')

describe 'Cube solver', ->
    problem = new Cube(new Face('b','b','y','b','b','y','b','b','y'),
        new Face('o','o','o','o','o','o','o','o','o'),
        new Face('b','w','w','b','w','w','b','w','w'),
        new Face('r','r','r','r','r','r','r','r','r'),
        new Face('y','y','g','y','y','g','y','y','g'),
        new Face('g','g','w','g','g','w','g','g','w'))
    it 'can solve a single-move problem', ->
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

    describe 'haveSeen', ->
        known = [
            cube('a','b','c','d','e','f'),
            cube('d','e','f','g','h','i')
        ]
        it 'identifies when a cube has already been seen', ->
            expect(solver.haveSeen(cube('d','e','f','g','h','i'), known)).to.be.true
        it 'identifies when a cube has not already been seen', ->
            expect(solver.haveSeen(cube('a','a','a','a','a','a'), known)).to.be.false

    describe 'generate next generation', () ->
        it 'generates the first generation', ->
            next = solver.nextGeneration {"": problem}, [problem]

            expect(next).to.be.an.instanceof(Object)
            expect(Object.keys(next).length).to.equal(12)
            expect(next['b']).to.be.a.cubeLike(new Cube(
                new Face('y','y','y','b','b','b','b','b','b'),
                new Face('y','y','g','o','o','o','o','o','o'),
                new Face('o','o','o','b','w','w','b','w','w'),
                new Face('b','w','w','r','r','r','r','r','r'),
                new Face('r','r','r','y','y','g','y','y','g'),
                new Face('g','g','w','g','g','w','g','g','w'))
            )
            expect(next['o']).to.be.a.cubeLike(cube('b','o','w','r','y','g'))