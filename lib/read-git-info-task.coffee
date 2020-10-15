readGitInfo = (path) ->
  result = {}
  return result

module.exports = (path) ->
  # Indicates that this task will be async.
  # Call the `callback` to finish the task
  callback = @async()
  emit('result', readGitInfo(path))
  callback()
