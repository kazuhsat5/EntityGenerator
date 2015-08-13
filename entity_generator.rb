# Entity Class Generator

inputPath = ARGV[0]

if inputPath.nil?
    puts "No Argument"
    exit
end

if !(File.exist?(inputPath))
    puts "No Such File"
    exit
end


vars = []
open(inputPath).each do |var|
    vars.push(var.chomp)
end

if vars.empty?
    puts "No Variable"
    exit
end

output = []
output.push("<?php")
output.push("")
output.push("namespace Namespace;")
output.push("")
output.push("class Class")
output.push("{")

vars.each do |var|
    output.push(sprintf("\tprivate $_%s;", var));
end

def camelize(word)
    return word[0..0].capitalize + word[1..word.length]
end

vars.each do |var|
    output.push("")
    output.push(sprintf("\tpublic function set%s($%s)", camelize(var), var))
    output.push("\t{")
    output.push(sprintf("\t\t$this->_%s = $%s;", var, var ))
    output.push("\t}")
end

vars.each do |var|
    output.push("")
    output.push(sprintf("\tpublic function get%s($%s)", camelize(var), var))
    output.push("\t{")
    output.push(sprintf("\t\treturn $this->_%s;", var))
    output.push("\t}")
end

output.push('}')

File.open(inputPath + ".php", "w") do |file|
    output.each do |line|
        file.write(line + "\n")
    end
end
