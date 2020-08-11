module main

import cli
import os

fn main() {
	mut cmd := cli.Command{
		name: 'agetest',
		description: 'noobing around',
		version: '0.0.2',
	}

	mut register_cmd := cli.Command{
		name: 'register',
		description: 'register user',
		execute: register_func,
	}

	register_cmd.add_flag(cli.Flag{
		flag: .string,
		required: true,
		name: 'name',
		description: 'Name of the user',
	})

	register_cmd.add_flag(cli.Flag{
		flag: .int,
		name: 'age',
		description: 'Age of the user',
	})
	
	cmd.add_command(register_cmd)
	cmd.parse(os.args)

}

fn register_func(cmd cli.Command){
	name := cmd.flags.get_string('name') or { panic('failed to get \'name\' flag: $err')}
	age := cmd.flags.get_int('age') or { panic('failed to get \'age\' flag: $err')}	

	println('[+] $name is $age old')
	if age >= 18 {
		println('[+} $name can register')
	} else {
		println('[!] $name cannot register')
	}
}
