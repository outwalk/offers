# encoding: utf-8

shared_context 'Initial Data' do
  let!(:kyiv_oblast) { create(:region, slug: 'kyivska', name_uk: 'Київська обл.', name_ru: 'Киевская обл.', name_en: 'Kyiv (Kiev) Oblast', latitude: 50.0529506, longitude: 30.7667133, mk_region_id: 1) }
  let!(:sumy_oblast) { create(:region, slug: 'sumska', name_uk: 'Сумська обл.', name_ru: 'Сумская обл.', name_en: 'Sumy Oblast', latitude: 50.9387506, longitude: 33.8654522, mk_region_id: 18) }
  let!(:dnipropetrovska_oblast) { create(:region, slug: 'dnipropetrovska', name_uk: 'Дніпропетровська обл.', name_ru: 'Днепропетровская обл.', name_en: 'Dnipropetrovsk Oblast') }

  let!(:kyiv) { create(:district, region: kyiv_oblast, district_name_uk: 'Київ', name_uk: 'Київ', district_name_ru: 'Киев', name_ru: 'Киев', phone_code: '44', region_status: true, latitude: 50.45000000, longitude: 30.52333330, mk_district_id: 14) }
  let!(:bila_tserkva) { create(:district, region: kyiv_oblast, district_name_uk: 'Білоцерківський район', name_uk: 'Біла Церква', district_name_ru: 'Белоцерковский район', name_ru: 'Белая Церковь', phone_code: '4563', latitude: 49.66705520, longitude: 30.07453150, mk_district_id: 2) }
  let!(:sumy_raion) { create(:district, region: sumy_oblast, district_name_uk: 'Сумський', name_uk: 'Суми', district_name_ru: 'Сумский район', name_ru: 'Сумы', phone_code: '542', latitude: 51.09270230, longitude: 34.68068120, mk_district_id: 410) }
  let!(:pershotravensk_district) { create(:district, region: dnipropetrovska_oblast, slug: 'pershotravensk', district_name_uk: 'Першотравенськ', name_uk: 'Першотравенськ', district_name_ru: 'Першотравенск', name_ru: 'Першотравенск', district_name_en: 'Pershotravensk Raion', name_en: 'Pershotravensk', phone_code: '5633', region_status: false, offers_count: 0, mk_district_id: 72, has_metro: false) }

  let!(:vyshneve) { create(:locality, region: kyiv_oblast, district: kyiv, category: 'suburb', name_uk: 'Вишневе', name_ru: 'Вишневое', phone_code: '4598') }
  let!(:moshchun) { create(:locality, region: kyiv_oblast, district: kyiv, category: 'village', name_uk: 'Мощун', name_ru: 'Мощун') }
  let!(:dniprovskyi) { create(:sub_locality, region: kyiv_oblast, district: kyiv, category: 'district', name_uk: 'Дніпровський', name_ru: 'Днепровский', latitude: 50.45358730, longitude: 30.60152100, mk_settle_id: 372) }
  let!(:holosiivskyi) { create(:sub_locality, region: kyiv_oblast, district: kyiv, category: 'district', name_uk: 'Голосіївський', name_ru: 'Голосеевский', latitude: 50.32689050, longitude: 30.56721930, mk_settle_id: 369) }
  let!(:sviatoshynskyi) { create(:sub_locality, region: kyiv_oblast, district: kyiv, category: 'district', name_uk: 'Святошинський', name_ru: 'Святошинский', latitude: 50.46194040, longitude: 30.33595560, mk_settle_id: 377) }
  let!(:darnytskyi) { create(:sub_locality, region: kyiv_oblast, district: kyiv, category: 'district', name_uk: 'Дарницький', name_ru: 'Дарницкий', latitude: 50.41539640, longitude: 30.69359920, mk_settle_id: 370) }
  let!(:desnianskyi) { create(:sub_locality, region: kyiv_oblast, district: kyiv, category: 'district', name_uk: 'Деснянський', name_ru: 'Деснянский', latitude: 50.52116100, longitude: 30.68307310, mk_settle_id: 371) }
  let!(:zhuliany) { create(:sub_locality, region: kyiv_oblast, district: kyiv, category: 'district', name_uk: 'Жуляни', name_ru: 'Жуляны', latitude: 50.401944, longitude: 30.451111, mk_settle_id: 373) }
  let!(:sumy) { create(:locality, region: sumy_oblast, district: sumy_raion, category: 'city', name_uk: 'Суми', name_ru: 'Сумы', phone_code: '542', latitude: 50.89440560, longitude: 34.81059920, mk_settle_id: 11100) }
  let!(:pershotravensk) { create(:locality, region: dnipropetrovska_oblast, district: pershotravensk_district, slug: 'pershotravensk', category: 'city', name_uk: 'Першотравенськ', name_ru: 'Першотравенск', name_en: 'Pershotravensk', phone_code: '5633', non_admin: false, mk_settle_id: 1696) }
  let!(:vyshenky) { create(:locality, region: kyiv_oblast, district: kyiv, category: 'suburb', name_uk: 'Вишеньки', name_ru: 'Вишенки') }

  let!(:osokorky) { create(:metro_station, district: kyiv, name_ru: 'Осокорки', name_uk: 'Осокорки', name_en: 'Osokorky', color: 'green', sequence: 322) }
end
