'use strict'

window.Offers =
  getDistricts: (regionId) ->
    $('#offer_district_id').empty().data('placeholder', 'loading...').select2
      theme: 'bootstrap'
      data: [ 'loading...' ]
    $.ajax
      type: 'GET'
      url: '/districts'
      data: 'region_id=' + regionId

  getLocalities: (districtId) ->
    $('#offer_locality_id').empty().data('placeholder', 'loading...').select2
      theme: 'bootstrap'
      data: [ 'loading...' ]
    $.ajax
      type: 'GET'
      url: '/localities'
      data: 'district_id=' + districtId

  getMetroStations: (districtId, localityCategory) ->
    if districtId in ["7", "10", "11"] && localityCategory == 'district'
      $(".metro_station_details").fadeIn('slow')
      $.ajax
        type: 'GET'
        url: '/metro_stations'
        data: 'district_id=' + districtId + '&locality_category=' + localityCategory
    else
      $(".metro_station_details").hide()

  adjustByOfferType: () ->
    $(".switched.by_offer").each (i, obj) ->
      if ($(obj).data('offer') == $("#offer_offer_type").val()) then $(obj).fadeIn('slow') else $(obj).hide()

  adjustByRealtyType: () ->
    $(".switched.by_realty").each (i, obj) ->
      if ($(obj).data('realty').indexOf($("#offer_category").val()) > 0) then $(obj).fadeIn('slow') else $(obj).hide()

  adjustByLocalityCategory: () ->
    $(".switched.by_locality").each (i, obj) ->
      if ($(obj).data('category').indexOf($("#offer_locality_id").find(":selected").data('category')) > 0) then $(obj).fadeIn('slow') else $(obj).hide()

  setupEditFormListener: () ->
    that = @
    $("#offer_offer_type").change -> that.adjustByOfferType()
    @adjustByOfferType()
    $("#offer_category").change -> that.adjustByRealtyType()
    @adjustByRealtyType()
    $("#offer_locality_id").change -> that.adjustByLocalityCategory()
    @adjustByLocalityCategory()

    if $("#offer_district_id").find(":selected").val() in ["7", "10", "11"] && $("#offer_locality_id").find(":selected").data('category') == 'district'
      $(".metro_station_details").fadeIn('slow')
      console.log('TEST')

    $(".edit_offer").submit ->
      $(".switched").find(":hidden").each (i, obj) ->
        $(obj).remove()
      true

    $(".new_offer").submit ->
      $(".switched").find(":hidden").each (i, obj) ->
        $(obj).remove()
      true

    true

ready = ->
  $('select').select2
    theme: 'bootstrap'
    minimumResultsForSearch: 8

  $('#offer_region_id').change ->
    Offers.getDistricts @value

  $('#offer_district_id').change ->
    Offers.getLocalities @value

  $('#offer_locality_id').change ->
    Offers.getMetroStations $('#offer_district_id').val(), $('#offer_locality_id').find(":selected").data('category')

$(document).ready(ready)
$(document).on('page:load', ready)
