################################################################
# Module to check if application is up
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Licensed Materials - Property of IBM
#
# ©Copyright IBM Corp. 2017.
#
################################################################

variable "module_script" {
  default = "files/checkHttp.sh"	
}
variable "script_variables" {
  default = ""
}
variable "prior_custom_commands" {
  default = "sleep 1"
}
variable "posterior_custom_commands" {
  default = "sleep 1"
}

resource "null_resource" "default"{

  # Execute the script locally
  provisioner "local-exec" {
    command = "${var.prior_custom_commands}; bash ${path.module}/${var.module_script} ${var.script_variables}; ${var.posterior_custom_commands}"
  }
  
}