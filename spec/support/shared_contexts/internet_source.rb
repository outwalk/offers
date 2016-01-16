# def save_page_as_fixture(uri)
#   fixtures_root = Rails.root.join('spec', 'fixtures/')
#   require 'open-uri'
#   require 'nokogiri'
#   path = uri.sub(/^https?:\/\//, '')
#   path << 'index.html' if path.end_with?('/')
#   path = fixtures_root.join(path).to_s
#   require 'fileutils'
#   dirname = File.dirname(path)
#   FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
#   File.open(path, 'w') { |file| file.write open(uri).read }
# end

shared_context 'Internet Source' do |source|
  subject { described_class }

  before do
    fixtures_root = Rails.root.join('spec', 'fixtures/')

    Dir[fixtures_root.join(source, '**', '*.{html,xml}')].each do |f|
      url = f.sub(fixtures_root.to_s, 'http://').sub('index.html', '')
      stub_request(:get, url).to_return(status: 200, body: open(f).read)
    end
  end
end
