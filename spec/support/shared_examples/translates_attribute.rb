shared_examples 'translates attribute' do |name|
  describe "##{name}" do
    it "is returns attribute #{name}_uk by default" do
      expect(subject.public_send(name)).to eq subject.read_attribute(:"#{name}_uk")
    end

    it "is returns attribute #{name}_ru if I18n.locale equals 'ru'" do
      I18n.with_locale(:ru) do
        expect(subject.public_send(name)).to eq subject.read_attribute(:"#{name}_ru")
      end
    end

    it "is returns attribute #{name}_en if I18n.locale equals 'en'" do
      I18n.with_locale(:en) do
        expect(subject.public_send(name)).to eq subject.read_attribute(:"#{name}_en")
      end
    end
  end
end
