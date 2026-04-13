// simple test 
const assert = require('assert');

// test 1 
assert.ok(process.version, 'Node.js is running');
console.log('Test 1 passed: Node.js version' , process.version);

// test 2
const express = require('express');
assert.ok(express, 'Express is installed');
console.log('Test 2 passed: Express is installed');

console.log('All test passed!');

