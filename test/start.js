'use strict';

const helloWorld = require('./build/bundle.js').helloWorld
global.assert = require('assert');

console.log(helloWorld)

describe('boiler plate is wired up', function(){
    it('exports a string', function(){
        assert.equal(helloWorld, 'hello world')
    })
})
