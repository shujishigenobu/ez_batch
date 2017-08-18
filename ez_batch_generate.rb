#! /usr/bin/env ruby

templatef = ARGV[0]
definition_file = ARGV[1]


def show_help
  puts "Usage:"
  puts "  ez_batch_generate.rb TEMPLATE_FILE [CONF_FILE] "
  puts ""
  puts "     TEMPLATE_FILE: "
  puts "     CONF_FILE: tab-delimited file defining keyword in TEMPLATE_FILE"
  puts "                Unless specified, TEMPLATE_FILE.conf is set"
end

unless templatef
  show_help
  raise
end

unless definition_file
  definition_file = templatef + ".conf"
  STDERR.puts "definition file: #{definition_file}"
end

template = File.open(templatef).read

n = 0
keywords = []
File.open(definition_file).each_with_index do |l, i|
  if i == 0 
    keywords = l.chomp.delete("#").split
    next
  end

  next if /^\#/.match(l)
  
  h = Hash.new
  script = template.dup

  a = l.chomp.split
  keywords.zip(a) do |k, v|
    h[k] = v
  end


  h.keys.each do |k|
    p [k, h[k]]
    script.gsub!(/%#{k}%/, h[k])
  end

  outf = File.basename(templatef, ".template.sh") + ".job#{n+=1}.sh"

  File.open(outf, "w") do |o|
    o.puts script
  end


end





