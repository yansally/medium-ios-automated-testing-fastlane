# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? "#trivial"

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR, consider splitting into smaller chunks.") if git.lines_of_code > 500

# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -r --include \*.swift fdescribe Core/ `.length > 1
fail("fit left in tests") if `grep -r --include \*.swift fit Notes/`.length > 1
fail("fcontext left in tests") if `grep -r --include \*.swift fcontext Notes/ `.length > 1

# Check if tests were updated
has_app_changes = !git.modified_files.grep(/Notes/).empty?
#is_version_bump = git.modified_files.sort == ["CHANGELOG.md"].sort
if has_app_changes 
  warn("Remember to update tests", sticky: false)
end

# Mainly to encourage writing up some reasoning about the PR, rather than just leaving a title
if github.pr_body.length < 5
  fail "Please provide a summary in the Pull Request description"
end

# Check added and changed files
def filterFiles(files)
  return files.select { |f| f.end_with? ".h", ".m", ".swift", ".mm" }
end

added_paths = filterFiles(git.added_files)
touched_paths = filterFiles(git.added_files | git.modified_files)
touched_paths.each do |p|
  next unless File.exist?(p)
  content = File.read(p)

  lines = content.split("\n")
  lines.each_with_index do |line, index|
    # warn if there are any TODOs, NSLogs or prints left in the touched files
    warn("`TODO` comment left", file: p, line: index + 1) if line.downcase =~ /\/\/\s?todo/
    warn("`FIXME` comment left", file: p, line: index + 1) if line.downcase =~ /\/\/\s?fixme/
    warn("`NSLog` left", file: p, line: index + 1) if line.downcase =~ /\sNSLog\(@"/
    warn("`print` left", file: p, line: index + 1) if line.downcase =~ /\sprint\("/
  end
end

# Swiftlint for Notes
swiftlint.verbose = true
swiftlint.binary_path = "Pods/SwiftLint/swiftlint"
swiftlint.config_file = "/.swiftlint.yml"
swiftlint.lint_files inline_mode: false, fail_on_error: true

# Xcode summary (gets errors and warnings) - Obs.: links don't work.
#xcode_summary.inline_mode = true
#xcode_summary.report './build/reports/errors.json'

# Variables
project = "Notes"
scheme = "Notes"

# Print TODOs
#todoist.warn_for_todos
#todoist.print_todos_table

# Slather
#slather.configure("Path/to/Notes.xcodeproj", "Notes")
#slather.show_coverage

# TODO: Check later - it stopped working
# Prints markdown containing a random post from thecodinglove.com.
# the_coding_love.random
