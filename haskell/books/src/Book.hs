-- | Book manages book records
module Book where

-- | Book has an ID title, and list of authors
data Book = Book Int String [String] deriving (Eq, Ord, Show, Read)
