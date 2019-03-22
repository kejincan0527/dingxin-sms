RSpec.describe Dingxin::Sms do

  describe "#top test" do
    before do
      Dingxin::Sms.configure do |config|
        config.app_code = 'test_appcode'
      end
    end

    it "get the http query url" do
      params = {
        'mobile' => '15912345678',
        'tpl_id' => 'TP18031516',
        'param' => 'asin:B01E7LLKT2'
      }
      spect_output = 'http://dingxin.market.alicloudapi.com/dx/sendSms?mobile=15912345678&param=asin%3AB01E7LLKT2&tpl_id=TP18031516'
      expect(Dingxin::Sms.get_url(params)).to eql(spect_output)
    end
  end

  it "get the canonicalized query string" do
    method_input = {
      'mobile' =>	'15300000001',
      'tpl_id' => 'TP18031516',
      'param' => 'asin:B01E7LLKT2'
    }

    spect_output = 'mobile=15300000001&param=asin%3AB01E7LLKT2&tpl_id=TP18031516'

    expect(Dingxin::Sms.canonicalized_query_string(method_input)).to eql(spect_output)
  end

end
