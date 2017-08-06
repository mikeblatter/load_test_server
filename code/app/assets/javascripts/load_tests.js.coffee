# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


### Functions

###

# order_steps function, ste UI and value of each step when called
order_steps = ->
  $('#user_scenario_steps input.step_order').each (index, element) =>
    $(element).val(parseInt(index) + 1)

  $('#user_scenario_steps span.step_number').each (index, element) =>
    $(element).text(parseInt(index) + 1)

# Functions
draw_load_test_schedule_chart = ->
  new Chartkick.LineChart("load_test_schedule_chart", load_test_schedule_data(),
    {
      "discrete": true,
      "library": {
        curveType: 'none',
        hAxis: {
          title: 'Duration (Minutes)'
        },
        vAxis: {
          title: 'Maximum Virtual Users'
        }
      }
    });

load_test_schedule_data = ->
  data_array = [[0, 0]];

  x = 0

  $('.load_test_schedules .nested-fields').each (index, element) =>
    if $(element).is(":visible")
      x += parseInt($(element).find('input:first-child').val());
      y = parseInt($(element).find('input:nth-child(3)').val());
      if !isNaN(x) && !isNaN(y)
        data_array.push([x, y]);

  return data_array;


$(document).ready ->
  order_steps()

  # User Steps

  $("#user_steps #user_scenario_steps").collapse().sortable
    stop: (event, ui)->
      order_steps()

  # init bootstrap collapse for elements with panel-collapse class
  $('#user_steps .panel-collapse').collapse({toggle: false})
  $('#user_steps .panel-collapse:first').collapse('toggle')

  if ($('#user_steps #user_scenario_steps .nested-fields').length == 0)
    $('#user_steps a[data-association-insertion-node="#user_scenario_steps"]').trigger('click');

  # Accordian collapse logic
  $('#user_steps').on "click", "[data-toggle=collapse-next]", (event) ->
    #Try to close all of the collapse areas first
    parent_id = $(this).data('parent')
    $(parent_id + ' .panel-collapse').collapse('hide')

    $target = $(this).parent().parent().parent().find('.panel-collapse')
    $target.collapse('toggle');

  # Steps
  $('#user_steps #user_scenario_steps').on 'cocoon:after-insert', (event, step_container) ->
    return if $(step_container).hasClass('request_params')

    $('#user_steps').find('.panel-collapse').collapse('hide');
    $(step_container).find('.panel-collapse').collapse('toggle');

    order_steps();

  $('#user_steps #user_scenario_steps').on 'cocoon:after-remove', (event, step_container) ->
    return if $(step_container).hasClass('request_params')

    order_steps();

  # Load Test Steps

  # Custom Dropdown
  $('#load_test_steps').on 'click', '.bs-dropdown-to-select-group .dropdown-menu li', (event) ->
    $target = $(event.currentTarget);
    $target.closest('.bs-dropdown-to-select-group')
      .find('[data-bind="bs-drp-sel-value"]').val($target.attr('data-value'))
      .end()
      .children('.dropdown-toggle').dropdown('toggle');
    $target.closest('.bs-dropdown-to-select-group')
      .find('[data-bind="bs-drp-sel-label"]').text($target.attr('data-value'));

    return false;

  if ($('#load_test_steps .load_test_schedules').length > 0)
    #Draw chart and set up bindings to inputs for up to date chart
    draw_load_test_schedule_chart();

    $('#load_test_steps').on 'change', '.load_test_schedules .nested-fields input', (event) ->
      draw_load_test_schedule_chart();

    $('.load_test_schedules').on 'cocoon:after-insert', (event, container) ->
      draw_load_test_schedule_chart();

    $('.load_test_schedules').on 'cocoon:after-remove', (event, container) ->
      draw_load_test_schedule_chart();

    #Add one sub table form by default for stylings and viewing purposes
    if ($('.load_test_schedules .nested-fields').length == 0)
      $('a[data-association-insertion-node=".load_test_schedules"]').trigger('click');

    if ($('.load_test_aws_ec2_instances .nested-fields').length == 0)
      $('a[data-association-insertion-node=".load_test_aws_ec2_instances"]').trigger('click');

    if ($('.load_test_aws_rds_instances .nested-fields').length == 0)
      $('a[data-association-insertion-node=".load_test_aws_rds_instances"]').trigger('click');