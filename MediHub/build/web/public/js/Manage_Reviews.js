
// function filter() {
//     $("filter_dropdown").change(function () {
//         var selectedValue = document.getElementsByClassName('filter_text').val();
//         var selectedValue = $(this).val();
//         console.log(selectedValue);
//         if(selectedValue==99){
//             document.getElementsByClassName('filter_text').style.display = 'none';
//             document.getElementsByClassName('filter_date').style.display = 'block';
//         }
//         else{
//             document.getElementsByClassName('filter_text').style.display = 'block';
//             document.getElementsByClassName('filter_date').style.display = 'none';
//         }
//     });
// };

$(function () {
  $(".filter_dropdown").change(function () {
      var selectedText = $(this).find("option:selected").text();
      var selectedValue = $(this).val();
      if(selectedValue==99){
          $(".filter_text").css("display", "none");
          $(".filter_date").css("display", "inline-block");
      }
      else{
          $(".filter_date").css("display", "none");
          $(".filter_text").css("display", "inline-block");
      }
      // alert("Selected Text: " + selectedText + " Value: " + selectedValue);
  });
});
