# encoding: utf-8

shared_context 'Offer' do
  let!(:dougal) { create(:user, name: 'Dougal McGuire', email: 'dougal.mcguire@example.com', phone_first: '+380965467272') }

  let!(:offer) { create(:offer, user: dougal, offer_type: 'sale', property_type: 'residential', category: 'flat',
    region: dnipropetrovska_oblast, district: pershotravensk_district, locality: pershotravensk, address: 'Чайковского ул.',
    rooms: 2, area: 43.0, living_space: 27.0, kitchen_space: 7.0, floor: 5, floors_total: 5,
    title_ru: 'Срочно продам 2-комнатную квартиру! Возможен торг! т.0508833997',
    description: 'капитальный ремонт, пластиковые балкон и окна, на всё установлены счетчики, двойная дверь входная. в подъезде бронированная дверь, хорошие соседи. Можно купить квартиру с мебелью и техникой!!!',
    price: 17000.0, price_currency: 'USD', price_dollars: 17000.0,
    from_owner: true, phone_first: '+380965467272', user_name: 'Dougal') }
end
