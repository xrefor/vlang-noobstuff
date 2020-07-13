fn main() {
	lb := '[+]----------------------------'
	user_name := input('[?] User Name: ')
	user_age := input('[?] User age: ')
	user2_name := input('[?] User2 Name: ')
	user2_age := input('[?] User2 age: ')
	user := User{
		age: user_age.int()
		name: user_name
	}
	user2 := User{
		age: user2_age.int()
		name: user2_name
	}
	println(lb)
	println('[+] $user.name is $user.age years old.')
	println('[+] $user.name can register: $user.can_register()')
	println(lb)
	println('[+] $user2.name is $user2.age yeas old.')
	println('[+] $user2.name can register: $user2.can_register()')
	println(lb)
}

struct User {
	age  int
	name string
}

fn (u User) can_register() bool {
	return u.age > 18
}
