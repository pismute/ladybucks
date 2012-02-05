fs     = require 'fs'
{exec} = require 'child_process'

task 'build', 'Build single application file from source files', ->
    exec 'chrome --pack-extension=src --pack-extension-key=ladybucks.pem', (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr
