locals {
  default_topics = [
    "xebicon19",
    "xebikart"
  ]
}

variable "repo_visibility_private" {
  type = string
  description = "Repository visibility. Is is private?"
  default = true
}

variable "repo_name" {
  type = string
  description = "Repository name. Will be prefixed by `xebikart-`"
}

variable "repo_description" {
  type = string
  description = "Repository description. Will be prefixed by `XebiKart - `"
}

variable "repo_site_url" {
  type = string
  description = "Link related to this repository"
}

variable "additional_topics" {
  type = list(string)
  default = []
}

variable "allow_merge_commit" {
  type = bool
  default = true
}

variable "archived" {
  type = bool
  default = false
}
