function setFormMessage(formElement, type, message) {
  const messageElement = formElement.querySelector(".message");

  messageElement.textContent = message;
  messageElement.classList.remove("message_success", "message_error");
  messageElement.classList.add(`message--${type}`);
}

function setInputError(inputElement, message) {
  inputElement.classList.add("input_error");
  inputElement.parentElement.querySelector(".input_error_message").textContent =
    message;
}

function clearInputError(inputElement) {
  inputElement.classList.remove("input_error");
  inputElement.parentElement.querySelector(".input_error_message").textContent =
    "";
}

document.addEventListener("DOMContentLoaded", () => {
  const loginForm = document.querySelector("#login");
  const createAccountForm = document.querySelector("#createAccount");

  document
    .querySelector("#linkCreateAccount")
    .addEventListener("click", (e) => {
      e.preventDefault();
      loginForm.classList.add("hidden");
      createAccountForm.classList.remove("hidden");
    });

  document.querySelector("#linkLogin").addEventListener("click", (e) => {
    e.preventDefault();
    loginForm.classList.remove("hidden");
    createAccountForm.classList.add("hidden");
  });

  loginForm.addEventListener("submit", (e) => {
    e.preventDefault();

    // AJAX login

    setFormMessage(loginForm, "error", "Invalid username/password combination");
  });

  document.querySelectorAll(".input").forEach((inputElement) => {
    inputElement.addEventListener("blur", (e) => {
      if (
        e.target.id === "signupUsername" &&
        e.target.value.length > 0 &&
        e.target.value.length < 10
      ) {
        setInputError(
          inputElement,
          "Username must be at least 10 characters in length"
        );
      }
    });

    inputElement.addEventListener("input", (e) => {
      clearInputError(inputElement);
    });
  });
});
