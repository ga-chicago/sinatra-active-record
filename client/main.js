$.ajax({
  method: 'GET',
  url: 'http://localhost:9393/buildings/1',
  success: function(response){
      $('#name').text(response.building.name);
      $('#address').text(response.building.address);
      $('#height').text(response.building.height);
      $('#image_url').attr('src',response.building.image_url);
      $('#designer').text(response.building.designer);
      for(i = 0; i < response.tenants.length; i++){
        $('#tenants').append('<li>' + response.tenants[i].name + '</li>');
      }

  }
})

$.ajax({
  method: 'GET',
  url: 'http://localhost:9393/buildings',
  success: function(response){
    for(i = 0; i < response.length; i++){
      $('#links').append(" <a class='link' href='http://localhost:9393/buildings/" + response[i].id + "'>"+ response[i].name + "</a>" )
    }
      $('#name').text(response.name);
      $('#address').text(response.address);
      $('#height').text(response.height);
      $('#image_url').attr('src',response.image_url);
      $('#designer').text(response.designer);
  }
})

$('body').on('click','.link',function(e){
  e.preventDefault();
  var url = $(e.target).attr('href');
  $.ajax({
    method: 'GET',
    url: url,
    success: function(response){
      $('#name').text(response.name);
      $('#address').text(response.address);
      $('#height').text(response.height);
      $('#image_url').attr('src',response.image_url);
      $('#designer').text(response.designer);
    }
  })
})
