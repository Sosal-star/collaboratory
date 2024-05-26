const socket = io();

document.addEventListener('DOMContentLoaded', function () {
    const urlParams = new URLSearchParams(window.location.search);
    const busId = urlParams.get('busId');
    const routeId = urlParams.get('routeId');

    if (!busId || !routeId) {
        console.error('Invalid bus or route ID');
        return;
    }

    initializeSocket(busId, routeId);
    setupConfirmBookingListener();
});

function initializeSocket(busId, routeId) {
    socket.emit('subscribeToSeatUpdates', { busId, routeId });

    socket.on('initialData', data => {
        if (data.seats && data.price !== undefined) {
            displaySeats(data.seats);
            displayPrice(data.price);
        } else {
            console.error('Invalid seat or price data');
        }
    });

    socket.on('seatUpdated', data => {
        updateSeatStatus(data.seatNumber, 'booked');
    });

    socket.on('bookingConfirmed', data => {
        updateSeatStatus(data.seatNumber, 'booked');
    });

    socket.on('error', data => {
        console.error(data.message);
    });
}

function setupConfirmBookingListener() {
    document.getElementById('confirm-booking').addEventListener('click', function () {
        const urlParams = new URLSearchParams(window.location.search);
        const busId = urlParams.get('busId');
        const routeId = urlParams.get('routeId');
        const seats = selectedSeats.join(', ');
        const totalFare = parseFloat(document.getElementById('total-fare').textContent.split(': ')[1]);

        const form = document.getElementById('booking-form');
        form.querySelector('#form-busId').value = busId;
        form.querySelector('#form-routeId').value = routeId;
        form.querySelector('#form-seats').value = seats;
        form.querySelector('#form-totalFare').value = totalFare;

        form.submit();
    });
}

function displaySeats(seatData) {
    const seatChart = document.querySelector('.seat-chart');
    seatChart.innerHTML = ''; // Clear existing seats
    seatData.forEach(seat => {
        const seatDiv = createSeatElement(seat);
        seatChart.appendChild(seatDiv);
    });
}

function createSeatElement(seat) {
    const seatDiv = document.createElement('div');
    seatDiv.className = `seat ${seat.status}`;
    seatDiv.setAttribute('data-seat-number', seat.seat_number);
    seatDiv.textContent = seat.seat_number;
    if (seat.status === 'available') {
        seatDiv.addEventListener('click', () => toggleSeatSelection(seat.seat_number));
    }
    return seatDiv;
}

function updateSeatStatus(seatNumber, status) {
    const seatDiv = document.querySelector(`.seat[data-seat-number="${seatNumber}"]`);
    if (seatDiv) {
        seatDiv.classList.remove('available', 'reserved', 'booked', 'selected');
        seatDiv.classList.add(status);
    }
}

function displayPrice(price) {
    const priceElement = document.getElementById('ticket-price');
    priceElement.textContent = `Ticket Price: ${price}`;
}

let selectedSeats = [];
const selectedSeatsDisplay = document.getElementById('selected-seats');
const totalFareDisplay = document.getElementById('total-fare');

function toggleSeatSelection(seatNumber) {
    const index = selectedSeats.indexOf(seatNumber);
    if (index > -1) {
        selectedSeats.splice(index, 1); // Deselect the seat
        updateSeatStatus(seatNumber, 'available');
    } else {
        selectedSeats.push(seatNumber); // Select the seat
        updateSeatStatus(seatNumber, 'selected');
    }
    updateDisplayedInfo();
}

function updateDisplayedInfo() {
    selectedSeatsDisplay.textContent = `Selected Seats: ${selectedSeats.join(', ')}`;
    const priceText = document.getElementById('ticket-price').textContent.split(': ')[1];
    const price = parseFloat(priceText);
    const totalFare = selectedSeats.length * price;
    totalFareDisplay.textContent = `Total Fare: ${totalFare}`;
}
