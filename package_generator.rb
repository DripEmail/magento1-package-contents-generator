# frozen_string_literal: true

require 'pathname'
require 'digest'

lines = ARGF.read.split

MAGECOMMUNITY_PREFIX = "app/code/community/"
MAGEETC_PREFIX = "app/etc/"
MAGEDESIGN_PREFIX = "app/design/"

magecommunity = []
mageetc = []
magedesign = []

lines.each do |line|
  if line.start_with?(MAGECOMMUNITY_PREFIX)
    magecommunity << line[MAGECOMMUNITY_PREFIX.size..-1]
  elsif line.start_with?(MAGEETC_PREFIX)
    mageetc << line[MAGEETC_PREFIX.size..-1]
  elsif line.start_with?(MAGEDESIGN_PREFIX)
    magedesign << line[MAGEDESIGN_PREFIX.size..-1]
  end
end

def structure_creator(prefix, lines)
  structure = {}
  prefix_path = Pathname.new(prefix)
  lines.each do |line|
    line = line.strip.chomp("/")
    next if line.nil? || line == ""
    path = Pathname.new(line)
    structure_pointer = structure
    path.descend.each do |segment|
      segment_path = prefix_path.join(segment)
      if segment_path.directory?
        structure_pointer[segment.basename] ||= {}
        structure_pointer = structure_pointer[segment.basename]
      elsif segment_path.file?
        structure_pointer[segment.basename] = Digest::MD5.file(segment_path).to_s
      end
    end
  end

  structure
end

magecommunity_structure = structure_creator(MAGECOMMUNITY_PREFIX, magecommunity)
mageetc_structure = structure_creator(MAGEETC_PREFIX, mageetc)
magedesign_structure = structure_creator(MAGEDESIGN_PREFIX, magedesign)

def xml_generator(structure)
  structure.each do |name, substructure|
    case substructure
    when String
      puts "<file name=\"#{name}\" hash=\"#{substructure}\"/>"
    else
      puts "<dir name=\"#{name}\">"
      xml_generator(substructure)
      puts '</dir>'
    end
  end
end

puts '<target name="magecommunity">'
xml_generator(magecommunity_structure)
puts '</target>'

puts '<target name="mageetc">'
xml_generator(mageetc_structure)
puts '</target>'

puts '<target name="magedesign">'
xml_generator(magedesign_structure)
puts '</target>'
