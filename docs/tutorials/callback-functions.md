# Callback Functions Tutorial

> This tutorial was imported from the [LÖVE Wiki](https://love2d.org/wiki/Tutorial:Callback_Functions).

---

# Tutorial:Callback Functions

The [callback](Category:Callbacks "Category:Callbacks") functions
in LÖVE are called by `love.run` to perform
various tasks and are all optional. However, a fully-featured game
experience would probably utilize nearly all of them, so it's wise to
know what they are.

A callback, for those new to programming or otherwise unfamiliar with
the term, is a function which works backwards in a sense. In a regular
function like
`love.graphics.draw` or
math.floor, you call it and LÖVE or Lua does something. A callback, on
the other hand, is a function that you code and LÖVE calls at certain
times. This makes it easy to keep your code organized and optimal. For
example, since love.load will only get called once when the game is
first started (before any other callback), it's a fine place to put code
which loads game content and otherwise prepares things.

- [1
  love.load](#love.load)
- [2
  love.update](#love.update)
- [3
  love.draw](#love.draw)
- [4
  love.mousepressed](#love.mousepressed)
- [5
  love.mousereleased](#love.mousereleased)
- [6
  love.keypressed](#love.keypressed)
- [7
  love.keyreleased](#love.keyreleased)
- [8
  love.focus](#love.focus)
- [9
  love.quit](#love.quit)
- [10 Other
  languages](#Other_languages)

## `love.load`

    function love.load()
       image = love.graphics.newImage("cake.jpg")
       love.graphics.setNewFont(12)
       love.graphics.setColor(0,0,0)
       love.graphics.setBackgroundColor(255,255,255)
    end

This function gets called only once, when the game is started, and is
usually where you would load resources, initialize variables and set
specific settings. All those things can be done anywhere else as well,
but doing them here means that they are done once only, saving a lot of
system resources.

## `love.update`

    function love.update(dt)
       if love.keyboard.isDown("up") then
          num = num + 100 * dt -- this would increment num by 100 per second
       end
    end

This function is called continuously and will probably be where most of
your math is done. 'dt' stands for "[delta
time](love.timer.getDelta "love.timer.getDelta")" and is the
amount of seconds since the last time this function was called (which is
usually a small value like 0.025714).

## `love.draw`

    function love.draw()
       love.graphics.draw(image, imgx, imgy)
       love.graphics.print("Click and drag the cake around or use the arrow keys", 10, 10)
    end

[`love.draw`](love.draw "love.draw") is where all the drawing
happens (if that wasn't obvious enough already) and if you call any of
the
[`love.graphics.draw`](love.graphics.draw "love.graphics.draw")
outside of this function then it's not going to have any effect. This
function is also called continuously so keep in mind that if you change
the font/color/mode/etc at the end of the function then it will have an
effect on things at the beginning of the function. For example:

    function love.load()
       love.graphics.setColor(0,0,0)
    end

    function love.draw()
       love.graphics.print("This text is not black because of the line below", 100, 100)
       love.graphics.setColor(255,0,0)
       love.graphics.print("This text is red", 100, 200)
    end

## `love.mousepressed`

|  |
|----|
| ***Available since LÖVE [0.10.0](0.10.0 "0.10.0")*** |
| This variant is not supported in earlier versions. |

    function love.mousepressed(x, y, button, istouch)
       if button == 1 then
          imgx = x -- move image to where mouse clicked
          imgy = y
       end
    end

This function is called whenever a mouse button is pressed and it
receives the button and the coordinates of where it was pressed. The
button can be any of the button index that was pressed. This function
goes very well along with
[`love.mousereleased`](love.mousereleased "love.mousereleased").

## `love.mousereleased`

|  |
|----|
| ***Available since LÖVE [0.10.0](0.10.0 "0.10.0")*** |
| This variant is not supported in earlier versions. |

    function love.mousereleased(x, y, button, istouch)
       if button == 1 then
          fireSlingshot(x,y) -- this totally awesome custom function is defined elsewhere
       end
    end

This function is called whenever a mouse button is released and it
receives the button and the coordinates of where it was released. You
can have this function together with
[`love.mousepressed`](love.mousepressed "love.mousepressed") or
separate, they aren't connected in any way.

## `love.keypressed`

    function love.keypressed(key)
       if key == 'b' then
          text = "The B key was pressed."
       elseif key == 'a' then
          a_down = true
       end
    end

This function is called whenever a keyboard key is pressed and receives
the key that was pressed. The key can be any of the
[constants](KeyConstant "KeyConstant"). This functions goes very
well along with
[`love.keyreleased`](love.keyreleased "love.keyreleased").

## `love.keyreleased`

    function love.keyreleased(key)
       if key == 'b' then
          text = "The B key was released."
       elseif key == 'a' then
          a_down = false
       end
    end

This function is called whenever a keyboard key is released and receives
the key that was released. You can have this function together with
[`love.keypressed`](love.keypressed "love.keypressed") or
separate, they aren't connected in any way.

## `love.focus`

    function love.focus(f)
      if not f then
        print("LOST FOCUS")
      else
        print("GAINED FOCUS")
      end
    end

This function is called whenever the user clicks off and on the LÖVE
window. For instance, if they are playing a windowed game and a user
clicks on their Internet browser, the game could be notified and
automatically pause the game.

    function love.focus(f) gameIsPaused = not f end

    function love.update(dt)
        if gameIsPaused then return end

        -- The rest of your love.update code goes here
    end

## `love.quit`

    function love.quit()
      print("Thanks for playing! Come back soon!")
    end

This function is called whenever the user clicks the window's close
button (often an X). For instance, if the user decides they are done
playing, they could click the close button. Then, before it closes, the
game can save its state.

Those are the callback functions and their basic usage.

  

## Other languages

<a
href="/w/index.php?title=Tutorial:Callback_Functions_(Dansk)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Dansk) (page does not exist)">Dansk</a> –
[Deutsch](Tutorial:Callback_Functions_(Deutsch) "Tutorial:Callback Functions (Deutsch)") –
English –
[Español](Tutorial:Callback_Functions_(Espa%C3%B1ol) "Tutorial:Callback Functions (Español)") –
[Français](Tutorial:Callback_Functions_(Fran%C3%A7ais) "Tutorial:Callback Functions (Français)") –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(Indonesia)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Indonesia) (page does not exist)">Indonesia</a> –
[Italiano](Tutorial:Callback_Functions_(Italiano) "Tutorial:Callback Functions (Italiano)") –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(Lietuvi%C5%A1kai)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Lietuviškai) (page does not exist)">Lietuviškai</a> –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(Magyar)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Magyar) (page does not exist)">Magyar</a> –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(Nederlands)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Nederlands) (page does not exist)">Nederlands</a> –
[Polski](Tutorial:Callback_Functions_(Polski) "Tutorial:Callback Functions (Polski)") –
[Português](Tutorial:Callback_Functions_(Portugu%C3%AAs) "Tutorial:Callback Functions (Português)") –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(Rom%C3%A2n%C4%83)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Română) (page does not exist)">Română</a> –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(Slovensk%C3%BD)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Slovenský) (page does not exist)">Slovenský</a> –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(Suomi)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Suomi) (page does not exist)">Suomi</a> –
[Svenska](Tutorial:Callback_Functions_(Svenska) "Tutorial:Callback Functions (Svenska)") –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(T%C3%BCrk%C3%A7e)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Türkçe) (page does not exist)">Türkçe</a> –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(%C4%8Cesky)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Česky) (page does not exist)">Česky</a> –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(%CE%95%CE%BB%CE%BB%CE%B7%CE%BD%CE%B9%CE%BA%CE%AC)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Ελληνικά) (page does not exist)">Ελληνικά</a> –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(%D0%91%D1%8A%D0%BB%D0%B3%D0%B0%D1%80%D1%81%D0%BA%D0%B8)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Български) (page does not exist)">Български</a> –
[Русский](Tutorial:Callback_Functions_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9) "Tutorial:Callback Functions (Русский)") –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(%D0%A1%D1%80%D0%BF%D1%81%D0%BA%D0%B8)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (Српски) (page does not exist)">Српски</a> –
[Українська](Tutorial:Callback_Functions_(%D0%A3%D0%BA%D1%80%D0%B0%D1%97%D0%BD%D1%81%D1%8C%D0%BA%D0%B0) "Tutorial:Callback Functions (Українська)") –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(%D7%A2%D7%91%D7%A8%D7%99%D7%AA)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (עברית) (page does not exist)">עברית</a> –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(%E0%B9%84%E0%B8%97%E0%B8%A2)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (ไทย) (page does not exist)">ไทย</a> –
[日本語](Tutorial:Callback_Functions_(%E6%97%A5%E6%9C%AC%E8%AA%9E) "Tutorial:Callback Functions (日本語)") –
<a
href="/w/index.php?title=Tutorial:Callback_Functions_(%E6%AD%A3%E9%AB%94%E4%B8%AD%E6%96%87)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Callback Functions (正體中文) (page does not exist)">正體中文</a> –
[简体中文](Tutorial:Callback_Functions_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87) "Tutorial:Callback Functions (简体中文)") –
[Tiếng
Việt](Tutorial:Callback_Functions_(Ti%E1%BA%BFng_Vi%E1%BB%87t) "Tutorial:Callback Functions (Tiếng Việt)") –
[한국어](Tutorial:Callback_Functions_(%ED%95%9C%EA%B5%AD%EC%96%B4) "Tutorial:Callback Functions (한국어)")  
*[More
info](Help:i18n "Help:i18n")*
