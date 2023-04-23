#!/bin/env ruby

require 'rake'

# Sbatch script

script = ARGV[0]

cmd = "sbatch -o #{script}.o%j -e #{script}.e%j #{script}"
sh cmd

