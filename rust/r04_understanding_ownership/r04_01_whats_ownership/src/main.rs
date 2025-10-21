/* 
* Each value has an owner
* There can only be one owner at a time
* When the owner goes out of scope, the value will be dropped 
*/

fn main() {
    let mut s = String::from("hello");
    s.push_str(", world!");
    println!("{}", s);

    let s1 = String::from("ferris");
    let s2 = s1;
    println!("{s2}");

    let mut s = String::from("hello");
    s = String::from("hallo");
    println!("{s}");

    let s1 = String::from("hello");
    let s2 = s1.clone();
    println!("s1 = {s1}, s2 = {s2}");

    let x = 5;
    let y = x;
    println!("x = {x}, y = {y}");

    let s = String::from("hello");
    takes_ownership(s);
    // println!("{s}");

    let x = 5;
    makes_copy(x);
    println!("{x}");


    let s1 = gives_ownership();
    let s2 = String::from("hello");
    let s3 = takes_and_gives_back(s2);

    let s1 = String::from("hello");
    let (s2, len) = calculate_length(s1);
    println!("The length of '{s2}' is {len}")
}

fn takes_ownership(some_string: String) { println!("{some_string}"); }
fn makes_copy(some_integer: i32) { println!("{some_integer}"); }

fn gives_ownership() -> String {
    let some_string = String::from("yours");
    some_string
}
fn takes_and_gives_back(a_string: String) -> String { a_string }

fn calculate_length(s: String) -> (String, usize) {
    let length = s.len();
    (s, length)
}
