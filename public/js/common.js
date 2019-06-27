$(function(){
    // $('select.selectize').each(function(){
    //     $(this).selectize({
    //         onFocus:function(){
    //             $('input, textarea').placeholder();
    //         }
    //     });
    //
    //     var selectize = this.selectize;
    //     var wrapper = selectize.$wrapper;
    //
    //     if ( $(this).data('plain-select') == true ) {
    //         wrapper.addClass('plain-select');
    //         wrapper.find('input').attr('readonly','readonly');
    //     }
    // });


    // $(document).on('focus', 'input[readonly]', function(){
    //     this.blur();
    // });

    $('#footer .family-site select').on('change', function(){
        var val = $(this).val();
        if ( val != '' ) {
//            window.location.href = val;
            // window.open(val, 'family site','');
        }
//        $(this).find('option').removeAttr('selected');
//        $(this).val('');
        // $('#footer .family-site select')[0].selectize.clear();
    });
    $('#footer .family-site a').on('click', function(e) {
    	e.preventDefault();
    	var val = $('#footer .family-site select').val();
    	if ( val != '' ) {
          //window.location.href = val;
    		window.open(val, '_blank','');
    	}
    });

    $('input, textarea').placeholder();

    $(document).on('mouseenter', '.tooltip', function(e){
        $(this).find('.tooltip-box').addClass('active');
    });
    $(document).on('mouseleave', '.tooltip', function(e){
        $(this).find('.tooltip-box').removeClass('active');
    });


    $(document).on('click', '*[data-modal-open="true"]', function(e){
        e.preventDefault();
        var modal = $(this).data('modal-target');
        showModal(modal);
    });

    $(document).on('click', '*[data-modal-close="true"]', function(e){
        e.preventDefault();
        hideModal('#' + $(this).closest('.modal').attr('id'));

    });

    // tabs

    $(document).on('click' , '.tab-menu a[data-tab="true"]', function(e){
        e.preventDefault();
        $(this).closest('li').addClass('active').siblings().removeClass('active');
        var target = $(this).attr('data-tab-target');
        $('.tab-content' + target).addClass('active').siblings().removeClass('active');
    });

    // form
    $(document).on('click', '.form-file button', function(e){
        e.preventDefault();
        $(this).siblings('input[type="file"]').trigger('click');
    });


    $(document).on('change', '.form-file input[type="file"]', function(e){
        e.preventDefault();
        if ( this.files[0] ) {
            var filename = this.files[0].name;
            // $(this).siblings('input[type="text"]').val(filename);
        }
    });

    $(window).on('resize', function(){

        var windowHeight = $(window).innerHeight();
        $('.modal-box.modal-centered').each(function(){
            var modalHeight = $(this).height();
            var margin = windowHeight - modalHeight;
            margin = Math.max(margin,100) - 2;
            $(this).css({
//                'margin-top':margin/2,
//                'margin-bottom':margin/2
            })
        })
    }).trigger('resize');
});


function showModal(modal) {
    $('.modal' + modal).addClass('active');
    $('body').addClass('modal-opened');
    $('.modal').find('img').on('load', function(){
        $(window).trigger('resize');
    });
    $(window).trigger('resize');
}

function showModalById(modalid) {
    $(modalid).addClass('active');
    $('body').addClass('modal-opened');
    $(modalid).find('img').on('load', function(){
        $(window).trigger('resize');
    });
    $(window).trigger('resize');
}

function hideModal(modal) {
    $('.modal' + modal ).removeClass('active');
    if ( $('.modal.active').size() == 0 ) {
        $('body').removeClass('modal-opened');
    }
    $(window).trigger('resize');
}

function hideModalById(modalid) {
    $(modalid).removeClass('active');
    if ( $(modalid+'.active').size() == 0 ) {
        $('body').removeClass('modal-opened');
    }
    $(window).trigger('resize');
}
