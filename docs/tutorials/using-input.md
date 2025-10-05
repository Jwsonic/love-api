# Using Input Tutorial

> This tutorial was imported from the [LÖVE Wiki](https://love2d.org/wiki/Tutorial:Using_Input).

---

# Tutorial:Using Input

Capturing input events with LÖVE is really easy; in this
[tutorial](Category:Tutorials "Category:Tutorials") we'll cover
how to capture keyboard and mouse events using both object methods and
[callbacks](Category:Callbacks "Category:Callbacks"). We'll start
our tutorial by putting together an almost empty LÖVE program:

    local text

    function love.load()
       love.graphics.setNewFont(12)
       text = "Nothing yet"
    end

    function love.update(dt)

    end

    function love.draw()
       love.graphics.print( text, 330, 300 )
    end

## Capturing keyboard events

The easiest way to know if the user is pressing a key is calling the
[`love.keyboard.isDown`](love.keyboard.isDown "love.keyboard.isDown")
method, which has the following syntax:

    love.keyboard.isDown( key )

The key parameter is a string representing the key we want to see if
it's currently pressed. A simple example:

    if love.keyboard.isDown( " " ) then
       text = "The SPACE key is held down!"
    end

You can find the complete list of keys
[here](KeyConstant "KeyConstant"). The best place to perform this
check is inside the [`love.update`](love.update "love.update")
[callback](Category:Callbacks "Category:Callbacks"): that way
we're able to get input from the user and update our variables before
drawing our stuff into the screen. So, our modified
[`love.update`](love.update "love.update") callback should look
like this:

    function love.update(dt)
       if love.keyboard.isDown( " " ) then
          text = "The SPACE key is held down!"
       end
    end

While this is fine and dandy if we only need to know which key or keys
are currently pressed, we might also need to specify different behaviors
when a certain key is pressed and/or released. An elegant way of doing
this is using the keyboard callbacks
[`love.keypressed`](love.keypressed "love.keypressed") and
[`love.keyreleased`](love.keyreleased "love.keyreleased"). They
work in a similar way of the already known
[`love.update`](love.update "love.update") or
[`love.draw`](love.draw "love.draw") callbacks, executing our code
every time that event is triggered. For example:

    function love.keypressed( key )
       if key == "return" then
          text = "RETURN has been pressed!"
       end
    end

    function love.keyreleased( key )
       if key == "return" then
          text = "RETURN has been released!"
       end
    end

As you can see, these two callbacks will provide you a key variable
which you can use to check if a given key has been pressed, released or
both. Up to this point, our source file should look like this:

    function love.load()
        love.graphics.setFont(12)
        text = "Nothing yet"
    end

    function love.update(dt)
       if love.keyboard.isDown( " " ) then
          text = "The SPACE key is held down!"
       end
    end

    function love.draw()
          love.graphics.print( text, 330, 300 )
    end

    function love.keypressed( key )
       if key == "return" then
          text = "RETURN is being pressed!"
       end
    end

    function love.keyreleased( key )
       if key == "return" then
          text = "RETURN has been released!"
       end
    end

## Capturing mouse events

So, we already know how to interact with our users through a keyboard.
But what about that little rodent that sits on their desks? Well, mouse
input works in a fairly similar way: we have a
[`love.mouse.isDown`](love.mouse.isDown "love.mouse.isDown")
method and the
[`love.mousepressed`](love.mousepressed "love.mousepressed") and
[`love.mousereleased`](love.mousereleased "love.mousereleased")
callbacks. Let's add a few lines to our
[`love.update`](love.update "love.update") callback:

    if love.mouse.isDown("r") then
       text = "Right mouse button has been pressed"
    end

As you can see, it's very similar to the
[`love.keyboard.isDown`](love.keyboard.isDown "love.keyboard.isDown")
and, again, you can see the full list of mouse-related parameters
[here](MouseConstant "MouseConstant"). You can even check if the
mouse wheel has been rolled up or down using this method. We also have
two handy methods to know the current position of the mouse pointer
inside our game window:
[`love.mouse.getX`](love.mouse.getX "love.mouse.getX") and
[`love.mouse.getY`](love.mouse.getY "love.mouse.getY"). Each one
will return the current coordinate of the mouse pointer. Let's see an
example by adding these line to the beginning of our `love.update`
callback:

    mouse_x = love.mouse.getX()
    mouse_y = love.mouse.getY()

And this line to our `love.draw` callback:

    love.graphics.print( "Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y, 10, 20 )

The [`love.mousepressed`](love.mousepressed "love.mousepressed")
and
[`love.mousereleased`](love.mousereleased "love.mousereleased")
callbacks work in a very similar way as their keyboard counterparts:

    function love.mousepressed(x, y, button)
       if button == 1 then -- "Versions prior to 0.10.0 use the MouseConstant 'l'"
          text = "Left mouse button has been pressed"
       end
    end

    function love.mousereleased(x, y, button)
       if button == 1 then -- "Versions prior to 0.10.0 use the MouseConstant 'l'"
          text = "Left mouse button has been released"
       end
    end

A cool feature of this callback is that you can know not only if a
button has been pressed but also the position of the mouse pointer when
the user pressed the button. This can be really useful if you need to
put together some basic user interface elements like buttons or other
objects that can interact with the mouse. A simple example:

    function love.mousepressed(x, y, button)
       if button == 'l' then
          text = "Left mouse button has been pressed at X:"..x.." Y: "..y
       end
    end

Finally, we have another two useful mouse-related methods:
[`love.mouse.setVisible`](love.mouse.setVisible "love.mouse.setVisible")
and
[`love.mouse.isVisible`](love.mouse.isVisible "love.mouse.isVisible").
The first one will let you hide or show the mouse pointer and the second
one will obviously let you know if the mouse pointer is visible or not.
Let's add even more code to our
[`love.keypressed`](love.keypressed "love.keypressed") callback:

    if key == 'h' then
       if love.mouse.isVisible() then
          love.mouse.setVisible(false)
       else
          love.mouse.setVisible(true)
       end
       -- OR:
       -- love.mouse.setVisible(not love.mouse.isVisible())
    end

In these few lines we check if the mouse pointer is visible or not and
then we change its visibility: if it's visible we hide it and if it's
already hidden we then show it. Fairly easy, isn't it?

  

## Other Languages

<a
href="/w/index.php?title=Tutorial:Using_Input_(Dansk)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Dansk) (page does not exist)">Dansk</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(Deutsch)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Deutsch) (page does not exist)">Deutsch</a> –
English – <a
href="/w/index.php?title=Tutorial:Using_Input_(Espa%C3%B1ol)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Español) (page does not exist)">Español</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(Fran%C3%A7ais)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Français) (page does not exist)">Français</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(Indonesia)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Indonesia) (page does not exist)">Indonesia</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(Italiano)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Italiano) (page does not exist)">Italiano</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(Lietuvi%C5%A1kai)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Lietuviškai) (page does not exist)">Lietuviškai</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(Magyar)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Magyar) (page does not exist)">Magyar</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(Nederlands)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Nederlands) (page does not exist)">Nederlands</a> –
[Polski](Tutorial:Using_Input_(Polski) "Tutorial:Using Input (Polski)") –
[Português](Tutorial:Using_Input_(Portugu%C3%AAs) "Tutorial:Using Input (Português)") –
<a
href="/w/index.php?title=Tutorial:Using_Input_(Rom%C3%A2n%C4%83)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Română) (page does not exist)">Română</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(Slovensk%C3%BD)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Slovenský) (page does not exist)">Slovenský</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(Suomi)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Suomi) (page does not exist)">Suomi</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(Svenska)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Svenska) (page does not exist)">Svenska</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(T%C3%BCrk%C3%A7e)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Türkçe) (page does not exist)">Türkçe</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(%C4%8Cesky)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Česky) (page does not exist)">Česky</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(%CE%95%CE%BB%CE%BB%CE%B7%CE%BD%CE%B9%CE%BA%CE%AC)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Ελληνικά) (page does not exist)">Ελληνικά</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(%D0%91%D1%8A%D0%BB%D0%B3%D0%B0%D1%80%D1%81%D0%BA%D0%B8)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Български) (page does not exist)">Български</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Русский) (page does not exist)">Русский</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(%D0%A1%D1%80%D0%BF%D1%81%D0%BA%D0%B8)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Српски) (page does not exist)">Српски</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(%D0%A3%D0%BA%D1%80%D0%B0%D1%97%D0%BD%D1%81%D1%8C%D0%BA%D0%B0)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Українська) (page does not exist)">Українська</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(%D7%A2%D7%91%D7%A8%D7%99%D7%AA)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (עברית) (page does not exist)">עברית</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(%E0%B9%84%E0%B8%97%E0%B8%A2)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (ไทย) (page does not exist)">ไทย</a> –
[日本語](Tutorial:Using_Input_(%E6%97%A5%E6%9C%AC%E8%AA%9E) "Tutorial:Using Input (日本語)") –
<a
href="/w/index.php?title=Tutorial:Using_Input_(%E6%AD%A3%E9%AB%94%E4%B8%AD%E6%96%87)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (正體中文) (page does not exist)">正體中文</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (简体中文) (page does not exist)">简体中文</a> –
<a
href="/w/index.php?title=Tutorial:Using_Input_(Ti%E1%BA%BFng_Vi%E1%BB%87t)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (Tiếng Việt) (page does not exist)">Tiếng
Việt</a> – <a
href="/w/index.php?title=Tutorial:Using_Input_(%ED%95%9C%EA%B5%AD%EC%96%B4)&amp;action=edit&amp;redlink=1"
class="new"
title="Tutorial:Using Input (한국어) (page does not exist)">한국어</a>  
*[More
info](Help:i18n "Help:i18n")*
