// Get Transaction Type:
const transactType = document.querySelector("#transact-type");

// Get Transaction Forms:
const paymentCard = document.querySelector(".payment-card");
const transferCard = document.querySelector(".transfer-card");
const depositCard = document.querySelector(".deposit-card");
const withdrawCard = document.querySelector(".withdraw-card");

transactType.addEventListener("change", function () {
    // Hide all cards initially
    paymentCard.style.display = "none";
    transferCard.style.display = "none";
    depositCard.style.display = "none";
    withdrawCard.style.display = "none";

    // Check For Transaction Type and Display Form:
    switch (transactType.value) {
        case "payment":
            paymentCard.style.display = "block"; // Show Payment Card
            break;

        case "transfer":
            transferCard.style.display = "block"; // Show Transfer Card
            break;

        case "deposit":
            depositCard.style.display = "block"; // Show Deposit Card
            break;

        case "withdraw":
            withdrawCard.style.display = "block"; // Show Withdraw Card
            break;

        default:
            // Handle default case if needed
            break;
    }
});
