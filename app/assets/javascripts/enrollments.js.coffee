jQuery ->
  $('.datepicker').fdatepicker({
					format: 'mm-dd-yyyy'
				})
  
  courses= $('#enrollment_course_id').html()
  $('#enrollment_discipline_id').change ->
    discipline = $('#enrollment_discipline_id :selected').text()
    options = $(courses).filter("optgroup[label=#{discipline}]").html()
    if options
      $('#enrollment_course_id').html(options)
      $('#enrollment_course_id').parent().show()
      $("label[for='enrollment_course_id']").parent().show()
    else
      $('#enrollment_course_id').empty()
      $('#enrollment_course_id').parent().hide()
      $("label[for='enrollment_course_id']").parent().hide()
  
  $("a.submit").click ->
    $(this).closest('form').submit()