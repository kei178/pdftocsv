# frozen_string_literal: true

RSpec.describe Pdftocsv do
  it "has a version number" do
    expect(Pdftocsv::VERSION).not_to be nil
  end

  describe "self.parse" do
    it "converts pdf to csv" do
      pages = Pdftocsv.parse('./spec/fixtures/files/example.pdf')

      aggregate_failures do
        expect(pages).to be_a(Array)
        expect(pages.map { |page| page.is_a?(Array) }).to be_all
        expect(pages.map { |page| page.map { |rows| rows.is_a?(Array) }}).to be_all
        expect(pages.map { |page| page.map { |rows| rows.map { |text| text.is_a?(String) }}}).to be_all
      end
    end
  end
end
