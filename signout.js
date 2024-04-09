document.addEventListener("DOMContentLoaded", function() {
    var signOutLink = document.getElementById("signout-link");
    signOutLink.addEventListener("click", function(event) {
        event.preventDefault(); // Prevent default link behavior (navigation)
        confirmSignOut();
    });
});

function confirmSignOut() {
    var result = confirm("Are you sure you want to sign out?");
    if (result) {
        // If user confirms, redirect to login page
        window.location.href = "login.html"; // Replace "login.html" with your actual login page URL
    }
}
