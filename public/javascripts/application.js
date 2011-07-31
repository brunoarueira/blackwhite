var hash = {
  '.jpg'  : true,
  '.png' : true
};

function check_extension(filename,submitId) {
      var re = /\..+$/;
      var ext = filename.match(re);
      var submitEl = document.getElementById(submitId);
      if (hash[ext]) {
        submitEl.disabled = false;
        return true;
      } else {
        alert("Invalid filename, please select another file");
        submitEl.disabled = true;

        return false;
      }
}
