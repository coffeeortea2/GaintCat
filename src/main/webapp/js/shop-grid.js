/**
 * 商品清單頁面專用
 */
$(document).ready(function () {
	$('.set-bg').each(function () {
		var bg = $(this).data('setbg');
		$(this).css('background-image', 'url(' + bg + ')');
	});
});