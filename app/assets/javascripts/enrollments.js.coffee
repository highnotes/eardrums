jQuery ->
  $('.datepicker').fdatepicker()
  
  if($("#enrollment_discipline_id option[selected]").length > 0)
    showCourses()
  
  $('#enrollment_discipline_id').change ->
    showCourses()
    
  $('#enrollment_course_id').change ->
    fetchCourseDetails()
    
  $("a.submit").click ->
    $(this).closest('form').submit()
    
showCourses = ->
  courses= $('#enrollment_course_id').html()
  batches= $('#enrollment_batch_id').html()
  
  $('#discipline_config_error').hide()
  discipline = $('#enrollment_discipline_id :selected').text()
  course_options = $(courses).filter("optgroup[label=#{discipline}]").html()
  batch_options = $(batches).filter("optgroup[label=#{discipline}]").html()
  if course_options and batch_options
    $('#enrollment_course_id').html(course_options)
    $('#enrollment_batch_id').html(batch_options)
    $('#enrollment_course_id').parent().show()
    $('#enrollment_batch_id').parent().show()
    $("label[for='enrollment_course_id']").parent().show()
    $("label[for='enrollment_batch_id']").parent().show()
    
    fetchCourseDetails()
  else
    $('#enrollment_course_id').empty()
    $('#enrollment_batch_id').empty()
    $('#enrollment_course_id').parent().hide()
    $('#enrollment_batch_id').parent().hide()
    $("label[for='enrollment_course_id']").parent().hide()
    $("label[for='enrollment_batch_id']").parent().hide()
    $('#discipline_config_error').show()
    
    
fetchCourseDetails = ->
  course_id = $('#enrollment_course_id :selected').val()
  $.ajax "/courses/" + course_id,
    dataType: 'json',
    cache: false,
    success: (result) ->
      price = parseInt(result.price)
      $('#enrollment_course_fee').val(price)
      $('#enrollment_registration_fee').val(500)
      $('#enrollment_total').val(price+500)
      $('#enrollment_duration').val(result.duration)
    error: (result) ->
      alert "Error fetching Course Details"
