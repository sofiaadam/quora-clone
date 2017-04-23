$(document).ready(function () {
    $('.question-vote').submit(function (e) {
        e.preventDefault();
        var q_id = $(e.target).data('qid');

        $.ajax({
            url: "/questions/" + q_id + "/downvote",
            method: "post",
            dataType: "json",

            beforeSend: function () {
                $(e.target).find('input').attr('disable', true)
            },

            afterSend: function () {
                $(e.target).find("input").attr('disabled', false)
            },

            success: function (data) {
                console.log(data)
                $(e.target).find('input').attr('value', 'Downvote | ' + data)
            }
        })
    });

    $("#reply-voteup").submit(function (f) {
        f.preventDefault();
        var quest_id = $(f.target).data("aqid");
        var ans_id = $(f.target).data("aid");

        
        $.ajax({
            url: "/questions/" + quest_id + "/answer/" + ans_id + "/upvote",
            method: "post",
            dataType: "json",

            beforeSend: function () {
                $(f.target).find('input').attr('disable', true)
            },

            afterSend: function () {
                $(f.target).find("input").attr('disabled', 'disabled')
            },

            success: function (data) {
                console.log(data)
                $(f.target).find('input').attr('value', 'Upvote | ' + data)
            }
        })
    });

    $('#reply-votedown').submit(function (d) {
        d.preventDefault();
        var quest_id = $(d.target).data("aqid");
        var ans_id = $(d.target).data("aid");

        $.ajax({
            url: "/questions/" + quest_id + "/answer/" + ans_id + "/downvote",
            method: "post",
            dataType: "json",
            

            success: function (data) {
                $(f.target).find('input').attr('value', 'Upvote | ' + data)
            }

        })
    });
});