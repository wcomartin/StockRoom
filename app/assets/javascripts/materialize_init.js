$(document).ready(function() {
    $('select').formSelect();

    // M.FloatingActionButton.init(document.querySelectorAll('.fixed-action-btn'), {});

    var urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has("saved") && urlParams.get('saved') === "true"){
        M.toast({html: 'Saved!'})
    }
});
