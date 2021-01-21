# frozen_string_literal: true

# = pdftocsv.rb -- Parsing PDF files to CSV-like data
#
# Created by Keisuke Inaba on 2021-01-20.

require "pdf-reader"

require_relative "pdftocsv/version"

# Parsing PDF files to CSV-like data
module Pdftocsv
  class Error < StandardError; end
  # Parsing PDF files to CSV-like data
  #
  # Example:
  #   >> Pdftocsv.parse("example.pdf")
  #   => [[['a1', 'b1', 'c1'], ['a2', 'b2', 'c2']], [['A1', 'B1', 'C1'], ['A2', 'B2', 'C2']]]
  #
  # Arguments:
  #   file_path: (String)

  def self.parse(file_path)
    @pages = []
    File.open(file_path, "rb") do |io|
      reader = PDF::Reader.new(io)
      reader.pages.each { |page| @pages << to_page_csv(page) }
    end
    @pages
  end

  class << self
    # Separating a whole page text by line
    #
    # Arguments:
    #   page: (String)
    def to_page_csv(page)
      page_csv = []
      text_lines = page.text.split("\n")
      text_lines.each do |text_line|
        text_list = to_text_list(text_line)
        page_csv << text_list if text_list.any?
      end
      page_csv
    end

    # Separating a line by unit
    #
    # Arguments:
    #   text_line: (String)
    def to_text_list(text_line)
      text_list = text_line.split("\s\s")
      text_list.delete_if { |text| text.nil? || text.empty? }
      text_list.each(&:strip!)
    end
  end
end
