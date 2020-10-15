exec = (cmd) ->
  execSync = require('child_process').execSync
  result = 'unknown'
  try
    result = execSync(cmd, encoding: 'utf8').trim()
  catch err
    console.log 'Exec failed: ' + err.message
  result

readGitInfo = (path) ->
  result =
    branch: exec('cd '+path+'; git symbolic-ref --short HEAD')
    dirty: exec('cd '+path+'; git status -s')

  return result

module.exports = (path) ->
  # Indicates that this task will be async.
  # Call the `callback` to finish the task
  callback = @async()
  emit('result', readGitInfo(path))
  callback()
