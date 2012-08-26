path = require 'path'
fs   = require 'fs'



describe 'Production', ->
  data = null

  before ->
    file = fs.readFileSync path.resolve 'package.json'
    data = JSON.parse file

  it 'has Dependencies', ->
    data.should.have.property 'dependencies'
    data.should.have.property 'devDependencies'

  it 'has Engines', ->
    data.should.have.property 'engines'
    {engines} = data

    engines.should.have.property 'node'
    engines.should.have.property 'npm'
