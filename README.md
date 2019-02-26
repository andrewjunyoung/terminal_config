The files for my (Andrew Young's) vim configuration.

The design of my theme, rustyard, was designed from a principled perspective.
In particular, the theme aims to be attentive to the following values, ordered
roughly in order of importance.

(1) Above all, it should look nice
(2) It should use distinct but non-contrastive colors for different semantic
aspects of code (comments, control flow statements, values, etc)
(3) Primitive types should aim to be distinct colors from higher level (HL)
types, while reflecting their origin.

For point 3, we have taken this to use darker colors for more primitive types,
and as a type is more high level, we make the colors less dark.

An example of this is for chars and strings. Char constants are encoded as dark
green as they are hard-coded into the language, and so we consider them the
most pure. Chars are green, and strings, which in many languages are treated as
arrays (or similar) of chars, are light green. Integers are colored dark
turquoise, floats as turquoise, and double-precision values as turquoise. Longs
are a slightly lighter color than this.

We also broadly keep colors consistent among a type of syntax, as vim
describes.  Numbers, characters, and strings are all constants, and are
therefore all shades of green.  Comments are light-blue.  Control flow
statements are shades of orange, brown, and gold.

