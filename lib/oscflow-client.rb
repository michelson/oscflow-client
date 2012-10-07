require "oscflow-client/version"
require 'rubygems'
require 'pathname'
require 'fileutils'
module Oscflow
  module Client
    ROOT_PATH = Pathname(__FILE__).dirname.expand_path
    autoload  :CLI,           'oscflow-client/cli.rb'
    autoload  :Midi,          'oscflow-client/midi.rb'
  end
end
