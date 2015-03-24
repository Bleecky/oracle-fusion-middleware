require 'spec_helper'

describe 'wls-silent.xml.erb' do

  harness = TemplateHarness.new('spec/fixtures/modules/oracle-fusion-middleware/templates/wls-silent.xml.erb')

  it 'should generate valid content' do
    harness.set '@middleware_home', '/home/oracle/Middleware'
    harness.set '@weblogic_version', '12.1.3'

    result = harness.run
    expect(result).to match(/^\s*#{Regexp.escape(%Q[<data-value name="BEAHOME" value="/home/oracle/Middleware" />])}/)
    expect(result).to match(/^\s*#{Regexp.escape(%Q[<data-value name="WLS_INSTALL_DIR" value="/home/oracle/Middleware/wlserver_12.1" />])}/)
#    expect(result).to match(/fail/)
  end

end

