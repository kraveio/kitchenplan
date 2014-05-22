# Copyright 2014 Disney Enterprises, Inc. All rights reserved
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are
#  met:
#
#   * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
#
#   * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in
#   the documentation and/or other materials provided with the
#   distribution.

require 'spec_helper'
require 'ohai'
require 'kitchenplan'

describe Ohai::System do
	let(:ohai) { Ohai::System.new }

	%w{ os platform }.each do |n|
		it "should load the required #{n} ohai plugin" do
			expect(ohai.require_plugin(n)).to eq(true)
			expect(ohai.seen_plugins).to include(n => true)
			expect(ohai.data).to include(n)
		end
	end
end
