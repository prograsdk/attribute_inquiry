# rubocop:disable Metrics/BlockLength
RSpec.describe AttributeInquiry do
  it 'has a version number' do
    expect(AttributeInquiry::VERSION).not_to be nil
  end

  it 'overrides attribute with attr_reader' do
    test_cls = Class.new do
      include AttributeInquiry
      attr_reader :branch
      has_attribute_inquiry :branch

      def initialize(val)
        @branch = val
      end
    end
    instance = test_cls.new('mainline')

    expect(instance.branch.mainline?).to eq(true)
    expect(instance.branch.other_branch?).to eq(false)
  end

  it 'overrides attribute with getter and writer methods' do
    test_cls = Class.new do
      include AttributeInquiry
      attr_reader :branch
      attr_writer :branch

      has_attribute_inquiry :branch

      def initialize(val)
        @branch = val
      end
    end

    instance = test_cls.new('mainline')
    expect(instance.branch.mainline?).to eq(true)
    expect(instance.branch.other_branch?).to eq(false)

    instance.branch = 'other_branch'
    expect(instance.branch.mainline?).to eq(false)
    expect(instance.branch.other_branch?).to eq(true)
  end
end
# rubocop:enable Metrics/BlockLength
