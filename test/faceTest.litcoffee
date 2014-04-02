This is an example of using the assert chai interface

    assert = require('chai').assert
    Face = require('../src/face.coffee')

    describe 'Face', () ->
        it 'should identify when a face has been solved', () ->
            solvedFace = new Face('a','a','a','a','a','a','a','a','a')
            assert.isTrue(solvedFace.isSolved(), 'face was solved')

        it 'should identify when a face is not solved', () ->
            unsolvedFace = new Face('a','b','a','a','a','a','a','a','a')
            assert.isFalse(unsolvedFace.isSolved(), 'face was not solved')

        first = new Face('a','a','a','a','a','a','a','a','a')

        it 'should identify when two faces are equal', () ->
            second = new Face('a','a','a','a','a','a','a','a','a')
            assert.isTrue(first.isEqualTo(second), 'equal faces')

        it 'should identify when two faces are not equal', () ->
            second = new Face('a','a','a','b','a','a','a','a','a')
            assert.isFalse(first.isEqualTo(second), 'unequal faces')