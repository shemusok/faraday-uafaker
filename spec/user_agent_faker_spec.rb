require 'nokogiri'
require 'faraday-uafaker.rb'

describe FaradayMiddleware::UserAgentFaker do
  it "file with UA strings must exists" do
    expect(File::exists?(FaradayMiddleware::UserAgentFaker::UASS_FILE)).to eq true
  end

  it 'must choose one of known UA string' do
    uas = FaradayMiddleware::UserAgentFaker::uas
    expect(FaradayMiddleware::UserAgentFaker::UASS.include?("#{uas}\n")).to eq true
  end 

  it 'must choose each time new UA string' do
    uas1 = FaradayMiddleware::UserAgentFaker::uas
    uas2 = FaradayMiddleware::UserAgentFaker::uas
    expect(uas1).not_to eq uas2
  end

  describe 'must be valid faraday request middleware:' do
    conn = nil
    it 'must be properly registered' do
      expect do
        conn = Faraday.new 'http://www.useragentstring.com/' do |faraday|
          faraday.request :uafaker
          faraday.adapter :net_http
        end
      end.not_to raise_error
    end

    it 'must set \'User-Agent\' field of HTTP request to one of known UA string' do
      uas = Nokogiri::HTML(conn.get().body).css('#uas_textfeld').text
      expect(FaradayMiddleware::UserAgentFaker::UASS.include?("#{uas}\n")).to eq true
    end

    it 'must each time send random UA string' do
      uas1 = Nokogiri::HTML(conn.get().body).css('#uas_textfeld').text
      uas2 = Nokogiri::HTML(conn.get().body).css('#uas_textfeld').text
      expect(uas1).not_to eq uas2
    end
  end
end
