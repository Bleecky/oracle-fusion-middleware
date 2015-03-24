require 'spec_helper'

describe 'domain-configuration.py' do

  harness = TemplateHarness.new('spec/fixtures/modules/oracle-fusion-middleware/templates/domain-configuration.py.erb')

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

    ds1  = %Q[oscustom.configureDataSource(\n]
    ds1 += %Q[  'datasource1',\n]
    ds1 += %Q[  'oracle',\n]
    ds1 += %Q[  'jdbc/datasource1',\n]
    ds1 += %Q[  'USER1',\n]
    ds1 += %Q[  'PWD1',\n]
    ds1 += %Q[  'jdbc:oracle:thin:@//host1.example.com:1521/SID1')\n]
    ds1 = Regexp.escape(ds1)
    expect(result).to match(/#{ds1}/)

    ds2  = %Q[oscustom.configureDataSource(\n]
    ds2 += %Q[  'datasource2',\n]
    ds2 += %Q[  'jdbc:postgresql',\n]
    ds2 += %Q[  'jdbc/datasource2',\n]
    ds2 += %Q[  'USER2',\n]
    ds2 += %Q[  'PWD2',\n]
    ds2 += %Q[  'jdbc:postgresql://host2.example.com:5432/SID2')\n]
    ds2 = Regexp.escape(ds2)
    expect(result).to match(/#{ds2}/)
#    expect(result).to match(/fail/)
  end

end

