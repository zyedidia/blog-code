trait Object<U> {
    type Output;
}

impl<T: ?Sized, U> Object<U> for T {
    type Output = U;
}

fn transmute_obj<T: ?Sized, U>(x: <T as Object<U>>::Output) -> U {
    x
}

fn transmute<T, U>(x: T) -> U {
    transmute_obj::<dyn Object<U, Output = T>, U>(x)
}

fn main() {
    // make a null pointer
    let p = core::ptr::null_mut();
    // "safely" transmute it into a reference
    let x = transmute::<*mut i64, &'static i64>(p);

    // access the reference
    println!("x: {}", *x);
}
