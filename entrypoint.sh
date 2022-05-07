workflow "Build and Deploy Pages" {
  on = "push"
  resolves = ["Lint", "Build", "Test", "Deploy Pages"]
}

action "Lint" {
  uses = "YHWHcoin/actions/node-app@master"
  env = {
    PKG_MANAGER = "yarn"
  }
  args = "run lint"
}

action "Build" {
  uses = "YHWHcoin/actions/node-app@master"
  env = {
    PKG_MANAGER = "yarn"
  }
  args = "run build"
}

action "Test" {
  uses = "YHWHcoin/actions/node-app@master"
  env = {
    PKG_MANAGER = "yarn"
  }
  args = "test"
}

action "Deploy Pages" {
  uses = "YHWHcoin/actions/node-app@master"
  secrets = ["GITHUB_TOKEN"]
  args = "gh-pages"
  needs = ["Lint", "Build", "Test"]
}
