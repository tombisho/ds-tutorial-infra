if (!require(opalr)) {
  install.packages("opalr", repos = "https://cloud.r-project.org", dependencies = TRUE)
}
library(opalr)
o <- opal.login(username = "administrator", password = "password", url = "https://opal-demo.obiba.org")
oadmin.install_devtools(o)
opal.execute(o, script = 'devtools::install_version("rgdal", version = "1.5-12", repos = "https://cloud.r-project.org")')
opal.execute(o, script = 'devtools::install_github("tombisho/dsGeo", upgrade = "never")')
dsadmin.set_package_methods(o, "dsGeo")
opal.logout(o)
