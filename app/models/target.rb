class Target < ApplicationRecord
    has_many :tweets

    TARGETS = 
    {
        "Donald Trump" => "realdonaldtrump",
        "Ted Cruz" => "tedcruz",
        "Laura Ingraham" => "ingrahamangle",
        "Jim Jordan" => "jim_jordan",
        "Tucker Carlson" => "tuckercarlson",
        "Steve Scalise" => "stevescalise",
        "Rand Paul" => "randpaul",
        "Ron DeSantis" => "GovRonDeSantis"
    }
    
end

