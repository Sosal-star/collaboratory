document.addEventListener('DOMContentLoaded', function () {
    const urlParams = new URLSearchParams(window.location.search);
    const name = urlParams.get('name');
    const email = urlParams.get('email');
    const busId = urlParams.get('busId');
    const routeId = urlParams.get('routeId');
    const seats = urlParams.get('seats');
    const totalFare = urlParams.get('totalFare');

    if (name) document.getElementById('name').value = name;
    if (email) document.getElementById('email').value = email;
    if (busId && routeId) {
        document.getElementById('bus-details').textContent = `Bus ID: ${busId}, Route ID: ${routeId}`;
    }
    if (seats) {
        document.getElementById('seat-numbers').textContent = seats;
    }
    if (totalFare) {
        document.getElementById('amt').value = totalFare;
        document.getElementById('tAmt').value = totalFare;
        const pid = `${busId}-${routeId}-${new Date().getTime()}`;
        document.getElementById('pid').value = pid;
    }

    const status = urlParams.get('status');
    if (status === 'success' || status === 'failed') {
        document.getElementById('ticket').style.display = 'block';
        document.getElementById('ticket-name').textContent = `Name: ${name}`;
        document.getElementById('ticket-email').textContent = `Email: ${email}`;
        document.getElementById('ticket-bus-details').textContent = `Bus ID: ${busId}, Route ID: ${routeId}`;
        document.getElementById('ticket-seat-numbers').textContent = `Seats: ${seats}`;
        document.getElementById('ticket-total-fare').textContent = `Total Fare: ${totalFare}`;
    }
});

function generateSignature(payload) {
    return fetch('/generate-signature', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(payload)
    })
    .then(response => response.json())
    .then(data => {
        if (data.signature) {
            document.getElementById('signature').value = data.signature;
            document.getElementById('payment-form').submit();
        } else {
            alert('Failed to generate signature');
        }
    });
}

function generatePaymentForm() {
    const payload = {
        amt: document.getElementById('amt').value,
        txAmt: document.getElementById('txAmt').value,
        psc: document.getElementById('psc').value,
        pdc: document.getElementById('pdc').value,
        tAmt: document.getElementById('tAmt').value,
        pid: document.getElementById('pid').value,
        scd: document.getElementById('scd').value,
        signedFieldNames: document.getElementById('signedFieldNames').value
    };
    generateSignature(payload);
}

function downloadTicket() {
    const element = document.createElement('a');
    const ticketDetails = `
        Name: ${document.getElementById('ticket-name').textContent}
        Email: ${document.getElementById('ticket-email').textContent}
        Bus Details: ${document.getElementById('ticket-bus-details').textContent}
        Seat Numbers: ${document.getElementById('ticket-seat-numbers').textContent}
        Total Fare: ${document.getElementById('ticket-total-fare').textContent}
    `;
    const file = new Blob([ticketDetails], { type: 'text/plain' });
    element.href = URL.createObjectURL(file);
    element.download = 'ticket.txt';
    document.body.appendChild(element);
    element.click();
}

