def first_anagram?(string1, string2)
  possible_anagrams = string1.split("").permutation.to_a
  possible_anagrams.any? do |p_anagram|
    p_anagram.join("") == string2
  end
end
#factorial

def second_anagram?(string1, string2)
  arr_one = string1.split("")
  arr_two = string2.split("")

  arr_one.each do |l|
    arr_two.delete(l)
  end
  arr_two.empty?
end
#n^2

def third_anagram?(string1, string2)
  arr_one = string1.split("").sort
  arr_two = string2.split("").sort

  arr_one == arr_two
end
#n log n

def fourth_anagram?(string1, string2)
  hash_one = Hash.new {0}
  hash_two = Hash.new {0}

  string1.split("").each do |l|
    hash_one[l] += 1
  end

  string2.split("").each do |l|
    hash_two[l] -= 1
  end

  hash_one.all? { |key, val| hash_two[key] == val }
end
#n
