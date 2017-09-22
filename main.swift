//
//  main.swift
//  PermutationCalculator
//
//  Created by Ben de Vries on 2017-09-22.
//  Copyright © 2017 Ben de Vries. All rights reserved.
//

import Foundation

print("Enter permutation:")
var input = readLine()!

if input.first == "("
{
	input = String(input.dropFirst())
}
if input.last == ")"
{
	input = String(input.dropLast())
}

let perms = input.components(separatedBy: ")(")
var output = "("

var distinctChars = Set(input.characters)
distinctChars.remove("(")
distinctChars.remove(")")

var o = distinctChars.first!

while(!distinctChars.isEmpty)
{
	for perm in perms.reversed()
	{
		if perm.contains(o)
		{
			if o == perm.characters.last
			{
				o = perm.characters.first!
			}
			else
			{
				let idx = perm.characters.index(of: o)
				let newidx = perm.characters.index(after: idx!)
				o = perm[newidx]
			}
		}
	}
	if (distinctChars.contains(o))
	{
		output.append(o)
		distinctChars.remove(o)
	}
	else
	{
		output.append(")(")
		o = distinctChars.first!
	}
}

// Display output
print("Disjoint permutations:")
print(output + ")")
