# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ApplicationHelper do
	describe "full title" do 

		it "should return only base title" do
			full_title("").should == "Ruby on Rails Tutorial Sample App"
		end

		it "should not return a base title" do
			full_title(" ").should_not =~ /\|/
		end

		it "should include page title" do
			full_title("foo").should =~ /foo/
		end

		it "should include base title" do
			full_title("foo").should =~ /^Ruby on Rails Tutorial Sample App/
		end		
	end
end
