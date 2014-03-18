
module.export = class Face
    nw = n = ne = null
    w = c = e = null
    sw = s = se = null
    constructor: (@nw, @n, @ne,
            @w, @c, @e,
            @sw, @s, @se) ->
        nw = @nw
        n = @n
        ne = @ne
        w = @w
        c = @c
        e = @e
        sw = @sw
        s = @s
        se = @se
    print: () ->
        "#{nw} #{n} #{ne}\n#{w} #{c} #{e}\n#{sw} #{s} #{se}"

