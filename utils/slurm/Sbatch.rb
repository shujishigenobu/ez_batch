#!/bin/env ruby

require 'rake'

# Sbatch script

def show_help
  puts "Usage:"
  puts "   Sbatch SCRIPT"
end

if ARGV.size == 1
  script = ARGV[0]
else
  puts "Error!"
  show_help
  raise "No batch script given"
end

cmd = "sbatch -o #{script}.o%j -e #{script}.e%j #{script}"
sh cmd

