require 'spec_helper'

describe 'deployment.properties.erb' do

  harness = TemplateHarness.new('spec/fixtures/modules/oracle-fusion-middleware/templates/deployment.properties.erb')

  it 'should generate valid content' do
    harness.set '@config', {
      'datasources' => {
        'datasource1' => {
          'name' => 'datasource1',
          'host' => 'HOST1',
          'pwd'  => 'PWD1',
          'sid'  => 'SID1',
          'user' => 'USER1',
        },
        'datasource2' => {
          'host' => 'HOST2',
          'name' => 'datasource2',
          'pwd'  => 'PWD2',
          'sid'  => 'SID2',
          'user' => 'USER2',
        },
      }
    }

    result = harness.run
    expect(result).to match(/^ds\.datasource1\.host = HOST1$/)
    expect(result).to match(/^ds\.datasource1\.pwd = PWD1$/)
    expect(result).to match(/^ds\.datasource1\.sid = SID1$/)
    expect(result).to match(/^ds\.datasource1\.user = USER1$/)
    expect(result).to match(/^ds\.datasource2\.host = HOST2$/)
    expect(result).to match(/^ds\.datasource2\.pwd = PWD2$/)
    expect(result).to match(/^ds\.datasource2\.sid = SID2$/)
    expect(result).to match(/^ds\.datasource2\.user = USER2$/)
#    expect(result).to match(/fail/)
  end

end

