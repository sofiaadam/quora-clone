$(document).ready(function() {
    $('.question-vote').submit(function(f){
        f.preventDefault();
        var q_id = $(f.target).data('qid');
        
    $.ajax({
        url: "/questions/" + q_id + "/downvote",
        method: "post",
        dataType: "text",

        beforeSend: function() {
            $(f.target).find('input').attr('disable', true)
        },

        afterSend: function() {
            $(f.target).find("input").attr('disabled', false)
        },

        success: function(data){
            console.log(data)
            $(f.target).find('input').attr('value', 'Downvote | ' + data)
            
        }
    })
    });
});