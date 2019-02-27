workflow "Format Elm Code" {
  on = "pull_request"
  resolves = ["Format"]
}

action "Format" {
  uses = "./elm-actions"
  args = "elm-format --validate src/"
}
