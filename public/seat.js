const socket = io();

document.addEventListener('DOMContentLoaded', function () {
    const urlParams = new URLSearchParams(window.location.search);
    const busId = urlParams.get('busId');
    const routeId = urlParams.get('routeId');

    if (!busId || !routeId) {
        console.error('Invalid bus or route ID');
        return;
    }

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
        const seatDiv = document.querySelector(`.seat[data-seat-number="${data.seatNumber}"]`);
        if (seatDiv) {
            seatDiv.classList.remove('available');
            seatDiv.classList.add('booked');
        }
    });

    socket.on('bookingConfirmed', data => {
        const seatDiv = document.querySelector(`.seat[data-seat-number="${data.seatNumber}"]`);
        if (seatDiv) {
            seatDiv.classList.add('booked');
        }
    });

    socket.on('error', data => {
        console.error(data.message);
    });
});

function displaySeats(seatData) {
    const seatChart = document.querySelector('.seat-chart');
    seatChart.innerHTML = ''; // Clear existing seats
    seatData.forEach(seat => {
        const seatDiv = document.createElement('div');
        seatDiv.className = `seat ${seat.status}`;
        seatDiv.setAttribute('data-seat-number', seat.seat_number);
        seatDiv.textContent = seat.seat_number;
        if (seat.status === 'available') {
            seatDiv.addEventListener('click', () => selectSeat(seat.seat_number));
        }
        seatChart.appendChild(seatDiv);
    });
}

function displayPrice(price) {
    const priceElement = document.getElementById('ticket-price');
    priceElement.textContent = `Ticket Price: ${price}`;
}

let selectedSeats = [];
const selectedSeatsDisplay = document.getElementById('selected-seats');
const totalFareDisplay = document.getElementById('total-fare');

function selectSeat(seatNumber) {
    const index = selectedSeats.indexOf(seatNumber);
    if (index > -1) {
        selectedSeats.splice(index, 1); // Deselect the seat
    } else {
        selectedSeats.push(seatNumber); // Select the seat
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
