use std::io;
use rand::Rng;
use std::cmp::Ordering;

fn main() {
    println!("Guess the number");
    let secret_number = rand::thread_rng().gen_range(1..=100); // use a RNG (random number generator ) and call the gen_range() method to generate a random number between 1 and 100

    loop { 
        println!("Please input your guess");
        let mut guess = String::new(); // define a mutable variable named "guess" which is a string
        io::stdin().read_line(&mut guess).expect("Failed to read line"); // use io::stdin to call the read_line method and pass a "&mut guess" which is where the user inpout will be stored, if fail it ill call a expect() to display a error message 
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        }; // were transform the "guess" with trim (delete empty spaces at start and end of the string) and parse (parser guess to u32 type), it verify and return a value wheter the "guess" can be casted at u32 type

        println!("You guessed: {}", guess);

        match guess.cmp(&secret_number){
            Ordering::Less => println!("Too small"),
            Ordering::Greater => println!("Too big"),
            Ordering::Equal => { println!("You win"); break;},
        } // use cmp to compare "guess" with "secret_number", it return a Ordering::{comparation}, well use it display a message for each case.
    }
}
