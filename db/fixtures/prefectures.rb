require 'csv'
require 'pp'

csv = CSV.read('/home/phyten/prefecture_test/db/fixtures/zenkoku_converted.csv')

# データの標準化
data = csv.map do |e|
  {
    postal: e[4],
    abolition: e[6].to_i,
    prefecture: e[7],
    prefecture_kana: e[8],
    city: e[9],
    city_kana: e[10],
    town: e[11],
    town_kana: e[12],
    other_address: e[13].to_s + e[15].to_s,
    other_address_kana: e[14].to_s + e[16].to_s,
  }
end

data.delete_at(0)

prefectures = data.map{|e| e[:prefecture]}.uniq.map.with_index(1) do |e, i|
  {
    id: i,
    name: e,
  }
end

binding.pry
