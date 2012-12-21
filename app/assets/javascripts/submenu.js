$(function() {
  var submenus = $('ul.left-menu li ul.submenu');
  $.each(submenus, function(index, submenu) {
    $(submenu).find('li:last').addClass('submenu-last');
  });
})
