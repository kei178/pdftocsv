# frozen_string_literal: true

# = pdftocsv.rb -- Parsing PDF files to the CSV format
#
# Created by Keisuke Inaba on 2021-01-20.

require "pdf-reader"

require_relative "pdftocsv/version"

# Parsing PDF files to the CSV format
module Pdftocsv
  class Error < StandardError; end

  def self.parse(file_path)
    @pages = []
    File.open(file_path, "rb") do |io|
      reader = PDF::Reader.new(io)
      reader.pages.each { |page| @pages << to_page_csv(page) }
    end
    @pages
  end

  class << self
    def to_page_csv(page)
      page_csv = []
      # Separating a whole text
      text_lines = page.text.split("\n")
      text_lines.each do |text_line|
        text_list = to_text_list(text_line)
        page_csv << text_list if text_list.any?
      end
      page_csv
    end

    def to_text_list(text_line)
      text_list = text_line.split("\s\s")
      text_list.delete_if { |text| text.nil? || text.empty? }
      text_list.each(&:strip!)
    end
  end
end
