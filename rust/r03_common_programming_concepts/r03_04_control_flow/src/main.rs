fn main() {
    let number = 3;

    if number == 5 {
        println!("condition was true");
    } else if number < 5{
        println!("condition was false");
    } else {
        println!("idk");
    }

    let condition = true;
    let number = if condition {5} else {10};
    println!("The value of number is {number}");

    let mut counter = 0;
    let result = loop {
        counter += 1;
        if counter == 10 {
            break counter * 2;
        }
    };
    println!("The result is: {counter}");
    println!("The value of result is: {result}");

    
    let mut count = 0;
    'counting_up: loop {
        println!("\ncount = {count}");
        let mut remaining = 10;

        loop {
            println!("remaining = {remaining}");
            if remaining == 9 {
                break;
            }
            if count == 2 {
                break 'counting_up;
            }
            remaining -= 1;
        }
        count += 1;
    }
    println!("End count = {count}");


    let mut number = 3;
    while number != 0 {
        println!("{number}");
        number -= 1;
    }


    let a: [u32; 5] = [10,20,30,40,50];
    for element in a {
        println!("The value is {element}");
    }


    for number in (1..5).rev() {
        println!("{number}");
    }
}
