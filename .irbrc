# -*- coding: utf-8 -*-
require "rubygems"
require "irb/completion"
require "pp"

IRB.conf.update(
	:SAVE_HISTORY => 10000,
	:PROMPT_MODE => :SIMPLE
)
