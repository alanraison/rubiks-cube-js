
class Face
    constructor: (@nw, @n, @ne,
            @w, @c, @e,
            @sw, @s, @se) ->
    print: () ->
        "#{@nw} #{@n} #{@ne}\n#{@w} #{@c} #{e}\n#{@sw} #{@s} #{@se}"
    isSolved: () ->
        @nw is @c and
        @n is @c and
        @ne is @c and
        @w is @c and
        @e is @c and
        @sw is @c and
        @s is @c and
        @se is @c
    isEqualTo: (other) ->
        @nw is other.nw and
        @n is other.n and
        @ne is other.ne and
        @w is other.w and
        @c is other.c and
        @e is other.e and
        @sw is other.sw and
        @s is other.s and
        @se is other.se

module.exports = Face
