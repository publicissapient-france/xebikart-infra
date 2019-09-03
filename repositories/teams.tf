resource "github_team" "xebikart-main-team" {
  name        = "XebiKart"
  description = "XebiKart - Keynote XebiCon'19"

  privacy = "closed"
}

resource "github_team" "xebikart-dashboard-team" {
  name        = "XebiKart - Dashboard"
  description = "XebiKart - Team Dashboard"
  parent_team_id = "${github_team.xebikart-main-team.id}"

  privacy = "closed"
}

resource "github_team" "xebikart-ml-team" {
  name        = "XebiKart - ML"
  description = "XebiKart - Team Machine Learning"
  parent_team_id = "${github_team.xebikart-main-team.id}"

  privacy = "closed"
}
