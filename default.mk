# Copyright (C) 2017, 2018, 2019, 2020 Serghei Iakovlev
#
# This file is not part of GNU Emacs.
#
# License
#
# This file is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this file.  If not, see <https://www.gnu.org/licenses/>.

EMACS  ?= emacs
CASK   ?= cask

EMACSFLAGS ?=
TESTFLAGS  ?= --reporter ert+duration

EMACSBATCH = $(EMACS) -Q --batch -L . $(EMACSFLAGS)
RUNEMACS   =

# Program availability
HAVE_CASK := $(shell sh -c "command -v $(CASK)")
ifndef HAVE_CASK
$(warning "$(CASK) is not available.  Please run make help")
RUNEMACS = $(EMACSBATCH)
else
RUNEMACS = $(CASK) exec $(EMACSBATCH)
endif

VERSION = 0.4.0

PACKAGE = zephir-mode
ARCHIVE_NAME = $(PACKAGE)-$(VERSION)

# File lists
SRCS = zephir-mode.el
OBJS = $(SRCS:.el=.elc)
