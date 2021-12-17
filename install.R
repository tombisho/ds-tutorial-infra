if (!require(opalr)) {
  install.packages("opalr", repos = "https://cloud.r-project.org", dependencies = TRUE)
}
library(opalr)
options(opal.opts = list(
           ssl_verifyhost = 0,
           ssl_verifypeer = 0))
o <- opal.login(username = "administrator", password = "datashieldtest", url = "https://localhost:9943")
oadmin.install_devtools(o)
dsadmin.install_github_package(o, pkg = "dsSynthetic", username = "tombisho", ref = "main", profile = "default")
#dsadmin.install_github_package(o, pkg = "dsSurvival", username = "neelsoumya", ref = "v1.0.0", profile = "default")
dsadmin.install_github_package(o, pkg = "dsSurvival", username = "neelsoumya", ref = "main", profile = "default")

opal.logout(o)
