# Levenshtein

Levenshtein distance is a metric for measuring the difference between two strings. Specifically, it is the minimum number of single-character edits (insertions, deletions, or substitutions) required to change one string into the other.

## Example

```elm
import Levenshtein

Levenshtein.distance "kitten" "sitting" --> 3
```
