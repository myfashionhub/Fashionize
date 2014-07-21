function saveItem() {
  $('.search-result button').click(function(e) {
    var shopstyle_id = $(e.target).attr('data');
    $.ajax({
      url: '/items/save',
      method: 'post',
      dataType: 'json',
      data: { shopstyle_id: shopstyle_id },
      success: successfulSave
    });
  });
}

function successfulSave(data) {
  var name = data.description;
  $('.alert').html(name + ' has been saved to your closet.');
  $('.alert').fadeIn();
  setTimeout(function() {
    $('.alert').fadeOut();
  }, 3000);
}


function copyItem() {
  $('.copy-item').click(function(e) {
    var item_id = $(e.target).attr('data');
    $.ajax({
      url: '/items/copy',
      method: 'post',
      dataType: 'json',
      data: { item_id: item_id },
      success: successfulSave
    });
  });
}
