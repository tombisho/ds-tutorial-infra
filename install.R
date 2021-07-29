if (!require(opalr)) {
  install.packages("opalr", repos = "https://cloud.r-project.org", dependencies = TRUE)
}
library(opalr)
o <- opal.login(username = "administrator", password = "datashieldtest", url = "http://localhost:9980")
oadmin.install_devtools(o)
dsadmin.install_github_package(o, pkg = "dsSynthetic", username = "tombisho", ref = "snapshot", profile = "default")
dsadmin.install_github_package(o, pkg = "dsSurvival", username = "neelsoumya", ref = "v1.0.0", profile = "default")

opal.logout(o)
