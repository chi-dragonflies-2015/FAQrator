  $(document).ready(function() {
    var clip = new ZeroClipboard($("#copy-edit"));
    $('#copy-edit').on("click", function(){
      Materialize.toast('Edit URL saved to clipboard!', 4000)
      event.preventDefault();
    });
    var clip = new ZeroClipboard($("#copy-show"));
    $('#copy-show').on("click", function(){
      Materialize.toast('Public URL saved to clipboard', 4000)
      event.preventDefault();
    });
  });