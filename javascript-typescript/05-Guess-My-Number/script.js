'use strict';

let secretNumber = Math.trunc( Math.random() * 20 ) + 1;
let score = 20;
let highScore = 0;

const displayMessage = function (message) {
    document.querySelector('.message').textContent = message;
}

document.querySelector('.check').addEventListener('click', function () {
    let guess = Number(document.querySelector('.guess').value)
    let current_score = Number(document.querySelector('.score').textContent)
    
    if (!guess) {
        displayMessage("No Number")
    }
    else if (guess === secretNumber) {
        displayMessage("Correct Guess")
        //document.querySelector('.score').textContent = current_score
        document.querySelector('.number').textContent = secretNumber
        document.querySelector('.number').style.width = '30rem'
        document.querySelector('body').style.backgroundColor = '#60b347'
        if (current_score > highScore) {
            document.querySelector('.highscore').textContent = current_score
        }
    } else if (guess !== secretNumber) {
        if (current_score > 1) {
            displayMessage("Incorrect Guess")
            displayMessage( guess > secretNumber ? "Too High" : "Too Low")
            document.querySelector('.score').textContent = current_score - 1
        } else {
            displayMessage("You lost!")
        }
        document.querySelector('body').style.backgroundColor = '#222'
    }
});

document.querySelector('.again').addEventListener('click', function () {
    document.querySelector('.score').textContent = 20
    secretNumber = Math.trunc( Math.random() * 20 ) + 1;
    document.querySelector('body').style.backgroundColor = '#222'
    document.querySelector('.number').textContent = "?"
    document.querySelector('.guess').value = ""
    displayMessage("Start guessing...")    
})