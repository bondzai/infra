#!/bin/bash
load 'bats'

# Load the script you want to test
load 'your_script.sh'

@test "validate_is_number should return true for a number" {
    run validate_is_number 42
    [ "$status" -eq 0 ]
}

@test "validate_is_number should return false for a non-number" {
    run validate_is_number "not_a_number"
    [ "$status" -eq 1 ]
}

@test "validate_is_exists should return true for an existing value" {
    run validate_is_exists "some_value"
    [ "$status" -eq 0 ]
}

@test "validate_is_exists should return false for a non-existing value" {
    run validate_is_exists ""
    [ "$status" -eq 1 ]
}
