// At any given time, you can have either one mutable reference or any number of immutable references.

fn main() {
    let s1 = String::from("hello");
    let len = calculate_length(&s1);
    println!("The length of '{s1}' is {len}.");

    let mut s1 = String::from("hello");
    let len = calculate_length(&s1);
    change(&mut s1);
    println!("The string is '{s1}'");


    let mut s = String::from("hello");
    {
        let r1 = &mut s;
    }
    let r2 = &mut s;

    let mut s = String::from("hello");
    let r1 = &s;
    let r2 = &s;
    // let r3 = &mut s;
    // println!("{r1}, {r2}, and {r3}");

        
    let mut s = String::from("hello");
    let r1 = &s;
    let r2 = &s;
    println!("{r1} and {r2}");
    let r3 = &mut s;
    println!("{r3}");

    let reference_to_nothing = dangle(); 
}

fn calculate_length(s: &String) -> usize { s.len() }
fn change(some_string: &mut String) { some_string.push_str(", world"); }
fn dangle() -> String { let s = String::from("hello"); s }

