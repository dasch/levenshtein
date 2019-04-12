workflow "Elm" {
  on = "push"
  resolves = ["dasch/elm:master"]
}

action "dasch/elm:master" {
  uses = "dasch/elm@master"
  args = "diff"
}
