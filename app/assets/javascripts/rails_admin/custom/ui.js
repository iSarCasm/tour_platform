//= require jquery-seat-plan

//= require jquery.livestamp
//= require jquery.timer
//= require jquery.notificationcenter

$(document).ready(function() {
  // Table view ADD button hack
  var oldNestedFormEvents = window.nestedFormEvents.insertFields
  window.nestedFormEvents.insertFields = function (content, assoc, link) {
    var insertable = $(link).parent().siblings('table').find('.js-insertable');
    if (insertable.length > 0) {
      insertable.first().append(content);
      return insertable.first().children().last();
    } else {
      return oldNestedFormEvents(content, assoc, link);
    }
  }
});

// Horizontaly scrolling table
$(document).on('rails_admin.dom_ready', function(){
  var $table = $('#bulk_form').find('table');
  var table = $table[0];

  // Abort if there's nothing to do. Don't repeat ourselves, either.
  if (!table || $table.hasClass('js-horiz-scroll')) { return; }

  // Add our indicator class. Also some enhancements.
  $table.addClass('js-horiz-scroll table-hover');

  ////
  // Make the table horizontally scrollable.
  // Inspiration from bootstrap's table-responsive.
  ////
  var tableWrapper = document.createElement('DIV');
  //tableWrapper.className = 'table-responsive';
  //tableWrapper.style.width = '100%';
  tableWrapper.style.overflowX = 'auto';
  tableWrapper.style.marginBottom = table.style.marginBottom;
  table.style.marginBottom = '0';
  //tableWrapper.style.overflowY = 'hidden';
  table.parentElement.insertBefore(tableWrapper, table);
  tableWrapper.appendChild(table);
  $table.find('th.last,td.last').each(function(index, td){
    var tr = td.parentElement;
    tr.insertBefore(td, tr.children[1]);
  });

  ////
  // Freeze the left columns.
  // Inspiration from http://stackoverflow.com/questions/1312236/how-do-i-create-an-html-table-with-fixed-frozen-left-column-and-scrollable-body
  ////
  var $trs = $table.find('tr');
  var $headerTr = $trs.first();
  var $headerTds = $headerTr.children('th,td');
  var i, $td, pos;
  var offsets = [13, 38, 121];
  var widths = [23, 83];
  for (i = 2; i < 3; i++) {
    $td = $($headerTds[i]);
    pos = $td.position();
    // offsets.push(pos.left);
    widths.push($td.outerWidth(true));
  }
  console.log(offsets)
  console.log(widths)
  $trs.each(function(index, tr){
    for (i = 0; i < 3; i++) {
      tr.children[i].style.position = 'absolute';
      tr.children[i].style.left = offsets[i]+'px';
      tr.children[i].style.width = widths[i]+'px';
    }
  });
  $td = $($headerTds[2]);
  var margin = $td.position().left + $td.outerWidth() - $(tableWrapper).position().left;
  tableWrapper.style.marginLeft = margin+'px';
  tableWrapper.style.borderLeft = '1px solid black';

  // Bottom-align the headers.
  var trHeight = $headerTr.height();
  for (i = 0; i < 3; i++) {
    $td = $($headerTr[0].children[i]);
    $td.css('padding-top', (trHeight - $td.height() - 4)+'px');
  }

  // Remove main browser window's horizontal scrollbar.
  $('body').css('overflow-x', 'hidden');
});


// Defaults getter
$(document).on('rails_admin.dom_ready', function() {
  jQuery.expr[':'].regex = function(elem, index, match) {
      var matchParams = match[3].split(','),
          validLabels = /^(data|css):/,
          attr = {
              method: matchParams[0].match(validLabels) ?
                          matchParams[0].split(':')[0] : 'attr',
              property: matchParams.shift().replace(validLabels,'')
          },
          regexFlags = 'ig',
          regex = new RegExp(matchParams.join('').replace(/^\s+|\s+$/g,''), regexFlags);
      return regex.test(jQuery(elem)[attr.method](attr.property));
  }

  $('#tour_hotel_hotel_id').on('change', function(val) {
    hotel = $(this).val();
    if (hotel) {
      get_defaults('hotel', hotel, 'tour_hotel')
    }
  });

  function get_defaults(model, id, current) {
    $.get("/admin/"+model+"/"+id+"/defaults.json", function(data, status){
      $.each(data, function(key, value) {
        name = key
        data = value.data
        title = value.title
        type = define_type(data)
        console.log(data)
        console.log(type)
        if(type === 'object') {
          populate_select_with_default(current + '_' + name + '_id', {id: data.id, text: title})
        } else if(type === 'array') {
          populate_association_with_defaults(name, data)
        } else if(type === 'string') {
          //populate_string(elem, val)
        } else if(type === 'null') {
          populate_select_with_default(current + '_' + name + '_id', {id: '', text: ''})
          clear_association(name);
        }
      })
    });
  }

  function define_type( val) {
    if(Array.isArray(val)) {
      return 'array';
    } else if(val === null) {
      return 'null'
    } else if (typeof(val) === 'object') {
      return 'object';
    } else {
      return 'string';
    }
  }

  function populate_select_with_default(target, value) {
    console.log(target)
    $('#'+target).first().empty();
    option = '<option value="' + value.id + '" selected="selected">' + value.text + '</option>'
    $('#tour_hotel_board_basis_id').first().append(option)
    $('[data-input-for="' + target +'"]').first().find('input').first().val(value.text)
  }

  function populate_association_with_defaults(name, data) {
    clear_association(name);
    for(var i = 0; i < data.length; i++) {
      value = data[i]
      // add new field
      $('.add_nested_fields[data-association="' + name  +'"]').first().click()
      $.each(value, function(key, val) {
        type = define_type(val)
        elem = $(':regex(id, tour_hotel_'+name+'_attributes.+' + key + ')').last();
        if (elem[0]) {
          if (type === 'object') {
            target = elem[0].id
            populate_select_with_default(target, {id: val.data.id, text: val.title})
          } else if(type === 'string') {
            populate_string(elem, val)
          }
        }
      });
    }
  }

  function clear_association(name) {
    $('.remove_nested_fields[data-association="' + name + '"').click()
  }

  function populate_string(elem, val) {
    elem.val(val);
  }
});
