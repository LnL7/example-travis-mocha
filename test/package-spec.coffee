path = require 'path'
fs   = require 'fs'



Feature 'Production', ->
  Scenario 'is valid', ->
    [file, data] = [null, null]

    Given 'read File', ->
      file = fs.readFileSync path.resolve 'package.json'

    When 'parse JSON', ->
      data = JSON.parse file

    Then 'has Dependencies', ->
      data.should.have.property 'dependencies'
      data.should.have.property 'devDependencies'

    Then 'has Engines', ->
      data.should.have.property 'engines'
      {engines} = data

      engines.should.have.property 'node'
      engines.should.have.property 'npm'
