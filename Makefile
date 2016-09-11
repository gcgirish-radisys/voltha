#
# Copyright 2016 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

VENVDIR := venv

.PHONY: venv

default: build

help:
	@echo "Usage: make [<target>]"
	@echo "where available targets are:"
	@echo
	@echo "build        : Build the Voltha docker image (default target)"
	@echo "fetch        : Pre-fetch artifacts for subsequent local builds"
	@echo "help         : Print this help"
	@echo "venv         : Rebuild local Python virtualenv from scratch"
	@echo

venv:
	rm -fr ${VENVDIR}
	@virtualenv ${VENVDIR}
	@. ${VENVDIR}/bin/activate && \
	    if ! pip install -r requirements.txt; \
	    then \
	        echo "On MAC OS X, if the installation failed with an error \n'<openssl/opensslv.h>': file not found,"; \
	        echo "see the BUILD.md file for a workaround"; \
	    fi



