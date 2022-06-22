$(document).ready(function () {
  function resetFormValidator(formId) {
    $(formId).removeData("validator");
    $(formId).removeData("unobtrusiveValidation");
    $.validator.unobtrusive.parse(formId);
    console.log("reset data");
  }

  resetFormValidator("#createAccount");
  resetFormValidator("#Login");

  $.validator.addMethod("phoneRegex", function (value) {
    var phoneRegex = /^\+?(6\d{2}|7[1-9]\d{1})\d{6}$/;
    return phoneRegex.test(value);
  });

  $.validator.addMethod("emailRegex", function (value) {
    var emailRegex =
      /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    return emailRegex.test(value);
  });

  $.validator.addMethod("passwordRegex", function (value) {
    var passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
    return passwordRegex.test(value);
  });

  $("#createAccount").validate({
    rules: {
      name: {
        required: true,
        minlength: 3,
      },
      user: {
        required: true,
        minlength: 5,
      },
      mail: {
        required: true,
        emailRegex: true,
      },
      phone: {
        required: true,
        phoneRegex: true,
      },
      pwd1: {
        required: true,
        passwordRegex: true,
      },
      pwd2: {
        required: true,
        equalTo: "#signupPassword",
      },
    },

    messages: {
      name: {
        required: "This field is required",
        minlength: "Name must be at least 3 characters in length!",
      },
      user: {
        required: "This field is required",
        minlength: "Username must be at least 5 characters in length!",
      },
      mail: {
        required: "This field is required",
        emailRegex: "Invalid email address!",
      },
      phone: {
        required: "This field is required",
        phoneRegex: "Invalid phone number!",
      },
      pwd1: {
        required: "This field is required",
        passwordRegex:
          "The password must have a minimum of 8 characters, contain an uppercase, lowercase and a number.",
      },
      pwd2: {
        required: "This field is required",
        equalTo: "Does not match the original password!",
      },
    },
  });

  $("#Login").validate({
    rules: {
      user: {
        required: true,
      },
      pwd1: {
        required: true,
      },
    },
    messages: {
      user: {
        required: "This field is required",
      },
      pwd1: {
        required: "This field is required",
      },
    },
  });
});
