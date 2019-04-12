workflow "Elm" {
  on = "push"
  resolves = ["dasch/elm"]
}

action "dasch/elm" {
  uses = "dasch/elm"
  args = "diff"
}
