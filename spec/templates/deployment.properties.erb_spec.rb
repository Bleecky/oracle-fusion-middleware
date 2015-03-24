require 'spec_helper'

describe 'deployment.properties.erb' do

  harness = TemplateHarness.new('spec/fixtures/modules/oracle-fusion-middleware/templates/deployment.properties.erb')

  it 'should generate valid content' do
    harness.set '@config', {
      'datasources' => {
        'datasource1' => {
          'host'        => 'host1.example.com',
          'jdbc_driver' => 'oracle',
          'pwd'         => 'PWD1',
          'sid'         => 'SID1',
          'user'        => 'USER1',
        },
        'datasource2' => {
          'host'        => 'host2.example.com',
          'jdbc_driver' => 'jdbc:postgresql',
          'pwd'         => 'PWD2',
          'database'    => 'SID2',
          'user'        => 'USER2',
        },
      }
    }

    result = harness.run
    expect(result).to match(/^ds\.datasource1\.host = host1.example.com$/)
    expect(result).to match(/^ds\.datasource1\.pwd = PWD1$/)
    expect(result).to match(/^ds\.datasource1\.sid = SID1$/)
    expect(result).to match(/^ds\.datasource1\.user = USER1$/)
    expect(result).to match(/^ds\.datasource2\.host = host2.example.com$/)
    expect(result).to match(/^ds\.datasource2\.pwd = PWD2$/)
    expect(result).to match(/^ds\.datasource2\.sid = SID2$/)
    expect(result).to match(/^ds\.datasource2\.user = USER2$/)
#    expect(result).to match(/fail/)
  end

end

