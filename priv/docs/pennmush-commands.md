# PennMUSH Commands

Taken from [here](http://dynamix.xidus.net/penncmd.htm).

``` text
"
:
;
@-ATTRIBUTES
@-BUILDING
@-GENERAL
@-WIZARD
@@
@aahear
@aclone
@aconnect
@adeath
@adescribe
@adestroy
@adisconnect
@adrop
@aefail
@aenter
@afailure
@afollow
@agive
@ahear
@aidescribe
@aleave
@alfail
@alias
@allhalt
@allquota
@amhear
@amove
@apayment
@areceive
@asuccess
@atport
@atrchown
@atrlock
@attribute
@aufail
@aunfollow
@ause
@away
@boot
@charges
@chown
@chownall
@chzone
@chzone2
@chzoneall
@clone
@command
@comment
@config
@conformat
@cost
@cpattr
@create
@dbck
@death
@decompile
@decompile2
@decompile3
@describe
@destroy
@destroy2
@dig
@dig2
@disable
@doing
@dolist
@drain
@drop
@dump
@ealias
@edit 	@efail
@elock
@emit
@enable
@enter
@entrances
@eunlock
@exitformat
@failure
@filter
@filter2
@find
@firstexit
@follow
@force
@force2
@function
@function2
@function3
@gedit
@give
@grep
@grep2
@halt
@haven
@hide
@idescribe
@idle
@infilter
@inprefix
@kick
@lalias
@leave
@lemit
@lfail
@link
@list
@listen
@listen2
@listmotd
@lock
@lock2
@lock3
@lock4
@lock5
@lock6
@lock7
@lock8
@log
@logwipe
@map
@map2
@motd
@move
@mvattr
@name
@nameformat
@newpassword
@notify
@nuke
@odeath
@odescribe
@odrop
@oefail
@oemit
@oenter
@ofailure
@ofollow
@ogive
@oidescribe
@oleave
@olfail
@omove 	@opayment
@open
@oreceive
@osuccess
@otport
@oufail
@ounfollow
@ouse
@oxenter
@oxleave
@oxmove
@oxtport
@parent
@password
@payment
@pcreate
@pemit
@pemit2
@poll
@poor
@power
@prefix
@ps
@purge
@quota
@readcache
@receive
@recycle
@rejectmotd
@remit
@restart
@runout
@rwall
@rwallemit
@rwallpose
@scan
@search
@search2
@search3
@select
@set
@set2
@set3
@sex
@shutdown
@sitelock
@sitelock2
@sitelock3
@squota
@startup
@stats
@success
@sweep
@switch
@switch2
@teleport
@tport
@trigger
@trigger2
@ufail
@ulock
@undestroy
@unfollow
@unlink
@unlock
@unrecycle
@uptime
@use
@uunlock
@verb
@verb2
@verb3
@verb4 	@version
@wait
@wall
@wallemit
@wallpose
@warnings
@warnings2
@warnings3
@wcheck
@whereis
@wipe
@wizemit
@wizmotd
@wizpose
@wizwall
@zemit
COMMANDS
DOING
INFO
LOCKING
LOCKS
LOGOUT
QUIT
SESSION
WHO
\
ahelp
anews
brief
cd
ch
drop
enter
events
examine
follow
get
give
go
goto
index
inventory
kill
leave
lock list
lock types
locklist
locktypes
locktypes2
look
look2
move
news
page
page2
pose
pose2
read
rules
say
score
semipose
slay
take
teach
think
unfollow
use
whisper
whisper2
with

COMMANDS
Help is available for the following MUSH commands:
 
  ahelp          anews          brief          DOING          drop
  examine        enter          events         follow         get            
  give           go             index          kill           leave          
  LOGOUT         look           move           news           page           
  pose           QUIT           read           rules          say
  score          slay           take           teach          think          
  unfollow       use            whisper        WHO            with
  "              :              ;              +
 
  In addition to these, there are several types of '@' commands. @-commands 
  are usually commands which have permanent effects on the MUSH (such as
  creating a new object). Here are the help topics on @-commands:
 
  @-ATTRIBUTES   @-BUILDING     @-GENERAL      @-WIZARD
 
[Top]

@-ATTRIBUTES
These '@' commands set standard attributes on objects:
  
  @aahear        @aclone        @aconnect      @adeath        @adescribe    
  @adisconnect   @aefail        @aenter        @afailure      @aidescribe   
  @afollow       @ahear         @aleave        @alfail        @amhear       
  @amove         @apayment      @asuccess      @atport        @aufail
  @aunfollow     @ause          @away          @charges       @cost          
  @conformat     @death         @describe      @drop          @ealias        
  @efail         @enter         @exitformat    @failure       @filter        
  @follow        @haven         @idescribe     @idle          @infilter      
  @inprefix      @lalias        @leave         @lfail         @listen        
  @move          @nameformat    @odeath        @odescribe     @oidescribe    
  @odrop         @oefail        @oenter        @ofailure      @ofollow       
  @oleave        @olfail        @omove         @opayment      @osuccess      
  @otport        @oufail        @ounfollow     @ouse          @oxenter       
  @oxleave       @oxmove        @oxtport       @payment       @prefix        
  @runout        @sex           @startup       @success       @tport         
  @ufail         @unfollow      @use          

See also: ATTRIBUTES, NON-STANDARD ATTRIBUTES
  
[Top]

@-BUILDING
These '@' commands are building-related (they create or modify objects):
 
  @atrlock       @atrchown      @chown         @chzone        @clone         
  @cpattr        @create        @destroy       @dig           @elock         
  @eunlock       @firstexit     @link          @lock          @mvattr        
  @name          @nuke          @open          @parent        @recycle       
  @set           @undestroy     @ulock         @unlink        @unlock        
  @uunlock       @wipe
  
[Top]

@-GENERAL
These '@' commands are general utility and programming commands:

  @@             @alias         @channel       @chat          @cemit
  @command       @config        @decompile     @doing         @dolist
  @drain         @edit          @emit          @entrances     @find       
  @force         @function      @gedit         @grep          @halt
  @lemit         @listmotd      @mail          @map           @notify
  @oemit         @password      @pemit         @ps            @remit         
  @restart       @rwall         @rwallemit     @rwallpose     @scan          
  @search        @select        @stats         @sweep         @switch        
  @teleport      @trigger       @verb          @version       @wait          
  @whereis       @zemit

[Top]

@-WIZARD
These '@' commands are only usable by wizards or privileged players:
 
  @allhalt       @allquota      @boot          @chownall      @chzoneall
  @comment       @dbck          @disable       @dump          @enable
  @hide          @kick          @log           @motd
  @newpassword   @pcreate       @poll          @poor          @power
  @purge         @quota         @readcache     @rejectmotd    @shutdown
  @sitelock      @squota        @uptime        @wall
  @wallemit      @wallpose      @wizemit       @wizmotd       @wizpose
  @wizwall       cd             ch
 
[Top]

@@
 
  The "@@" command is a special kind of command; it signals the start
  of a comment. The comment lasts until a semi-colon is found, just
  like other MUSH programming statements terminate with a semi-colon.
  It cannot be put into the middle of a statement, like
  @va me = $testing:@emit Test. @@ Just a test @@; @vb me=Testing.
  That will result in the object emitting "Test. @@ Just a test. @@"
  The correct usage is to make the comment a statement by itself:
  @va me = $testing:@emit Test.; @@ Just a test @@; @vb me=Testing.
 
  It is not necessary to use a closing '@@', but doing so makes the
  comment stand out much more clearly. A space between the first
  '@@' and the word following it is not necessary.
[Top]

@aahear
  @aahear <object> = <action list>

  An aahear on an object is activated whenever the object's listen pattern 
  is matched by anything done/said by either anything else in the room OR 
  the object itself. In contrast, an ahear on an object cannot be activated 
  by anything the object itself does.

See also: @listen, @ahear, @amhear, LISTENING
[Top]

@aclone
  @aclone <object> = <action list>

  Sets the actions to be taken whenever <object> is @cloned. This command 
  can be useful for notifying the owner of a vending machine or parent 
  object when someone uses the machine.

  Please note that there is no @oclone, and that @clone is always a
  command, not an attribute.

See also: @clone, @create, ACTION LISTS
[Top]

@aconnect
  @aconnect <object> = <action list>

  Sets the actions to be taken by a player right after connecting to
  the game.

  Example: @aconnect me = :stretches luxuriously, as if waking from a nap.

  Note that long and spammy @aconnect messages, whether in your room or
  on a channel, are frequently found annoying by other players.

  The player's location, and zone object/objects in the zone parent
  room of the location, as well as objects in the master room, are
  also checked for an @aconnect. If one is found, it will be executed
  when a player connects in that location or zone (or, in the case of
  the master room, anywhere).

See also: @adisconnect, ACTION LISTS
[Top]

@adeath
  @adeath <object> = <action list>

  Sets the actions to be taken after <object> is killed. 
 
See also: @odeath, @death, kill, BEING KILLED, ACTION LISTS
[Top]

@adescribe
  @adescribe <object> = <action list>
  
  Sets the actions to be taken when  <object> is looked at. 
  A common use of this command is:

    @adesc me=think %N just looked at you.

  which will inform you whenever someone looks at you. %N will be 
  replaced by the name of the person who looked. While it is possible to
  set a message to be broadcasted to everyone in the area when someone
  looks at you, this is strongly discouraged, as many people find it 
  annoying.

See also: @describe, @aidescribe, look, SUBSTITUTION, ACTION LISTS
[Top]

@adestroy
  @adestroy <object> = <action list>

  Sets the actions to be taken by the object when it is destroyed
  (via @rec or @nuke). This can only be set by a Wizard.
  If @adestroy doesn't work, try &adestroy. :)
[Top]

@adisconnect
  @adisconnect <object> = <action list>

  Sets the actions to be taken by a player right after disconnecting
  from the game.

  Example: @adisconnect me = home

  The player's location, and zone object/objects in the zone parent
  room of the location, as well as objects in the master room, are
  checked for an @adisconnect. If one is found, it will be executed
  when a player disconnects in that location or zone (or, in the case of
  the master room, anywhere).

See also: @aconnect, ACTION LISTS
[Top]

@adrop
  @adrop <object> = <action list>

  Sets the actions to be taken when <object> is dropped. 
  If <object> is an exit, sets an action to be done after a player
  has passed through the exit.

See also: @odrop, @drop, drop, ACTION LISTS
[Top]

@aefail
  @aefail <object> = <action list>

  Sets the actions to be taken by the object when someone fails to enter
  it.

See also: enter, FAILURE, ACTION LISTS
[Top]

@aenter
  @aenter <object> = <action list>

  Sets the actions taken by the object whenever someone enters it.

See also: @enter, @oenter, enter, ACTION LISTS
[Top]

@aufail
[Top]

@oufail
[Top]

@ufail
  @ufail <object> = <message>
  @oufail <object> = <message>
  @aufail <object> = <action>

  Sets message shown to a player who fails to use an object via
  the 'use' command (@ufail), message shown to others in the room
  (@oufail), and action for the object to take (@aufail).

  Note that these attributes are @ufail, NOT @ufailure, for
  TinyMUSH compatibility.

[Top]

@afailure
  @afailure <object> = <action list>

  Sets the actions to be taken on failure to pass the @lock on an
  object. For players and things, this means failure to pick them up
  with get/take. For exits, this means failure to go through an exit.
  
  May be abbreviated @afail. 

See also: @fail, @ofail, get, EXITS, @lock, ACTION LISTS
[Top]

@afollow
  @afollow <object> = <action list>

  Sets the actions to be taken after someone or something begins 
  following the object. 

See also: follow, unfollow, followers(), @follow, @ofollow, ACTION LISTS
[Top]

@aunfollow
  @aunfollow <object> = <action list>

  Sets the actions to be taken after someone or something stops 
  following the object. 

See also: follow, unfollow, followers(), @unfollow, @ounfollow, ACTION LISTS
[Top]

@ahear
  @ahear <object> = <actions>

  Sets the actions to be taken after the object's @listen is matched. 
  Note that @ahear ignores any messages that the object itself creates, 
  so it can only be triggered by other things. If you want the object to
  be able to trigger itself, try using @amhear or @aahear.
  
See also: @aahear, @amhear, @listen, ACTION LISTS, LISTENING
[Top]

@aleave
  @aleave <object> = <action list>

  Sets the actions to be taken whenever someone leaves the object.

See also: leave, @leave, @oleave, ACTION LISTS
[Top]

@alfail
  @alfail <object> = <action list>

  Sets the actions to be taken whenever someone tries to leave the 
  object and fails (because the object is set NO_LEAVE or because
  the person fails the @lock/leave on the object). 

See also: leave, @lfail, @olfail, ACTION LISTS
[Top]

@alias
  @alias <player>=<alias>
 
  @alias is a special attribute. When a player sets an @alias, he is
  effectively giving himself a secondary name; he can be paged by his
  @alias, and matched with *<alias>, and all other game functions which
  look up player names will also accept the alias. The attribute is
  visible to all players.
  
  Aliases cannot be longer than the limit allowed for player names, 
  cannot contain spaces, and must be unique -- no other player may
  have the same alias or name as any other player's alias or name.
[Top]

@allhalt
  @allhalt

  This command halts all objects in the game in an effort to free up 
  the queue. Wizard-only command.
  
  This command is equivalent to "@halt/all".

See also: QUEUE, @ps
[Top]

@allquota
  @allquota[/quiet] [<limit>]

  This is a God level command that is only available if the quota
  system is being used.  It displays the current max and owned objects
  of every player (unless the /quiet switch is used) and resets their 
  quota left to the new limit minus the current number owned if a limit 
  is given.
[Top]

@amhear
  @amhear <object> = <action list>

  Sets the actions to be taken whenever the @listen on the object is
  matched by something that the object itself does. It will not react
  if anyone else in the area does anything that matches the @listen
  pattern. If you want other objects to be able to set off the action
  list, try using @ahear or @aahear.

See also: @listen, @ahear, @aahear, LISTENING, ACTION LISTS
[Top]

@amove
  @amove <object> = <action list>

  This is the action to be taken whenever an object moves.

See also: @move, @omove, @oxmove, ACTION LISTS, go
[Top]

@apayment
  @apayment <object> = <action list>

  Sets the actions to be taken after a player gives an object some
  amount of pennies. 

See also: give, @pay, @opay, @cost, MONEY, ACTION LISTS
[Top]

@atport
  @atport <object>=<action list>

  Sets the list of actions that <object> will perform when it is
  teleported. These actions are done after <object> has arrived
  in its new location.

See also: @tel, ACTION LISTS
[Top]

@atrchown
  @atrchown <object>/<attribute> = <new_owner>.
  Like @chown except it changes the control of an attribute from one person
  to another.. You may only @atrchown attributes that you currently own.

See also: @atrlock, ATTRIBUTES, NON-STANDARD ATTRIBUTES
[Top]

@atrlock
  @atrlock <object>/<attribute> = [on|off].
  If 'on' is specified, it 'locks' the specified attribute on the object
  if it is unlocked already.  If the attribute is unlocked, and owned by
  someone other than you, you will gain ownership of it.  If an attribute
  is unlocked, then anyone who controls the object or the person who
  controls the attribute may change it.  Wizards may lock/unlock anyones
  attributes (but will not transfer ownership).  If you specify 'off' it
  will unlock a locked attribute. Specifying neither will return the
  current value of the lock.

See also: @atrchown, ATTRIBUTES, NON-STANDARD ATTRIBUTES
[Top]

@asuccess
  @asuccess <object> = <action list>

  Sets the actions to be taken when the @lock of an object is passed.
  For things/players, this means picking them up. For exits, this means
  going through them. 

See also: @success, @osuccess, get, @lock, EXITS, ACTION LISTS
[Top]

@attribute
  @attribute <attrib>
  @attribute/access[/retroactive] <attrib> = <permission list>
  @attribute/delete <attrib>
  @attribute/rename <attrib> = <new name>

  @attribute is a wizard-only command which modify's the MUSH's
  table of standard attributes (use @list/attribs to list them).
  A standard attribute is one that can be set with @<attrib> instead
  of &<attrib>, and which, when set, has a predefined set of
  initial permissions.

  *** Unlike TinyMUSH, changes to the PennMUSH attribute table
  *** are not saved across shutdowns. Use these commands from
  *** God's @startup to insure they are run at each startup.

  Used without switches, @attribute shows info about a standard attrib.

  @attribute/access adds a new standard attribute into the table,
  associating it with the given space-separated list of permissions.
  See 'help @set' for possible permissions.
  If the /retroactive switch is added, the permissions are applied
  to all objects in the database which have the attribute set already.

  @attribute/delete removes a standard attribute from the table.
  @attribute/rename renames a standard attribute. 
[Top]

@ause
  @ause <object> = <action list>

  Sets the actions to be taken when an object is successfully "used".
  
See also: use, @use, ACTION LISTS
[Top]

@away
  @away <player> = <message>

  This message is sent to a player who tries to page you when you are
  not connected, if it evaluates to something non-null.

  Example: @away me=I'm not here, please send me @mail instead.

[Top]

@boot
  @boot <player>
  @boot/port <descriptor number>
  @boot/me

  Disconnects the player from the game. 

  The /port switch takes a descriptor number instead (the "Port" number
  in WHO for wizards).

  The /me switch boots any single descriptor for the same player which
  has been idle for at least 1 minute. Players can use this command
  to terminate hung connections.

  Only admin and those with the "boot" power can @boot other players. 

[Top]

@charges
  @charges <object> = <integer>

  Allows you to limit the number of times an object can be "used". 
  The "charges" attribute will be decreased by one each time the
  object's @ause is triggered, and once it reaches zero, the object 
  cannot be used anymore.

See also: use, @runout, @ause
[Top]

@chown
  @chown[/preserve] <object>=<player>

  Changes the ownership of <object> to <player>. You can chown things,
  rooms, or exits. To chown a thing, you have to be carrying it. 
  If you do not own an object, you can only chown it if it is CHOWN_OK.
  If you're not a Wizard, you can only @chown objects to yourself or
  to a Zone Master whose zone-lock you pass.

  Normally, @chown'ing an object clears privileged flags and powers,
  and sets the object halt.  Wizards may use @chown/preserve to chown
  an object, preserving these privileges and not setting the object
  halt. Doing this to an active object with queued commands is not
  recommended, and may have strange and insecure effects.

  Examples:
    (for a room)    @chown here=me
    (for an object) @chown box=Soundwave
  
  Players can't be @chowned; they always own themselves.

See also: CHOWN_OK, Zone Masters
[Top]

@chownall
  @chownall <player> [= <target_player>]

  Transfers ownership of all the objects that the player owns to 
  <target_player>. If the target player is not included, then all 
  the objects are chowned to the person executing the command. 
  This is a wizard-only command.

See also: @chown
[Top]

@chzone
  @chzone <object>=<zone object> 
  @chzone <object>=none

  The first form of this command changes the ZONE of <object> to
  <zone object>. This puts the object on that zone and allows anyone
  who passes the zone-lock of the zone object to make changes to the
  object. Any kind of object can be @chzoned, but exits cannot be used
  as zone objects. 

  The second form of this command resets the zone of <object> to *NOTHING*.
  Anyone can reset the zone of an object s/he owns.

  If a player is @chzoned, anything s/he makes afterwards will start out
  with that Zone, but none of the objects that s/he presently owns will
  have their Zone changed. Players can @chzone themselves to an object if
  they own it. Otherwise, only wizards can @chzone players.

(continued in help @chzone2)
[Top]

@chzone2

  To see the Zone of an object, you can use either 'brief' or 'examine'
  to examine it. The Zone is listed on the same line as the Owner of
  the object.

  Players can @chzone objects if they own both the object and the zone
  object. Wizards can @chzone objects to any zone object as long as the
  object has a zone-lock. 
  
  Whenever an object besides a player is @chzoned to a zone object, 
  the WIZARD, ROYALTY, and INHERIT flags will be reset, as will all
  @power's (for security purposes). For similar reasons, it is strongly 
  recommended that you do not @chzone admin- or wizard-owned objects to 
  any zone that less privileged players have access to.

See also: ZONES, @chzoneall
[Top]

@chzoneall
  @chzoneall <player>=<zone object>

  Changes the zone of all objects owned by <player> to <zone object>. 
  If <zone object> is "none", the zone is reset to NOTHING. Only wizards 
  may use this command.
  
See also: @chzone, ZONES
[Top]

@clone
  @clone <object or exit>
  @clone/preserve <object or exit>

  For objects, creates an exact duplicate of it and puts it in the
  current room. For exits, it creates an exact duplicate of that
  exit, except the clone's source is the current room rather than
  whatever the original exit's source was.

  If creation times are enabled, a clone will have a different creation
  time than the object it was cloned from, but will have the same
  modification time, to make tracking revisions of code easier.

  A wizard may use @clone/preserve, which has the effect of preserving
  all the bits, powers, and warnings of the original object.

See also: @create
[Top]

@command
  @command <command>
  @command/<switch> <command>

  @command provides information about and controls the availability 
  of other commands.

  With no switches, @command shows all sorts of interesting information
  about how a command is parsed.

  Switches include:
  /disable   : Disable the <command>
  /off       : Synonym for /disable
  /enable    : Enable the <command>
  /on        : Synonym for /enable
  /quiet     : Don't make noisy output when doing one of the above
[Top]

@comment
  @comment <object> = <comment>

  This is a wizard-only command which sets a COMMENT attribute on
  <object>. The comment can only be seen by other wizards and royalty.
[Top]

@config
  @config/functions
  @config/commands
  @config/attribs
  @config/list [<option|option-type>]
  @config/set option=value
  
  This command lists the MUSH configuration parameters, indicating what
  special things are enabled, and the cost of certain commands.
  Switches include:

  /functions  --   Lists all functions.
  /commands   --   Lists all commands.
  /attribs    --   Lists all standard attributes.
  /list	      --   Lists the value of a particular <option> or <option-type>
                   if given one; lists the option-types if not.
  /set        --   Wizard only, changes parameters from the mush.
[Top]

@conformat
  @conformat <object> [=<format>].

  Replaces the usual "Contents:" or "Carrying:" format when an object
  is looked at, by a player-specified contents format. This is evaluated
  as if it were a description or other similar message on the room.
  The objects that the looker would normally be able to see is passed
  as a dbref list in %0; all contents can be aquired through 'lcon(me)'.
 
  One could change the format to 'Contents: Object1 Object2 Object3'
  through '@conformat here = Contents: [iter(%0,name(##))]',
  for example. More complex things are, obviously, possible.
 
  See also: @exitformat, @nameformat
[Top]

@nameformat
  @nameformat <object> [=<format>]

  Customizes the usual display of the object's name to people who
  are inside it and 'look'. It is evaluated as if it were a description
  or similar message on the room. The room's dbref is passed as %0.

  Example: Show the room's zone after its name.
  @nameformat here = [name(%0)] [if(isdbref(zone(%0)),<[name(zone(%0))]>)]

  See also: @exitformat, @conformat
[Top]

@cost
  @cost <object> = <amount> 

  This sets the number of pennies that need to be given to an object to
  trigger its @pay/@opay/@apay attributes. 

  Example:
    @cost exit-machine=10
    @apay exit-machine=@open %N-exit 
    @pay exit-machine=Your exit has been created.  
 
    give exit-machine=10
    > Your exit has been created.
    (The exit will also have been opened by the machine.)

See also: give, MONEY, @pay, money()
[Top]

@cpattr
[Top]

@mvattr
  @cpattr <obj>/<attr> = <obj1>[/<attr1>] [,<obj2>/<attr2>,<obj3>/<attr3>,...]
  @mvattr <obj>/<attr> = <obj1>[/<attr1>] [,<obj2>/<attr2>,<obj3>/<attr3>,...]
  
  @cpattr copies an attribute from one object to another, or several 
  others. @mvattr does the same thing, except it also removes the original
  attribute from the original object.

  For example:
    @cpattr box/test = box/test1, cube/random, tribble/describe

  would check the object "box" for an attribute named TEST and then
  copy it to the attributes TEST1 on "box", RANDOM on the object named
  "cube", and DESCRIBE on the object named "tribble".

  If you leave out the destination attribute, the attribute is copied
  to one of the same name on the new object. For example:
    @cpattr box/test=cube
  would copy the TEST attribute from "box" to TEST on "cube".

See also: ATTRIBUTES, NON-STANDARD ATTRIBUTES
[Top]

@create
  @create <name> [=<cost>]

  Creates a thing with the specified name. Creating an object costs
  a certain amount of MUSH money, which usually defaults to 10 pennies.
  You can specify a higher cost if you wish, but not a lower one.
  This cost is refunded if you @destroy/@recycle the object.

  Once you have created an object, you can use it as a PUPPET, to store
  USER-DEFINED COMMANDS, or just as a prop. Some mushes choose to limit 
  the number of objects that players can create by setting a QUOTA.
 
  See also: give, @quota, MONEY
[Top]

@dbck
  @dbck
  This is a wizard only command.  It forces the database to perform a
  series of internal cleanup and consistency checks that normally run 
  approximately every 10 minutes:

  1. For every object, make sure its location, home, next, contents,
     parent, and zone fields are valid objects.
  2. Check for disconnected rooms that aren't set FLOATING
  3. For every exit, player, or thing, make sure there is exactly one
     way to reach it from a room by following the contents fields of
     non-exits, the next fields of non-rooms, and the exits fields of
     rooms.
  4. For every thing or player, make sure that it is in the contents
     list of its location. Make sure every exit is in the exits list
     of its location.

  @dbck no longer performs an @purge. The results of @dbck are written
  to the game's error log, and not reported to the Wizard.

[Top]

@death
  @death <player> [=<message>]

  This command sets the message displayed to the killer when <player>
  is kill'ed. Typing just '@death <player>' or '@death <player>=' 
  without a message will clear the currently set message.

  Example:
   @death me=You have just slain Cyclonus!

  Note that some mushes choose to disable the KILL command, which makes
  this attribute rather pointless.

See also: kill, BEING KILLED, @odeath, @adeath
[Top]

@decompile
  @decompile[</switch>] <object>[/<attribute-pattern>]
  @decompile/tf <object>/<attrib>

  This command produces a list of the commands that you would have to
  enter in order to recreate <object>. Useful for either copying objects
  from one MUSH to another, or for making logs of important objects to
  protect against an accidental @nuke or a crash.

  You can either @decompile an entire object, or just certain parts of it.
  To @decompile just a few attributes, for example, you could type:

      @decompile <object>/<attribute name>

  for each attribute. You can also use wildcards in <attribute name> to
  @decompile a list of similarly-named attributes.

(continued in help @decompile2)
[Top]

@decompile2
  @decompile takes five switches: /db, /flags, /attribs, /tf, /skipdefault
  Multiple switches may be usefully combined (other than /tf).

  @decompile/db
    This command makes @decompile use the object's DBREF # instead of its
    name, which is useful for editing code off-MUSH.
  @decompile/flags
    Only the code to @create the object and set its flags is printed.
  @decompile/attribs
    Only the code to set the object's attributes is printed.
  @decompile/skipdefault
    Don't output commands to set attribute flags if those flags are the
    defaults for that attribute on that MUSH.

(continued in help @decompile3)
[Top]

@decompile3

  @decompile/tf <object>/<attribute>

  The /tf switch is useful only for users of the popular "TinyFugue" 
  client program (available from ftp.tcp.com in the directory
  /pub/muds/Clients/tinyfugue). If you do have this program, this
  switch is invaluable for editing code online, because it will grab the 
  code to set that attribute and put it into your buffer.

  To use @dec/tf, first type this command into TinyFugue:

    /def -ag -mglob -p100 -t"FugueEdit > *" fe = /grab %-2

  (you can also put this into your .tfrc so it will automatically
  be entered every time you start TinyFugue (tf).) This command works
  just like the 'FugueEdit' object originally created by van@TinyTIM.

  You can use a string other than "FugueEdit > " by setting your
  TFPREFIX attribute. This is probably a good idea.
See also: CLIENTS, ATTRIBUTES, WILDCARDS, MUSHCODE
[Top]

@describe
  @describe <object> [=<description>]

  This command sets the description of the object, which will be seen 
  whenever something looks at the object with the command 'look <object>'.
  Every object should have a description, even if just a short one 
  describing its purpose. If the [=<description>] is left out, the desc.
  on the object will be reset to nothing. When you look at something that
  has no desc., you are told, "You see nothing special."

  @describe can be abbreviated as @desc

See also: look, @adescribe
[Top]

@destroy
[Top]

@recycle
[Top]

@nuke
[Top]

@undestroy
[Top]

@unrecycle
  @destroy[/override] <object>  OR   @recycle[/override] <object>
  @undestroy <object>           OR   @unrecycle <object>
  @nuke <object>

  NOTE: @destroy and @recycle are the same command - some MUSHes
  choose to use @recycle instead of @destroy to avoid the typo of
  '@dest obj' for '@desc obj'. Others use @destroy. @nuke is an alias
  for @dest/override.

  Recycles <object> and returns the player's investment (the cost of
  @create). You should always @destroy objects you no longer need;
  this keeps the database down to a manageable size.  When an object
  is @destroyed, it is set GOING, its queue is cleared and any
  semaphores are drained, and its ADESTROY attribute is immediately
  triggered. 

(continued in help @destroy2)
[Top]

@destroy2

  GOING objects are actually removed from the db approximately every
  10-20 minutes. Until then, you may use the @undestroy/@unrecycle
  command to abort the destruction sequence. If you @undestroy an
  object, its STARTUP attribute is triggered. If you @destroy a
  GOING object, it is purged immediately.

  Wizards may @nuke players. If the DESTROY_POSSESSION config option
  is set (see @config), destroying a player destroys all non-SAFE
  things the player owns, and @chowns SAFE things to God. If not,
  destroying a player @chowns all their objects to God.

See also: SAFE, GOING, DESTROY_OK  
[Top]

@dig
  @dig <room name> [= <exit name>;<exit alias>*,<exit name>;<exit alias>*]
  @dig/teleport
  
  This command is used to create a new room, possibly with exits linking
  it to the room you are standing in. This command normally costs 10 pennies,
  although some MUSHes may have different amounts or may restrict this 
  command to those with the builder @power.
  
  @dig/teleport will automatically @tel the digger to the new room.

  If you use the long form of this command, an exit to the new room
  from the one you are standing in and an exit back from the new room
  will both be automatically @open'ed and @link'ed. You may have as 
  many or as few exit aliases for an exit as you like, separated in the
  command by semicolons. The exit leading to the new room is separated
  from the exit leading back by a single comma.

(continued in help @dig2)
[Top]

@dig2
  Examples: 
  @dig Kitchen
    This command will create a new room named 'Kitchen'. You will be informed
    what the dbref # of this room is.

  @dig Kitchen = Kitchen <N>;n;north;kitchen;k
    This will create the room as above and also open an exit leading
    to it named "Kitchen <N>;n;north;kitchen;k". It will appear in the 
    list of Obvious exits as just "Kitchen <N>", but you will be able to
    go through it by typing any of the following: n, k, north, kitchen
    It will NOT create an exit coming back from the Kitchen room.

  @dig Kitchen = Kitchen <N>;n;north;kitchen;k,Out <S>;s;south;out;o
    This will do just the same as the above, except it will also create
    an exit named "Out <S>;s;south;out;o" coming back from the kitchen
    to whatever room you are currently in.
    
See also: @open, @link, EXITS, @create
[Top]

@doing
  @doing <message>
  @doing/header <message>

  This command sets a short message that shows up in the WHO/DOING listing
  next to your name. @doing/header <message> works exactly like @poll and
  can only be used by Wizards or those with the poll power.

See also: @poll, WHO, DOING
[Top]

@dolist
  @dolist[/notify][/delim] [<delim>] <list> = <action>
  
  @dolist executes the <action> for each element in <list>. If <list> is a
  function, it will be evaluated to obtain the necessary list to use. It
  may be any space-separated list of strings, which can be object numbers,
  attributes, or arbitary words. If the /delim switch is given, the first
  character of the list is used as the seperator, instead of space.
  
  <action> is a command or list of commands enclosed in braces { }
  and is performed once for every item in <list>. The special symbol "##"
  is replaced by the corresponding item from <list>.  The special symbol
  "#@" is replaced by the position of that item in the list.
 
  If the /notify switch is used, a "@notify me" is queued after all the
  list commands. This is useful for object synchronization with semaphores.
   
  Example: @dolist [lcon(here)] = "[name(##)]
    would cause you to say the name of all objects in the room.
[Top]

@drain
  @drain <object>
  
  This command discards all commands waiting on the semaphore <object>
  and resets the semaphore to its initial state (clearing the SEMAPHORE
  attribute). The pending commands are removed from the queue without
  being executed.
  
  See also the help for: SEMAPHORES, @notify, @wait
[Top]

@drop
  @drop <object> [=<message>]. <object> can be a thing, player, exit,
  or room, specified as <name> or #<number> or 'me' or 'here'. Sets 
  the drop message for <object>. The message is displayed when a 
  player drops <object>. Without  a message argument, it clears the 
  message. 

  On an exit, this message is sent to a player after they pass through
  the exit.

  See also: drop, @odrop, @adrop.
[Top]

@dump
  @dump [/paranoid] [check interval]
 
  This is a wizard only command that saves a copy of the current memory
  database out to a save file.  This preempts the normal regular dumping
  that the mud performs on its own.
 
  If the /paranoid switch is used, the game performs additional consistency
  checking which corrects possible data corruption. If a check interval
  is specified, the game writes confirmation of the dump to the checkpoint
  log file every <interval> objects. If no interval is specified, it is
  taken to be the size of the databased, divided by 5.
  This switch should ONLY be used if a normal @dump is not being done
  correctly. Paranoid dumps should generally only be done by wizards with 
  access to the account on which the MUSH is running, since others will
  not have access to the checkpoint logfile.
[Top]

@ealias
  @ealias <object> = <enter alias>

  This allows a player to type the enter alias instead of "enter <object>"
  If you have a chair, you coud "@ealias chair = sit down" and then just
  type "sit down" instead of "enter chair" - using the object name is
  not necessary. Note that the enter alias is checked after normal exits.
  Like an exit, it may have a semi-colon separated list of words,
  i.e. sit down;sit;sit on chair
[Top]

@edit
[Top]

@gedit
  @edit <object>/<pattern> = <search>,<replace> 
  @edit <object>/<pattern> = $,<string to append>
  @edit <object>/<pattern> = ^,<string to prepend>

  This is useful when you don't want to have to retype those obnoxiously 
  long descriptions just to make one little change.  Instead, search and 
  replace via @edit.  
  
  <pattern> is a pattern, optionally containing wildcards, for the attribute 
  names you wish to edit. Only attributes already defined on <object> may be 
  edited. <search> and <replace> are two strings. It's also possible to use 
  "$" and "^" to signal appending and prepending text, respectively.
  
  If the text contains commas, precent signs, or similar special characters,
  it usually must be enclosed in curly braces.
  
  See also ATTRIBUTES, edit()
[Top]

@efail
  @efail <object> = <message>
  This is the message shown to the player who fails to enter the object.
[Top]

@elock
  @elock <object> = <key>
  Enter-locks an object, restricting who is allowed to enter it. Special
  lock types are supported (see "help @lock" for details). Only objects
  which are ENTER_OK may be entered, regardless of the key.
 
  The enter lock of a room is its Teleport Lock. Only people who pass
  the room's teleport lock, are wizards or royalty, or control the room,
  will be allowed to @teleport into the room. (Note that this is different
  from NO_TEL, which prevents people from teleporting out of a room).
  The teleport lock is evaluated even if the room is JUMP_OK - in other 
  words, if you are trying to teleport into a room you don't control, the 
  room must be JUMP_OK, and you must pass the teleport lock.
 
  Note that the enter lock of an object or room being used as a Zone
  Master Object determines control of that zone. Please note that if
  you're using a room as a ZMO (i.e. as a zone master room), only the
  controllers of that zone will be able to teleport into that room
  (which is a good thing for security).
[Top]

\
[Top]

@emit
  @emit[/room][/silent] <message>
  @emit[/noeval] <message>
  \<message>

  This sends <message> to every person in the current room. However, no
  identifier marking it as being sent by you is shown.  For example,
  @emit foo would show 'foo' to every object in the room. 

  The /room switch makes this command equivalent to "@lemit". 
  The /silent switch in combination with /room supresses the
   @lemit confirmation. It has no effect without /room.
  The /noeval switch prevents the MUSH from evaluating the message.

  @emit can be abbreviated "\"

  See also @pemit, @remit, @oemit, @lemit, NOSPOOF and SPOOFING.
[Top]

@enable
[Top]

@disable
  @enable <parameter>
  @disable <parameter>
  
  These are wizard commands that allow certain parameters of the game to
  be changed at runtime. The values of these parameters are listed by the
  "@config" command. Parameters and their effects are as follows:
  
  logins       --  When logins are disabled, only wizards and royalty may
                   log into the game. Mortals attempting to log in will be
                   given the down text, as well as the @rejectmotd.
  guests       --  When guests are disabled, players can not log in as
                   guest characters.
  daytime      --  When daytime is enabled, computationally expensive commands
                   cannot be run. @find, @search, @entrances, LSEARCH(), and 
                   @dump cannot be used, although the automatic database save
                   routines will continue to run.
  command_log  --  When this is enabled, all commands are logged.
  huh_log      --  When this is enabled, all commands that produce a "Huh?"
                   are logged.
  force_log    --  When this is enabled, @forces done by wizards are logged.
  wall_log     --  When this is enabled, @walls are logged.
[Top]

@enter
  @enter <object> = <message>

  This sets the message that is displayed to anyone entering the 
  object. Works just as @success on an exit does.

  Example:
    @enter Chair = You sit down on the comfy chair.
    enter chair
    > You sit down on the comfy chair.

See also: @oenter, @oxenter, enter
[Top]

@entrances
  @entrances[/<switch>] <object> [=<begin>,<end>]
  
  This command will show you all exits linked to the object you use the
  command on, as well as where the exit originates.  This command is
  computationally expensive and costs the same as @find. You can limit
  the range of the dbrefs searched by specifying <begin> and <end>.
  
  It takes four switches:
  
  /exits       show only exits linked to <object>
  /things      show only things which have their homes in <object>
  /players     show only players who have their homes in <object>
  /rooms       show only rooms which have a drop-to of <object>
[Top]

@eunlock
  @eunlock <object>

  Enter-unlocks an object, in a fashion similar to @unlock. For anyone
  to be able to enter an object, it must be both @eunlocked and ENTER_OK.
  You can also simply type 
    @lock/enter <object> 
  to unlock an object.

See also: @lock, locktypes, @elock
[Top]

@exitformat
  @exitformat <object> [=<format>].

  Replaces the usual "Obvious Exits:" format when an object is looked
  at, by a player-specified exits format. This is evaluated as if it
  were a description or similar message on the room.  The objects that
  the looker would normally be able to see is passed as a dbref list
  in %0; all exits can be aquired through 'lexits(me)'.
 
  One could change the format to 'Exits: Exit1 Exit2 Exit3' through
  '@exitformat here = Exits: [iter(%0,name(##))]', for example.

  See also: TRANSPARENT, @conformat, @nameformat
[Top]

@failure
  @failure <object> [=<message>]

  Sets the message shown to someone who fails to pass the object's
  basic @lock. For a thing or player, this would be when someone tries
  to pick the object up and fails. For an exit, this occurs when someone
  tries to go through the exit and fails.

  If [=<message>] is omitted, any currently set message will be reset.

  Can be abbreviated @fail. It is recommended that you put an @fail message
  on any locked object.

See also: FAILURE, @ofailure, @afailure
[Top]

@firstexit
  @firstexit <name of exit>

  Makes the named exit the first in the listing of Obvious Exits in a
  room. You must control the room in order to use this command.

See also: EXITS, @open, @link
[Top]

@filter
  @filter <object> = <pattern 1>, <pattern 2>, <pattern 3>, ...
 
  This attribute is meant to be used in conjunction with the AUDIBLE
  flag. The @filter of an object is a comma-separated list of wildcard
  patterns (like @switch patterns). Any messages which match one of the 
  patterns is suppressed and not propagated through the AUDIBLE object
  with the @filter set. (Note: @filter on rooms has no effect!)
 
  Please note that you should NOT use curly brackets {} in an @filter
  pattern. Also note that AUDIBLE exits will not take effect unless the
  room they lead from is also set AUDIBLE.

  See 'help @filter2' for examples.
[Top]

@filter2
 
Example: 
  An exit leads from the room where Wizard is standing to another
  room where the puppet "Wiztoy" is standing. The exit is set AUDIBLE.
  
    @prefix exit=From inside,
    :tests.
    > Wizard tests.
    Wiztoy> From inside, Wizard tests.
    @filter exit=* jumps.,* tests.
    :jumps.
    > Wizard jumps.
    :tests.
    > Wizard tests.
  (Wiztoy doesn't hear anything, because it is filtered out.)
    :tests again.
    > Wizard tests again.
    Wiztoy> From inside, Wizard tests again.

See also: AUDIBLE, @infilter, LISTENING
[Top]

@find
  @find [<name>] [=<begin>,<end>]

  Displays the name and number of every room, thing, or
  player that you control whose name matches <name>. Because the
  command is computationally expensive, this costs 100 pennies.
  You can limit the range of the @find by specifying <begin> and
  <end>, where these are the first and last dbrefs to examine.

  Some MUSHes may choose to restrict @find only to Royalty. Even if 
  not, it is recommended that you use @search instead, as it can be
  limited more effectively.

See also: @search
[Top]

@follow
  @follow <object> = <message>

  Sets the message shown to someone after they begin following 
  the object (using the 'follow' command). 

See also: follow, unfollow, followers(), @ofollow, @afollow
[Top]

@unfollow
  @unfollow <object> = <message>

  Sets the message shown to someone after they stop following 
  the object (using the 'unfollow' command). 

See also: follow, unfollow, followers(), @ounfollow, @aunfollow
[Top]

@force
  @force[/noeval] <object>=<command>

  This forces the object to perform the command just as if it had
  typed it in itself. Only wizards may @force other players. You
  can @force any object which you own or control. Useful for
  manipulating puppets. If <object> is not in the same room as you,
  you can instead use the object's dbref number. 

  @force can be shortened to @fo or @for, or abbreviated as:
    <dbref #> <command>

(continued in help @force2)
[Top]

@force2

  Normally, the command is parsed for function evaluation and 
  substitutions twice - once when @force is run, once when
  the forcee runs the command. @force/noeval will only
  evaluate the command when the forcee runs it.

Example:
  @create Lackey
  > Created: Object #103 
  @fo Lackey = go east
  > Lackey goes east.
  > Lackey has left.
  @fo #103 = page Cyclonus = Hi there!
  > Lackey pages: Hi there!
  #103 page Cyclonus = Whee
  > Lackey pages: Whee

See also: PUPPET, DBREF 
[Top]

@function
  @function [<function name>=<object>,<attribute>]
  @function/delete <function name>
  
  When used without any arguments, this command lists all global
  user-defined functions. For wizards and others with the Functions
  power, it also lists the dbref number and attribute corresponding
  to the listed functions.
  
  Otherwise, this command defines a global function with the name
  <function name>, which evaluates to <attribute> on <object>.
  <object> can be anything that the player using the @function command
  controls. <function name> must be 30 characters or less.
  @function/delete removes a user-defined function.

  A function defined using @function works just like any of the normal
  MUSH functions, from the user's perspective. The functions are
  executed by the object, with its powers. 
 
(continued in help @function2)
[Top]

@function2
  Functions defined via @function should follow the format used by
  UFUN() - %0 is the first argument passed, %1 is the second argument
  passed, and so forth.
  
  Example:
  
    > &WORD_CONCAT #10=%0 %1
    > say "[ufun(#10/word_concat,foo,bar)]
    You say, "foo bar"
  
    > @function word_concat = #10, word_concat
    > say "[word_concat(foo,bar)]
    You say, "foo bar"
 
(continued in help @function3)
[Top]

@function3
  Global user-defined functions are not automatically loaded when the
  game is restarted. In order to avoid objects which attempt to use
  functions that have not been loaded, a @startup containing @function
  commands should be set on a wizard object with as low a dbref number 
  as possible; object #1 (generally God) is suggested for this use.

  For example, if you have one object that stores all your global
  functions, you could set the following command (the object is #100
  in the example):

    @startup #1=@dol lattr(#100)=@function ##=#100,##

  And then store each function as an attribute of the same name on 
  object #100.

See also: FUNCTIONS, @startup
[Top]

@grep
  @grep[/<switch>] <object>[/<attrs>]=<pattern>
  
  This command searches attributes in an object for <pattern>. It takes
  four switches:
  @grep/list
    Lists the names of the attributes on the object containing <pattern>.
  @grep/ilist
    Same as above, but is case-insensitive when trying to match <pattern>.
  @grep/print
    Prints out all the attributes, highlighting the pattern itself in 
    boldface, if you're ANSI.
  @grep/iprint
    Same as above, case-insensitive.

  When used without a switch, @grep defaults to @grep/list.
(continued in help @grep2)
[Top]

@grep2

  You must be able to see attributes on <object> (i.e. you must control
  the object, it must be VISUAL, or you must be a Wizard or Royalty).
 
  <attrs> is an optional wildcard pattern specifying attributes to
  match (much like @edit). If <attrs> is not provided, all attributes
  are assumed (just as if you had provided "*").
   
  <pattern> is not treated as a wildcard pattern, so you can grep for
  patterns containing '*', '?', etc.  Also, <pattern> is NOT PARSED,
  so '[v(0)]' and the like can be searched for.
[Top]

@halt
  @halt <object> [=<new_command>] 
  @halt/all
 
  The @halt command removes all queued actions for <object>. 
  If <new command> is specified, that new command is placed
  in the queue for the object instead. If no new command is
  specified, the object is set HALT.

  If <object> is a player, it clears the queue for the player and
  and all of his objects. You can use "@halt me" to clear your own
  queue without setting yourself HALT. Only wizards can @halt 
  other players.
  
  Note that halting an object does NOT affect any objects waiting
  on it as a semaphore.

  @halt/all is a synonym for @allhalt and is a wizard-only command.

See also: HALT, QUEUE, @ps
[Top]

@haven
  @haven <player> = <message>

  This message is sent to a player whose pages you are refusing, either
  through use of the HAVEN flag or through the use of a page lock, if
  it evaluates to something non-null.

See also: HAVEN, page, @lock, @away
[Top]

@hide
  @hide[/<switch>]
  
  This command enables a royalty, wizard, or player with the Hide
  power to disappear from the WHO list for mortals. "@hide/yes" or "@hide/on"
  hides the player, "@hide/no" or "@hide/off" unhides the player.
  Hidden players are marked as "(Hide)" in the privileged WHO listing.
 
  Mortals can not use the CONN(), IDLE(), or LWHO() functions to find 
  hidden players.

[Top]

@idescribe
[Top]

@oidescribe
[Top]

@aidescribe
  @idescribe <object> [=<description>]
  @oidescribe <object> [=<message>]
  @aidescribe <object> [=<action list>]

  @idescribe command sets the internal description for an object, which is 
  shown to anyone who enters or looks while inside the object. Meaningless 
  for rooms and exits. May be abbreviated to @idesc.

  @oidescribe sets the message seen by others when someone looks at the 
  idesc, and @aidescribe sets the action the object will take (just as 
  with @desc, @odesc, @adesc). 

  If there is no IDESCRIBE set for an object, those who enter or look 
  inside it will see its @desc, and no o-message or action will be
  available. If you want to use @aidescribe without @idescribe, set 
  @idescribe to a blank string.

  If [=<description>] or [=<message>] omitted, the attribute will be 
  reset.
  
See also: enter, @enter, ENTER_OK, @describe, look
[Top]

@idle
  @idle <player> = <message>

  This message is sent in return to every page which successfully reaches
  you if it evaluates non-null. It is useful if you are idle for long 
  periods of time and wish to inform people where you are, or if you
  are in a meeting and cannot quickly return pages.

  Clever example: 

   @idle me=[switch(gt(idlesecs(me),120),1,I'm idle. Use @mail,)]

  Players paging me will only see the "I'm idle" message if I've been
  idle for over 2 minutes (120 seconds).
[Top]

@infilter
  @infilter <object> = <pattern 1>, <pattern 2>, <pattern 3>, ...
  
  @infilter is meant to be used on objects that have an @listen of "*"
  (ie, objects that listen to everything, which is commonly used for 
  things like chairs so that someone inside the object can hear 
  everything said/done outside it). @infilter filters out any messages
  that match one of the patterns and prevents those inside the object
  from hearing them.
 
  For an explanation of infilter patterns, see the help for "@filter".

See also: @filter, @listen, AUDIBLE, LISTENING
[Top]

@inprefix
  @inprefix <object> = <message>
  
  @inprefix is intended for use with objects with a @listen of "*".
  It prepends the <message> string to any message propagated to the
  contents of <object> from the outside. If there is no @inprefix,
  no string is prepended to the output.
  
  Example:
  
  [ First, @create Vehicle and Test (objects #103 and #104) and drop them ]
    > @inprefix Vehicle = From outside,
    Vehicle - Set.
    > enter Vehicle
    Vehicle(#103)
    > @force #104=:bounces.
    From outside, Test bounces.

See also: @prefix, @listen, @infilter
[Top]

@kick
  @kick <number>
  
  This wizard-only command forces the immediate execution of <number>
  items from the queue. Rarely useful. If your MUSH is lagging badly,
  chances are high that it stems from network problems. Check the queue
  before using this command.

See also: @ps, QUEUE
[Top]

@lalias
  @lalias <object> = <leave alias>

  Sets the leave alias(es) of an object that is ENTER_OK. Setting a leave 
  alias allows people to type the leave alias instead of the "leave"
  command in order to get out of the object. Meaningless for exits and
  rooms.

  You can set multiple leave aliases on an object by separating them with
  semi-colons.
  Example:
      @lalias chair=stand up;stand;get up;rise

See also: @ealias, leave, @leave, @lfail
[Top]

@leave
  @leave <object> = <message>
  
  Sets the message that is displayed to anyone leaving <object>. 
  
See also: leave, @lfail
[Top]

@lemit
  @lemit[/silent] <message>

  Emits a message to the outermost container object. For example, if you
  are carrying a bird, and are inside a vehicle which is in room #10, and
  you force the bird to @lemit "Cheep", everyone in room #10 will hear
  "Cheep". This command is the same as "@emit/room". 

  The /silent switch suppresses the normal confirmation message.
[Top]

@lfail
  @lfail <object> = <message>

  This is the message shown to the player who fails to leave the object,
  either because the object is set NO_LEAVE or because the person leaving
  fails the leave-lock.

See also: leave, @leave, NO_LEAVE, locktypes
[Top]

@list
  @list/<switch>
  @list <switch>

  The @list command lists useful MUSH information.

  Switches include:
  /motd      : Alias for @listmotd, shows current messages of the day.
  /functions : Alias for @config/functions, shows all functions
  /commands : Alias for @config/commands, shows all commands
  /attribs : Alias for @config/attribs, shows all standard attribs
[Top]

@listmotd
  @listmotd

  This command lists the current MOTD (message of the day) for the MUSH.
  If used by a wizard or admin, it will also include the wizard, full, and
  down MOTDs to the user. Same as @list/motd.

See also: @list
[Top]

@link
  @link <object>=<dbref | here | home | variable>

  Links <object> to either a room or a thing. If a thing or player is
  linked, that sets the object's HOME. If a room is linked, that sets 
  the object's drop-to room, which is where objects that are dropped
  in the room will be sent to.

  Most often, @link is used to link or relink an exit to a destination 
  room. In order to link an exit to a room, you must either own or control
  the room, OR the room must be set LINK_OK. If you do not own an exit and
  you relink it, the exit will be set HALT and @chowned to you. Linking an
  exit usually costs 1 penny.
  
  If the destination of an exit is "variable", its destination is determined
  at the time of travel by the attribute DESTINATION on the exit, which is
  evaluated like a U()-function. You must have permission to link to
  whatever the DESTINATION evaluates to in order for the exit to work.
 
  LINK_OK objects can also be used as semaphores, and any object
  can be @parented to them.
 
See also: EXITS, @open, @dig, DROP-TO, HOME
[Top]

@listen
  @listen <object> = <string>

  Sets the object's listen pattern to <string>, which can have wildcards.
  Whenever something the object hears matches the pattern, the object's
  ahear/amhear/aahear attribute will be triggered. In addition, anything 
  inside the object will hear it as well.

For example:
  @listen Chair = *  
    Since the wildcard (*) matches anything, anyone inside the object will
    hear anything said outside it.
  @listen Butler = * has arrived.
  @ahear Butler = :walks over to the new arrival and takes %p coat.
  > Cyclonus has arrived.
  > Butler walks over to the new arrival and takes his coat.
    In this case, the listen pattern is met whenever someone 'arrives' in
    the room, and then the object does whatever is inside its @ahear 
    attribute.

(continued in help @listen2)
[Top]

@listen2
  An object "hears" anything that another player standing in the same room
  would hear. For example, if you type in a command, the object does NOT
  hear it. If the command has a result that people in the room hear, the
  object will hear it.

For example:
  @listen Recorder = @emit *
  @ahear Recorder = :records {%0}
  @emit Whee!
  > Whee!
    In this example, the Recorder's listen-pattern is NOT matched, because
    it doesn't hear the '@emit Whee!', it only hears the 'Whee!' part, which
    doesn't match.

  @listen Recorder = Cyclonus says, "*"
  "Whee!
  > Cyclonus says, "Whee!"
  > Recorder records: Whee!

See also: LISTENING, @ahear, @amhear, @aahear
[Top]

LOCKING
[Top]

LOCKS
[Top]

@lock
  @lock[/<switch>] <object>=<key> 
  
  This command "locks" the object, specifying (by the key) who or what can
  do certain things with the object. There are many different types of locks,
  all of which are described in "help locktypes" and which are designated by
  the switch. The "basic" lock determines, for players and objects, who can
  pick them up. For exits, it determines who can go through the exit.
  All other locks can be set the same way as the basic lock.

  Whenever you "pass" the basic lock, you succeed in doing something with
  the object. This triggers the @success/@osuccess/@asuccess
  messages and actions. If you fail to pass the basic lock, you trigger
  the @failure/@ofailure/@afailure messages and actions. Other locktypes
  may also have such success/failure messages.

  You can specify <object> and <key> as either the name of an object in
  the immediate area, a DBREF number, "me", or "here". 

(continued in help @lock2)  
[Top]

@lock2
  You can lock an object in several different ways. The simplest lock is to
  lock it to one other thing:
   @lock My Toy = = me
     This locks the object "My Toy" to you and you alone. It is recommended
     that you @lock me == me in order to prevent anyone else from picking
     you up. The two = signs are NOT a typo!

  You can lock an object -against- one other object as well, using the '!' 
  symbol:
    @lock Shared Toy = !Vector Sigma
      This locks the object "Shared Toy" to everyone -except- Vector Sigma.
      Everyone except Vector will be able to pick up the object.

(continued in help @lock3)
[Top]

@lock3
  You can lock an object to something that has to be carried:
    @lock Door = +Secret Door Key
      This locks the exit "Door" to someone carrying the object "Secret Door
      Key". Anyone carrying that object will be able to go through the exit.

  You can lock an object to -either- an object or to someone carrying the
  object with:
    @lock Disneyworld Entrance = Child
      This locks the exit "Disneyworld Entrance" to either the object 
      "Child" -or- to someone carrying the object "Child". (OK, so it's
      a weird example.)
  
  You can lock an object to a specific player by using a *:
    @lock Note == *Jazz
      Only the player "Jazz" will be able to pick up the Note object.
  
(continued in help @lock4)
[Top]

@lock4
  An "owner" lock allows you to lock something to anything owned by the
  same player:
    @lock Box = $My Toy
      This locks "Box" to anything owned by the owner of "My Toy" (since
      players own themselves, that includes the owner as well).

  An "indirect" lock allows you to lock something to the same thing as
  another object (very useful in setting channel locks; see help @clock):
    @lock Second Puppet = @First Puppet
      This locks the object "Second Puppet" to whatever the object 
      "First Puppet" is locked to.

  There are also some more complex locks called attribute and evaluation
  locks. In addition, you can make complex locks (combining several types
  or reversing them).

(continued in help @lock5)
[Top]

@lock5
ATTRIBUTE LOCKS
  You can lock an object to an attribute on the person trying to pass 
  the lock (as long as the object can "see" that attribute):

    @lock <object>=<attribute>:<value>

  <value> can contain wildcards (*), greater than (>) or less than (<)
  symbols.

  For example:
    @lock Men's Room = sex:m*
      This would lock the exit "Men's Room" to anyone with a SEX attribute
      starting with the letter "m". 
    @lock A-F = icname:<g
      This would lock the exit "A-F" to anyone with a ICNAME attribute
      starting with a letter "less than" the letter "g". This assumes
      that ICNAME is visual or the object with the lock can see it.

(continued in help @lock6)
[Top]

@lock6
COMPLEX LOCKS
  You can combine or reverse locks very easily using the following 
  BOOLEAN symbols and parentheses () to group them:
    &      - "and"
    |      - "or"

  For example:
   @lock My Toy = =me | !*Chromia | +Toy Box Key
      This locks "My Toy" to me, -against- the player Chromia, or to anyone 
      carrying the object "Toy Box Key". 
   @lock My Toy = *Marissa & +Toy Box Key
      This locks "My Toy" to the player Marissa, who needs to be carrying
      the object "Toy Box Key".
   @lock My Toy= *Chromia | ( *Marissa & +Toy Box Key )
      This locks it to Chromia, OR to Marissa if she is carrying the Key.

(continued in help @lock7)
[Top]

@lock7
EVALUATION LOCKS
  An evaluation lock is set using this format:

    @lock <object>=<attribute>/<value>

  The difference between this and an attribute lock is that the <attribute>
  is taken from <object> rather than from the person trying to pass the
  lock. When someone tries, <attribute> is evaluated, and the result is 
  compared to <value>. If it matches, then the person passes the lock.

  The person trying to pass the lock is %# and <object> is %! when the
  evaluation takes place. The evaluation is done with the powers of
  <object>. If you try to do something (like [get(%#/<attribute>)]) and
  <object> doesn't have permission to do that, the person will automatically
  fail to pass the lock.

(continued in help @lock8)
[Top]

@lock8

  Example: 
    @lock Stage = ispuppet/1
    &ispuppet thing = hasflag(%#, PUPPET)
      This locks the object "Stage" to puppets only.

      Whenever someone tries to pick up the object, the attribute 
      "ispuppet" will be checked, substituting in the person's DBREF number
      for %#. 
 
      [hasflag(<dbref>, PUPPET)] will come out to 1 if the object with 
      <dbref> has the "PUPPET" flag. Otherwise, it will come out to be 0. 
      Since the value in the @lock is 1, only objects with the PUPPET flag
      will be able to pass this lock.

See also: locktypes, @clock
[Top]

locktypes
[Top]

locklist
[Top]

lock types
[Top]

lock list
  Your MUSH will almost certainly support these standard lock types:

  @lock/enter           Who can enter the player/object
  @lock/teleport        Who can teleport to the room
  @lock/use             Who can use the object
  @lock/page            Who can page the player

  Most MUSHes will also support these lock types:

  @lock/zone            Who can control objects on this zone
  @lock/parent          Who can @parent something to this object/room
  @lock/link            Who can @link something to this object/room
  @lock/mail            Who can @mail the player
  @lock/user:<name>     User-defined. No built-in function of this lock,
                        but users can test it with elock()

  See 'help locktypes2' for more
[Top]

locktypes2
  Not all of these lock types may be enabled in your MUSH. 
  When in doubt, try it out!

  @lock/speech          Who can speak/pose/emit in this room
  @lock/listen          Who can trigger my @ahear/^-pattern actions
  @lock/command         Who can trigger my $-pattern commands
  @lock/leave           Who can leave this object
  @lock/drop            Who can drop this object or in this room
  @lock/give            Who can give this object
  @lock/follow          Who can follow this object
  @lock/examine         Who can examine this object if it's VISUAL

  @elock is an abbreviation for @lock/enter
  @ulock is an abbreviation for @lock/use

See also: @lock, @clock, FAILURE
[Top]

@log
  @log[/<switch>] <message>

  This wizard-only command puts <message> in a log file, tagged with
  the time and object executing the command.  The available switches
  are /check, /cmd, /conn, /err, /trace, and /wiz, specifying which
  file to log to.  /cmd is default.

  See also: @logwipe
[Top]

@logwipe/<switch> <password>

  This God-only command erases one of the MUSH logs. Available switches
  are /check, /cmd, /conn, /trace, and /wiz. God must give the 
  log wipe password from the MUSH's configuration file to use this
  command.

  See also: @log
[Top]

@map
  @map[/delim] [<delim>] <list> = <function or pattern>
 
  This command takes a space-separated list of words, and performs
  pronoun/pattern substitution on each word, returning a list - 
  "mapping" the function onto each item in the list. It returns the
  list in a MAPLIST attribute, automatically set on the object executing
  the @map. The set is always performed before any actions further
  actions are executed. 
  
  If the /delim switch is given, the first character of the list is
  used as the delimiter, instead of space.

  Brackets are generally necessary in order to make the function
  substitutions evaluate correctly.
  
  @map is an obsolete command provided for backwards compatibility;
  the ITER() or MAP() functions should probably be used instead.
 
  See "help @map2" for examples of @map.
 
[Top]

@map2
 
  Examples of @map:
    @map foobar baz blech=[strlen(##)]
      Returns "6 3 5" in MAPLIST.
    @map testing map-test=[strlen(before(##, est)]
      Returns "1 5" in MAPLIST
    @map Joe Bob Ann=I know ##.
      Returns "I know Joe. I know Bob. I know Ann." in MAPLIST
 
  >  @va Object=$test * * *:@map %0 %1 %2=[strlen(##)];
           @dolist [v(maplist)] = say ##
  Object - Set.
  >  test aaa bb c
  Object says, "3"
  Object says, "2"
  Object says, "1"
[Top]

@motd
  @motd [/<switch>] [<message>].  
 
  The default for this command (and with the /connect) switch, is a
  wizard only command that will set a temporary message that 
  will be shown to players when they connect. This MOTD is cleared
  every time the MUSH restarts.
 
  Other switches:
  /wizard : sets the message for wizards (like @wizmotd)
  /down   : sets the logins-off message (like @rejectmotd)
  /full   : sets the max-players-logged-in message
  /list   : list the MOTDs (like @listmotd, can be used by anyone)
[Top]

@move
  @move <object> = <movement message>

  This sets the message that is shown to <object> whenever it moves.
  Example:
       @move me=You moved! You are now in the room: [name(loc(me))].

See also: go, @omove, @oxmove, @amove
[Top]

@name
  @name <object>=<new name> [<password>]

  Changes the name of <object>, which can be a thing, player, exit,
  or room. You can refer to object by name, DBREF number, or as "me"
  or "here". For a player, it requires the player's password.

[Top]

@newpassword
  @newpassword <player> = <password>

  This wizard-only command changes <player>'s password. If <player>
  is logged in, s/he will be informed that the password was changed.

See also: @password
[Top]

@notify
  @notify[/all] <object>[=<count>]
  
  This command notifies the semaphore <object>, running the first
  command that waited on <object> using the semaphore version of
  @wait. If <count> is specified, it notifies the semaphore that
  many times. If there are no commands, or less than <count>
  commands, pending for <object>, then subsequent @waits will not
  block until the semaphore count reaches zero again.
  
  The "/all" switch to this command notifies the semaphore until
  the semaphore count is exactly zero; all commands pending on that
  semaphore are executed immediately. <count> is ignored.

See also: SEMAPHORES, @drain, @wait
[Top]

@odeath
  @odeath <player> [=<message>]

  This sets the ODEATH attribute on the player, which contains the
  message that will be shown to others when s/he is killed. The
  @odeath message will automatically have the player's name included.

Example:
     @odeath me=falls to the ground and vanishes.
     (if I am killed, others in the room then see:)
     > Cyclonus falls to the ground and vanishes.

  If the =<message> part is omitted, the ODEATH attribute will be reset.

See also: @death, @adeath, kill
[Top]

@odescribe
  @odescribe <object> [=<message>]

  This sets the message that will be shown to others whenever anyone
  looks at <object>. The name of the person looking will be added to
  the beginning of the message. Please note that @odescs are often found
  annoying. 

  If the =<message> part is omitted, the message will be reset.

See also: look, @describe, @idescribe
[Top]

@odrop
  @odrop <object> [=<message>]

  This sets the message that will be shown to others whenever anyone drops
  <object>. The name of the person dropping the object will be added to the
  beginning of the message automatically.

  If set on an exit, the @odrop is shown in the exit's destination room
  when someone goes throught the exit.

  If the =<message> part is omitted, the message will be reset.

See also: drop, @drop, @adrop
[Top]

@oefail
  @oefail <object> [= <message>]

  This sets the message that will be show to others whenever anyone tries
  to enter <object> and fails, usually because they fail the enter-lock.

  If the =<message> part is omitted, the message will be reset.

See also: enter, @efail, @aefail, @lock
[Top]

@oemit
  @oemit[/noeval] [<room>/]<object> [<object>...] = <message>
 
  This command shows <message> to everyone in the location of <object>
  EXCEPT <object>. The object can be specified by name if in your current
  location, or by DBREF number. A list of objects can be given, in
  which case the message is shown in all locations to all except those
  objects.
  
  If a room is specified (usually via dbref), this command shows
  <message> to everyone in <room> except for <object> (which may be
  a list, as above). In this case, object(s) are matched with reference to
  <room>. Therefore, if you want to send a message to everything but an
  object called "spy" in #100, you can simply use "@oemit #100/spy=Test";
  you don't need to know the dbref of "spy".

  The /noeval switch prevents the MUSH from evaluating the message.
 
See also: @emit, @pemit, NOSPOOF and SPOOFING.
[Top]

@oenter
  @oenter <object> [= <message>]

  This sets the message that will be show to others whenever anyone
  enters the object. It will be seen by those already -inside- the
  object and will automatically add the name of the person entering
  at the beginning. If you wish to set a message to be seen by those
  -outside- the object, use @oxenter.

See also: enter, @enter, @oxenter
[Top]

@ofailure
  @ofailure <object> [=<message>]

  This sets the message that will be show to others whenever anyone
  fails to pass <object>'s basic lock. For players and things, this means
  failing to pick them up. For exits, this means failing to go through 
  the exit. It automatically prefixes the name of the player.

Example:
  @ofail Locked Door=tries to open the door, but it seems to be locked.

  If the =<message> part is omitted, the message will be reset.

See also: FAILURE, @lock, @failure, @afailure
[Top]

@ofollow
  @ofollow <object> [= <message>]

  Sets the message shown to others in the room after someone
  begins following the object (using the 'follow' command). 
  Similar to @omove or @osucc, this command prepends the name
  of the person doing the following.

  If the =<message> part is omitted, the message will be reset.

Ex: @ofollow me=falls into step behind Cyclonus.

See also: follow, unfollow, followers(), @follow, @afollow
[Top]

@ounfollow
  @ounfollow <object> [= <message>]

  Sets the message shown to others in the room after someone
  stops following the object (using the 'unfollow' command). 
  Similar to @omove or @osucc, this command prepends the name
  of the person doing the unfollowing.

  If the =<message> part is omitted, the message will be reset.

Ex: @ounfollow me=stops following [name(me)].

See also: follow, unfollow, followers(), @unfollow, @aunfollow
[Top]

@oleave
  @oleave <object> [= <message>]
  
  This sets the message that will be displayed to the people inside
  <object> whenever someone leaves <object>. If you want to set a 
  message to be displayed to people outside the object, use @oxleave.
  This command automatically inserts the name of the person leaving
  at the start of the message.

  If the =<message> part is omitted, the message will be reset.

See also: leave, @leave, @aleave, @oxleave
[Top]

@olfail
  @olfail <object> [= <message>]
  
  This sets the message that will be shown to others whenever someone
  tries to leave <object> and fails (usually if the person fails the
  leave-lock, or if <object> is set NO_LEAVE). It automatically inserts
  the name of the person trying to leave at the start of the message.

  If the =<message> part is omitted, the message will be reset.

See also: leave, @lfail, @alfail, @lock
[Top]

@omove
  @omove <object> [= <message>]

  Sets the message that will be shown to others whenever <object> moves.
  It is shown in the destination room or object and automatically inserts
  the name of the <object> at the beginning. Please note that long @omoves
  are frequently found annoying.

Example:
 @omove me=stalks into the room wearing the latest in malevolent expressions.
  
  If the =<message> part is omitted, the message will be reset.

See also: go, @move, @amove, @oxmove
[Top]

@oxmove
  @oxmove <object> [= <message>]

  Sets the message shown to others in the source room whenever <object> 
  moves elsewhere. <object>'s name is automatically inserted at the
  beginning of this message. Note that long @oxmoves are annoying.

 Example:
  @oxmove me=stalks away, glaring.

  If the =<message> is omitted, the message is cleared.
  
See also: go, @move, @omove, @amove
[Top]

@opayment
  @opayment <object> [=<message>]

  Sets the message that will be show to others whenever someone "pays"
  <object> (by giving the object a certain amount of MUSH money). The
  name of the person giving the money will be automatically inserted at
  the beginning of the message.
  
  If the =<message> part is omitted, the message will be reset.

Ex: @opay Vending Machine=sticks a quarter in the vending machine.

See also: give, @cost, @payment, @apayment, MONEY
[Top]

@open
  @open <exit name>
  @open <exit name>;<exit alias>*=<destination>
  @open <exit name>;<exit alias>*=<destination>,<exit name>;<exit alias>*

  This command opens an exit in the room you are standing in with the 
  specified name. You can then use the @link command to set the exit's
  destination, or you can set it automatically by using the DBREF of a
  destination, which can be a room or object. (Note that you CANNOT open
  exits from objects.) If you also include the second exit name, an exit
  from the destination room will be opened back to the room you are in.

  * Note that you can have as many exit aliases as you like by adding more,
  separated by semicolons. An exit alias allows you to type that instead of 
  the full exit name to go through the exit. Only the exit name appears in
  the list of Obvious Exits in a room.

See also: EXITS, @link, @dig
[Top]

@osuccess
  @osuccess <object> [=<message>]

  Sets the message that is shown to others whenever someone passes the 
  object's Basic lock. For players and things, this means picking them up.
  For exits, this means going through the exit, and the osuccess message
  is shown to those in the room the player has just left. This message 
  automatically inserts the name of the person at the beginning.

  @osucc's are very useful for allowing people to follow someone around
  if the name of the exit is included in the message. It is recommended 
  that you put @osuccs on all exits and all takeable objects.

Ex: @osucc North=heads north into the catacombs.
  
  If the =<message> part is omitted, the message will be reset.

See also: take, @success, @asuccess, @lock, FAILURE
[Top]

@otport
  @otport <object> [=<message>]

  Sets the <message>, which will be prefixed by <object>'s name,
  that will be shown to the others in the room that the <object>
  is teleported to. If you want to set a message that will be shown
  to the room that the object is teleported OUT of, use @oxtport.

  If the =<message> part is omitted, the message will be reset.

See also: @teleport, @oxtport
[Top]

@ouse
  @ouse <object> [=<message>]

  Sets the message that will be shown to others whenever someone successfully
  uses <object>. The name of the person using the object will automatically
  be inserted at the beginning.

  If the =<message> part is omitted, the message will be reset.

See also: use, @use, @ause
[Top]

@oxenter
  @oxenter <object> [= <message>]

  Sets the message that will be shown to others outside the object whenever
  someone enters the object. The name of the person entering will be
  inserted at the beginning of the message automatically. If you want
  to show a message to everyone inside the object, use @oenter.

  If the =<message> part is omitted, the message will be reset.

See also: enter, @oenter, leave
[Top]

@oxleave
  @oxleave <object> [= <message>]

  This message is shown to everyone in the room that a person enters
  when doing a 'leave' command.  This will be shown in addition to the
  enter messages of the room, not instead of.

  If the =<message> part is omitted, the message will be reset.

See also:
[Top]

@oxtport
  @oxtport <object> [=<message>]
  
  Sets the <message>, which will be prefixed by <object>'s name,
  that will be shown to those in the room that the object has
  left via @teleport. If you want to show a message to the room the
  object has arrived in, use @otport.

  If the =<message> part is omitted, the message will be reset.

See also: @teleport, @otport, @atport
[Top]

@parent
  @parent <object> = <parent>
 
  This command sets the parent of <object> to <parent>. <parent> may be
  an object of any type; <object> can be anything but a player. The
  player must control <object>. <parent> must be controlled by the
  player or LINK_OK.
  If <parent> is "none" or blank, the object is unparented.

See also: PARENTS, parent(), lparent()
[Top]

@password
  @password <old password>=<new password>

  This changes your password. Please note that passwords ARE case-sensitive.
  
[Top]

@payment
  @payment <object> [=<message>]

  Sets the message that is shown to anyone who pays the object, by giving
  it a certain amount of MUSH money. If =<message> is omitted, the message
  is reset to nothing. May be abbreviated @pay. 

See also: give, @apay, @opay, and @cost.
[Top]

@receive
[Top]

@oreceive
[Top]

@areceive
  @receive <recipient> [=<message>]
  @oreceive <recipient> [=<message>]
  @areceive <recipient> [=<message>]

  @receive sets the message that is shown to the recipient who 
  acquires an object by 'get'ing it or having it 'give'n to them.
  @oreceive is a mesasge shown to others in the recipient's location,
  and @areceive is an action run by the recipient. If not set,
  the recipient gets a default message ("Jane gave you A Headache").
  
  %0 will be set to the dbref of the object received.
  %1 will be set to the dbref of the giver if a 'give' was performed.

See also: give
[Top]

@give
[Top]

@ogive
[Top]

@agive
  @give <giver> [=<message>]
  @ogive <giver> [=<message>]
  @agive <giver> [=<message>]

  @give sets the message that is shown to the giver when giving an object
  to someone else.  @ogive is a mesasge shown to others in the giver's
  location, and @agive is an action run by the giver. If not set,
  the giver gets a default message ("Given.")

  %0 will be set to the dbref of the object given.

See also: give
[Top]

@pcreate
  @pcreate <name> = <password>
  This is a wizard level command that is only available if registration is
  being enforced.  It creates a player with the given name and password.
[Top]

@pemit
  @pemit[/<switch>] <object> = <message>
  
  The basic form of this command sends <message> to <object> directly.
  It is very similar in its effects to @emit except only one object
  will see the message. You may @pemit to objects in the same room,
  objects you are carrying, and to objects that are carrying you, 
  or @pemit remotely, using #<object> or *<player name>.
 
  The /list switch to this command allows you to @pemit a message to
  a list:  @pemit/list <object 1> [<object 2> <object N>] = <message>
  There can be any number of objects in the list. The objects must be
  specified by dbref number. You will not get back a "confirmation"
  message for the /list form of this command. You can use ## in the
  <message>, which will be replaced with the db#'s of each object in
  the message sent to that object.
  
(continued in help @pemit2)
[Top]

@pemit2
  The @pemit command can take the following additional switches:
    /contents  -- equivalent to @remit.
    /silent    -- does not tell the @pemit'ing object a confirmation message.
    /noisy     -- tells the @pemit'ing object a confirmation message.
    /noeval    -- the message will not be evaluated for substitutions 

  Note that page-lock and the HAVEN flag will block @pemits as well, 
  except from Wizards or those with the pemit_all power.

See also @emit, @oemit, @remit, NOSPOOF, and SPOOFING.
[Top]

@poll
  @poll <poll question>
  This wizard-only command sets the "poll" - the Doing question. If
  "@poll" is used by itself, the question is reset to the default
  string "Doing". It can also be used by those with the poll @power.

See also: @doing, WHO, DOING
[Top]

@poor
  @poor <value>.
  This is a wizard only command.  It sets every player's money supply to
  value.

See also: MONEY
[Top]

@power
  @power <object>=[!]<power>
  
  This is a wizard-only command which allows the granting of special
  privileges to objects of any type. 
  
  A list of powers is given in "help powers list".
[Top]

@prefix
  @prefix <object> = <message>
 
  This attribute is meant to be used in conjunction with the AUDIBLE
  flag. The @prefix of the object is prepended to messages propagated
  via AUDIBLE.   Pronoun substitution is done on @prefix messages.
  
  For example, if you have an audible exit "Outside" leading from a room 
  Garden to a room Street, with @prefix  "From the garden nearby,"  if
  Joe does a ":waves to everyone." from the Garden, the people at Street
  will see the message,   "From the garden nearby, Joe waves to everyone."

See also: @inprefix, AUDIBLE, @listen
[Top]

@ps
  @ps[/<switch>] [*<player> | all]
  
  @ps is a useful command for MUSHers.  It lists all commands currently on
  your 'to be executed' queue, thus allowing you to identify infinite (or
  unnecessary) loops with-out putting in says or poses. It gives a count of
  the total commands in each of the queues (Player, Object, Wait, and
  Semaphore), displayed in the format:
      <Number of your queued commands> / <Total number of queued commands>.
      
  @ps with no arguments will show you your own queue. Wizards may specify
  the /all switch, and see the full queue. They may also specify a player.
  @ps/summary just displays the queue totals for the whole queue.
  @ps/quick displays the queue totals for just your queue.
[Top]

@purge
  @purge is a wizard only command that calls the internal purge routine to 
  advance the clock of each object scheduled to be destroyed, and destroy 
  those things whose time is up. The internal purge routine is normally
  run automatically aproximately every 10 minutes. 

  The @purge command should almost never need to be performed
  manually. If you do use it manually, you may want to use it twice in
  a row to make sure that everything marked GOING is actually
  destroyed.

See also: @dbck
[Top]

@quota
  @quota [/<switch>] [<victim>]

  This command is only available if the quota system is enabled.
  It reports the victim's owned objects and the maximum number of objects 
  s/he may own. You must be a Wizard to see another player's quota.

  The /set and /all switches are equivalent to @squota and @allquota,
  respectively.
[Top]

@readcache
  @readcache
  
  This wizard-only command reads the text files into the cache. This must
  be done every time the text files (connect text, quit text, etc.) are 
  changed while the game is running.
 
  A site admin can achieve the same effect by sending the MUSH process
  a kill -1 or kill -HUP.
 
[Top]

@rejectmotd
  @rejectmotd <message>

  This is a wizard only command that will set a short (non-longterm) message 
  that will be shown to players that try to connect when logins are disabled. 
  This is the "Down MOTD" in the @listmotd listing. The siteadmin can set a
  more permanent message for this by editing the file "down.txt".
  
See also: @motd, @list, @listmotd
[Top]

@remit
  @remit[/noeval] <object> = <message>.

  Sends the message to all contents of <object>, which can be a room,
  thing, or player. (The TinyMUSH equivalent is @pemit/contents).
  The /noeval switch prevents the MUSH from evaluating the message.

See also: @emit, @pemit, @oemit, SPOOFING, NOSPOOF and CONTROL.
[Top]

@restart
  @restart <object> or @restart/all
  
  This command halts <object> (as described in @halt), and then triggers
  the STARTUP attribute on the object, if set. If <object> is a player,
  it affects the player and all of their objects. Players can use
  @restart me to restart their own objects. The /all switch halts
  all objects (see @allhalt) and restarts them, and can only be used
  by a wizard.


See also: @halt, @startup
[Top]

@runout
  @runout <object> = <action list> 

  Sets the actions to be taken when the charges of the object reaches
  zero. 

See also: @charges, use, ACTION LISTS
[Top]

@rwall
  @rwall <message>

  Only wizards and royalty may use this command. It broadcasts a message to
  all connected wizards and royals, prefixed with "Admin:". If the first
  character is : or ; it does the same thing as @rwallpose.
[Top]

@rwallemit
  @rwallemit <message>
  Only wizards and royalty may use this command. It is similar to @wizemit,
  but broadcasts the message to all connected wizards and royals.
[Top]

@rwallpose
  @rwallpose <pose>
  Only wizards and royalty may use this command. It's a variant of @rwall,
  using a pose, and is identical to "@rwall :<pose>"
[Top]

@scan
  @scan[/<switch>] <command>
  
  @scan gives you a list of all objects containing $commands (user-defined
  commands) which could match <command>. If given no switches, it checks
  you, your possessions, your location, objects in your location, the
  zone/zone master room of your location, your zone, and objects in the 
  master room. It does NOT stop when it gets a match, but rather, finds all 
  possible matches, although it will show only one of the attribute names
  that matched. It also tells how many commands on each object were
  matched. It does NOT scan objects that you do not control and are not
  set VISUAL.
  
  This command can take four switches:
     /room     --   just matches on your location and objects in it.
     /self     --   just matches on you and anything you're carrying.
     /zone     --   just matches on zones of your location and yourself.
     /globals  --   just matches on objects in the master room.
[Top]

@search
  @search [<player>] [<class>=<restriction>] [,<begin>,<end>]
  
  This command searches the database and lists objects which meet user
  specified search criteria.  You can limit the scope of the search by
  specifying <begin> and <end> as the first and last dbrefs to search.
  
  If a <player> argument is supplied, only objects owned by that player
  will be listed. If a <class> argument is supplied only objects of a
  certain class will  be listed. Possible <class>es include TYPE, NAME,
  ZONE, PARENT, EXITS, OBJECTS, ROOMS, PLAYERS, FLAGS, POWERS, EVAL,
  EPLAYER, EROOM, EEXIT, and EOBJECT.

  If <class>=TYPE, possible <restriction>s include OBJECT, ROOM,
  EXIT, PLAYER. This shows all objects of the specified type.
  
  If <class>=NAME, only objects whose name begin with the string <restriction>
  will be listed. If <class>=ZONE, only objects in the zone <restriction>
  will be listed. If <class>=PARENT, only children of parent <restriction>
  will be listed. For ZONE and PARENT, <restriction> must be specified as a
  dbref number.
  
  'help @search2' for more.
[Top]

@search2
  If <class>=EXITS, OBJECTS, ROOMS, or PLAYERS, only objects of that type
  
  If <class>=FLAGS, only  objects with the list of flags specified by 
  <restriction> will be listed. Flag names should be specified by single
  letters. Flag names are case-sensitive.
  
  If <class>=POWERS, only objects with the given power are listed. Only
  one power may be specified.
  
  If <class>=EVAL, only objects for which <restriction> evaluates to 1
  will be listed. The token '##' in <restriction>, which is a function,
  is replaced by each dbref sequentially. Classes EPLAYER, EROOM, EEXIT,
  and EOBJECT work like EVAL but are restricted to a single type.
  
  See "help @search3" for more.
[Top]

@search3
  For the class TYPE=PLAYER, and for  PLAYER=<player-name>, anyone may
  obtain information on any player.  In all other cases, only wizards may
  obtain information about other players. This is computationally
  expensive, costing 100 pennies. It is generally faster than @find.
  
  Examples:  
    @search flags=Wc      <-- search for connected wizards.
    @search type=room     <-- list all rooms owned by me.
    @search zone=#50      <-- list all objects belong to zone #50.
    @search Joe eval=1,100,200   <-- list objects from #100-#200 owned by Joe.
    @search eval=gt(money(##,10))     <-- list all objects owned by me  
                                          worth more than 10 coins.

[Top]

@select
  @select <string> = <expr1>, <action1> [,<exprN>, <actionN>]... [,<default>]
  This is similar to @switch, except it only executes the action
  associated with the first expression which matches <string> - the
  targets are mutually exclusive. If no target is matched, the default
  actions are executed. This is equivalent to "@switch/first".

  Example:
    &FOO thing = $foo *:@select %0=*a*,:acks,*b*,:bars,*c*,:cheeps,:glurps
    foo abc
    > thing acks
    foo xxx
    > thing glurps

  The string "#$" in <action>'s will be expanded to the evaluated result
  of <string> before it is acted on.

See also: @switch, switch()
[Top]

@set
  @set <object>=[!]<flag>
  @<pre-defined attribute> <object>=<value>
  @set <object>=<attribute>:<value>
  @set <object>/<attribute>=[!]<atrflag>
  
  The first form sets (or unsets) a flag on <object>.
    Ex: @set me=VISUAL

  The second form sets a pre-defined attribute on <object>
    Ex: @fail Heavy Box=You can't pick that up.

  The third form sets an arbitrary attribute with <value> on <object>.
  You can also do this with &<attribute> <object>=<value>
    Ex: @set Test Object=random:This is a random attribute.
        &random Test Object=This is a random attribute.
  
  See "help @set2" for more.
[Top]

@set2
  The fourth form sets (or unsets) an attribute flag on the specified
  attribute. Possible flags are:
 
  no_command        Attribute will not be checked for '$' commands and
                    '^' listen patterns. In an 'examine', this is denoted
                    by '$' next to the dbref of the attribute's owner.
  visual            Attribute can be seen by anyone via get(), eval(),
                    ufun(), zfun(), and similar functions. In 'examine',
                    this is denoted by 'v'.

(continued in help @set3)
[Top]

@set3
  no_inherit        Attribute will not be inherited by the children of
                    this object. In 'examine', this is denoted by 'i'.
                    "private" is a synonym for no_inherit.
  no_clone          Attribute will not be copied if the object is @clone'd.
                    In 'examine', this is denoted by 'c'.
  mortal_dark       Attribute cannot be seen by mortals. Denoted by 'm'.
                    This flag can only be set by royalty and wizards.
                    "hidden" is a synonym for mortal_dark.
  regexp            Match $-commands and ^-listens using regular expressions.
                    See 'help regexps'. Denoted by 'R'.
  case              Match $-commands and ^-listens case sensitively.
                    Otherwise case doesn't count. Denoted by 'C'.
  wizard            Attribute can only be set by wizards. Denoted by 'w'.
                    This flag can only be set by royalty and wizards.
  
See also: FLAGS, NON-STANDARD ATTRIBUTES.
[Top]

@sex
  @sex <player> = <gender>  

  You can use this command to set yourself or any of your objects to be
  male, female, neuter, or plural. The SEX attribute is used for pronoun 
  substitution by the MUSH, and anything not recognizable will be treated
  as neuter. 

  @sex me = Male
  @sex me = Female
  @sex me = Woman
  @sex me = They
  @sex me = Plural
  @sex me = No thank you (silly, but possible)

See also: GENDER, SUBSTITUTION
[Top]

@shutdown
  @shutdown[/panic][/reboot][/paranoid]

  @shutdown shuts down the game. It may only be used by Wizards and
  must be typed in full.

  @shutdown/panic performs a panic shutdown of the game. It may only
  be used by God.

  @shutdown/reboot restarts the game without disconnecting the users.

  If the /paranoid switch is added, the shutdown dump will be a paranoid
  dump (see @dump).
[Top]

@sitelock
  @sitelock
  @sitelock/name <name>
  @sitelock <host-pattern> = <options>[,<name>]
  @sitelock[/<ban|register>] <host-pattern>

  The @sitelock command adds rules to the access.cnf file, controlling
  a host's level of access to the MUSH, or adds banned player names to
  the names.cnf file. Only Wizards may use @sitelock.

  @sitelock without arguments lists all sites in access.cnf.
  Rules are processed in the order listed, and the first matching
  rule is applied.

  @sitelock/name adds a name to the list of banned player names.
  Use !<name> to remove a name from the list.

  @sitelock <host-pattern> = <options>[,<name>] controls the access options
  for hosts which match <host-pattern>, which may include wildcard
  characters "*" and "?". See help @sitelock2 for the list of options,
  and help @sitelock3 for an explaination about the name argument.

  For backward compatibility, @sitelock/ban is shorthand for
  setting options "!connect !create !guest", and @sitelock/register
  is shorthand for options "!create".

[Top]

@sitelock2

  Sitelock allow/deny options:
   connect   --  allow this site to connect to non-guest players
   !connect  --  don't allow this site to connect to non-guest players
   guest     --  allow this site to connect to guest players
   !guest    --  don't allow this site to connect to guest players
   create    --  allow this site to create players
   !create   --  don't allow this site to create players
   default   --  allow any of the above
   none      --  don't allow any of the above
   !god      --  God can't connect from this site.
   !wizard   --  Wizards can't connect from this site.
   !admin    --  Wizards and Royalty can't connect from this site.

  Allow/deny options not set are assumed to be allowed.

  Sitelock special options:
   register    -- allow this site to use 'register <name> <email>'
                  at the connection screen to register players.
                  Players will be emailed their character's password.
                  This should be used with !create to be effective.
   suspect     -- set all players who connect from this site SUSPECT.
   deny_silent -- don't log failed access attempts from this site.
   regexp      -- Treat the hostname pattern as a regular expression
                  instead of a wildcard pattern.
[Top]

@sitelock3
 If you specific a character name after the options, the options
 are only checked if the host pattern matches, AND the character
 being checked for connect support matches the one you gave.
 Use it only with connect and !connect options, since they're
 the only ones where an existing character is used.

 For example, to disallow anyone from connecting to 'Twink' from
 one domain, but to allow connections to the character from others,
 use something like:

 @sitelock *.somesite.com=!connect,Twink

 If you want to disallow connections to a character from anywhere,
 use @newpassword or @sitelock *=!connect,Twink.

[Top]

@squota
  @squota <victim> [= <limit>]

  This is a wizard level command that is only available if the quota
  system is enabled.  It reports the victim's owned objects, and sets
  the maximum number of objects s/he may own to <limit>. If no limit is
  specified, this shows current quota, and reminds you to set one.
[Top]

@startup
  @startup <object> = <action list>

  Sets the list of actions on <object> that will happen whenever the MUSH
  is restarted. This lets you start up objects that need to be running 
  continuously. It is also useful for use with @function. 
  
See also: @function, ACTION LISTS
[Top]

@stats
  @stats. Display the number of objects in the game broken down by 
  object types.  Wizards can supply a player name to count only 
  objects owned by that player.
[Top]

@success
  @success <object> [=<message>]. 

  Sets the message that is shown to someone who successfully passes
  the basic lock of <object>. For things and players, this means picking
  them up. For exits, this means going through the exit.

  Ex.: @succ Box=You pick up the box.
       @succ Door=You walk through the door.

See also: @osuccess, @asuccess
[Top]

@sweep
  @sweep [connected | here | inventory | exits ]
 
  @sweep gives you a list of all objects/players that are listening in
  the room you are currently in, as well as the objects you are
  carrying. Most objects only listen for a particular string or
  phrase, so they normally do not pose a problem if you need privacy.
  You will have to be careful of players and puppets since they will
  hear everything you say and do. (And might post the same to r.g.m!)
  AUDIBLE exits are also shown on an ordinary sweep, if the room is
  also AUDIBLE. (Audible exits aren't active unless the room is audible).
 
  The four command options can also be used as switches (i.e., you
  can use "@sweep/connected" instead of "@sweep connected"). 
  If the connected flag is given, only connected players and puppets
  owned by connected players will be shown in the @sweep.
  The "here" and "inventory" flags check only your location or
  inventory, respectively. "exits" only checks for AUDIBLE exits.
[Top]

@switch
  @switch [/<switch>] <string> = <expr1>, <action1> [,<exprN>, 
                                 <actionN>]... [,<default>]
  For those of you familiar with programming, this command acts like
  if/then/else or switch/case. It compares <string> against whatever
  each <expr> evaluates to. If <string> and <expr> match, the action list
  associated with that <expr> is carried out. If no match is found, the
  <default> action list is carried out. 

  The string "#$" in <action>'s will be expanded to the evaluated result
  of <string> before it is acted on.
  
  @switch/all   will carry out the action lists for -all- of the 
                expressions that match <string>. This is the default.
  @switch/first will carry out the action list for only the -first-
                expression that matches <string>. This is the same as
                @select, and it is less computationally expensive than 
                /all in many cases.

(continued in help @switch2)
[Top]

@switch2
Examples: 
    &SWITCH_EX thing = $foo *:@switch %0=*a*,:acks,*b*,:bars,:glurps
    foo abc
    > thing acks
    > thing bars
    foo xxx
    > thing glurps

    &SWITCH_EX thing = $foo *:@switch/first %0=*a*,:acks,*b*,:bars,:glurps
    foo abc
    > thing acks

    &SWITCH_EX thing = $test:@switch hasflag(%#,PUPPET)=1,"Puppet!,"Not Puppet!
    test
    > thing says, "Not Puppet!"
See also: @select, switch()
[Top]

@teleport
  @teleport [<object>=] <room>. Teleports <object> to <room>. 
    
  <object> must be a thing; if you do not supply a thing, the object 
  is assumed to be yourself. The destination must be either JUMP_OK
  or controlled by you, and you must either control <object> or
  <object>'s current location. Also, the destination, if a room,
  cannot be teleport-locked against <object>. Mortals cannot teleport 
  Royalty or Wizards. If the target room has a drop-to, <object> will go 
  to the drop-to room instead. Wizards can teleport things into players'
  inventories.
  
  Teleportation from a room can be stopped by setting the NO_TEL flag.
  Royalty and Wizards can _always_ teleport to any location, regardless
  of NO_TEL or teleport locks.
  
  Teleportation triggers the @oxtport/@tport/@otport/@atport attributes,
  unless <room> is an exit.
  
  See also: JUMP_OK, NO_TEL, @oxtport, @tport, @otport, @atport, @lock
[Top]

@tport
  @tport <object> [=<message>]
  
  Sets the <message> shown to <object> when <object> is teleported.
[Top]

@trigger
  @trigger <object>/<attribute> [=<value 0>,<val. 1>,...,<val 9>]

  @trigger can be used to set off commands stored in an attribute on 
  an object. It can also pass values to that attribute on the stack 
  as %0 - %9.

  Example:
    &GREET me=POSE waves hi.
    @tr me/GREET
    > Cyclonus waves hi.

    &GREET me=POSE waves to %0! ; say Hi there, %1.
    @trig me/GREET = Gears, Arcee
    > Cyclonus waves to Gears.
    > You say, "Hi there, Arcee."

(continued in help @trigger2)
[Top]

@trigger2
  @trigger is very useful for splitting up large commands and for making
  them neater, but it does cause a time delay in execution, because the 
  commands are put into the queue a second later. For very commonly-used
  globals that you want to execute quickly, you should probably avoid using 
  @trigger. However, in most cases, the time saved by cramming everything 
  into one attribute is outweighed by the time spent debugging.

[Top]

@ulock
  @ulock <object> = <key>

  This is an abbreviation of @lock/use.

  This lock determines who is allowed to "use" the object or to set off
  any of the $-commands on the object. 

  Example: if I want everyone but Bob to be able to use my toy, I would
  "@ulock toy=!*Bob". If I want only Bob to be able to use it, I would
  "@ulock toy=*Bob".

See also: @lock, locktypes
[Top]

@uptime
  @uptime
  
  This command, for mortals, gives the time until the next database dump.
  For wizards, it also gives the system uptime (just as if 'uptime' had
  been typed at the shell prompt) and process statistics: the process ID,
  the machine page size, the maximum resident set size utilized (in K),
  "integral" memory (in K x seconds-of-execution), the number of page 
  faults ("hard" ones require I/O activity, "soft" ones do not), the
  number of times the process was "swapped" out of main memory, the
  number of times the process had to perform disk I/O, the number of
  network packets sent and received, the number of context switches,
  and the number of signals delivered to the process.
  In addition, this command gives wizards the dbref number of the first
  object in the destroyed object free list.
[Top]

@unlink
  @unlink <exit>
  @unlink <room>

  The first form of this command unlinks an exit from its destination
  room. Unlinked exits may be picked up and dropped elsewhere or relinked
  by anyone else. (Note that relinking an unlinked exit will @chown it to
  you if you do not already own it.)

  The second form removes the DROP-TO on the room.

See also: @link, DROP-TO
[Top]

@unlock
  @unlock[/<switch>] <object>

  Removes the lock on <object>. It can take as many switches as @lock can. 

See also: @lock, locktypes
[Top]

@use
  @use <object> [=<message>]

  Sets the message that is displayed to someone who successfully uses 
  <object>. If =<message> is omitted, the message is reset to nothing.

See also: use, @ouse, @ause
[Top]

@uunlock
  @uunlock <object> = <key>

  Un-use-locks the object. See also: @lock, @ulock
[Top]

@version
  @version
  Tells the player the name of the MUSH, which version of the code is 
  currently running on the system, when it was compiled, and when
  the last restart was.
[Top]

@verb
  @verb <victim>=<actor>,<what>,<whatd>,<owhat>,<owhatd>,<awhat>,<args>
  
  This command provides a way to do user-defined verbs with associated
  @attr/@oattr/@aattr groups. Invoking it does the following:
  
  <actor> sees the contents of <victim>'s <what> attribute, or
    <whatd> if <victim> doesn't have a <what>.
  Everyone in the same room as <actor> sees the contents of
    <victim>'s <owhat> attribute, with <actor>'s name prepended,
    or <owhatd>, also with <actor>'s name prepended, if <victim>
    doesn't have an <owhat>.
  <victim> executes the contents of his <awhat> attribute.
  
  By supplying up to nine <args>, you may pass those values on
  the stack (i.e. %0, %1, %2, etc. up through %9).
  
  See "help @verb2" for more.
  
[Top]

@verb2
  In order to use this command, at least one of the following criterion
  must apply:
    1. The object which did the @verb is a wizard.
    2. The object which did the @verb controls both <actor> and <victim>
    3. The thing which triggered the @verb (such as through a $command on
       the object which did the @verb) must be <actor>, AND the object
       which did the @verb must be either privileged or control <victim>
       or <victim> must be VISUAL.
  
  See "help @verb3" for examples.
  
[Top]

@verb3
  Example:
  
  &VERB_EXAMPLE Test Object=$test:@verb me=%N,TEST,You just tested.,OTEST,
       just tested the example.,ATEST,%N
  test
  > You just tested.
  > [others see] Cyclonus just tested the example.

  &TEST Test Object=You have just tested this object!
  &ATEST Test Object=@emit %0 has failed!
  &OTEST Test Object=tests test object.
  test
  > You have just tested this object!
  > [others see] Cyclonus tests test object.
  > Cyclonus has failed!

  Another example follows in "help @verb4"
[Top]

@verb4
  In order to make this into a global command that anyone can use, we
  need to put it on a WIZARD object in the Master Room. 

  &DO_TEST Global=$test *:@select locate(%#,%0)=#-1,
                  {@pemit %#=I don't see that here.},
                  {@verb locate(%#,%0,n)=%#,
                   TEST,You test [capstr(%0)].,
                   OTEST,tests [capstr(%0)].,
                   ATEST}
 
  &TEST Example=You test this fun example.
  &ATEST Example=POSE has been tested!
  test example
  > You test this fun example.
  > [others see] You test Example.
  > Example has been tested!

See also: USER-DEFINED COMMANDS, STACK, @trigger, @select
[Top]

@wait
  @wait <time> = <command_list>
  @wait <object> = <command_list>
  @wait <object>/<time> = <command_list>
  
  The basic form of this command puts the command list (a semicolon-separated 
  list of commands) into the wait queue to execute in <time> seconds.
  
  The second form sets up a semaphore wait on <object>. The enactor will
  execute <command_list> when <object> is @notified.
  
  The third form combines the first two: the enactor will execute
  <command_list> when <object> is @notified or when <time> passes,
  whichever happens first.
 
  See also the help for: SEMAPHORES, @drain, @notify
[Top]

@wall
[Top]

@wallemit
[Top]

@wallpose
  @wall [/<switch>] <message>
  @wallemit <message>
  @wallpose <pose>

  Only wizards can use this command, which allows the player to shout
  a message to every player connected. It must be typed in full.
  It can also take the following switches:
  /wizard  : broadcast to wizards (like @wizwall)
  /royalty : broadcast to wizards and royalty (like @rwall)
  /pose    : pose a message to all (or use @wallpose)
  /emit    : emit a message to all (or use @wallemit)

  You can also use @wall :<pose> to @wallpose.

See also: @wizwall, @rwall
[Top]

@warnings
  @warnings <object|me>=<warning list>

  If the building warning system is enabled, this command will set
  the types of warnings which should be reported on an object or
  to a player. You must control the object to use this command.

  When an object is checked for warnings (via @wcheck by the owner, or
  automatically), only warnings which are set to be reported on the
  object will be reported. If no warnings are set on the object, the
  owner's warning settings will be used. When admin use @wcheck to
  check non-owned objects, their personal warnings are always used.

  For a list of warnings, see 'help warnings list'
  See also 'help @wcheck' and 'help NO_WARN'

  For examples, see 'help @warnings2'

[Top]

@warnings2

  Example 1: Normal building situations
  Most people will simply want to leave their @warnings set to "normal"
  and their objects' @warnings set to "none". They will then receive 
  normal warnings for all their objects.

  Example 2: Warning-lover
  People who find warnings very helpful (like heavy builders) may want
  to set their personal @warnings to "extra" or "all", and keep their
  objects' warnings at "none". If a specific object should be treated 
  less strictly, set that object's @warnings differently. If an object
  shouldn't be warned on at all, set the NO_WARN flag on the object.

(continued in help @warnings3)
[Top]

@warnings3
  Example 3: Warning-hater
  People who prefer not to be warned except for specific object may
  set their personal @warnings to "none" and set the @warnings on
  those objects to appropriate levels.

  Example 4: I need some peace!
  Players who @set themselves NO_WARN will receive no warnings ever
  until they unset the flag.

[Top]

@wcheck
  @wcheck <object>
  @wcheck/all 

  This command is enabled if the building warning system is enabled.

  The first form of the command performs warning checks on a specific
  object. The player must own the object or be see_all. When the owner
  runs the command, the @warnings of the object are used to determine
  which warnings to give. If the object has no @warning's set, the
  @warnings of the owner are used. When a non-owner runs the command,
  the @warnings of the non-owner are used.

  The second form of the command runs @wcheck on every object in the
  database and informs connected owners of warnings. It is usually
  automatically run by the MUSH at intervals. Only Wizards may use
  @wheck/all.

See also: @warnings, WARNINGS, NO_WARN
[Top]

@whereis
  @whereis <player>

  If <player> is not set UNFINDABLE, this command will tell you where
  the player is. It will also inform the player that you attempted to
  locate their position, and whether you succeeded or not.

  To avoid being found this way, just do: @set me=UNFINDABLE

  Ex: @whereis  Moonchilde

See also: UNFINDABLE, loc()
[Top]

@wipe
  @wipe <object>[/<attribute pattern>]
  
  This command clears attributes from <object>, with the exception of
  attributes changeable only by wizards, and attributes not controlled by
  the object's owner (i.e. locked attributes owned by someone else).
  Only God may use @wipe to clear wiz-changeable-only attributes.
  The SAFE flag protects objects from @wipe.
 
  If no <pattern> is given, this gets rid of all the attributes, with
  exceptions as given above. If <pattern> is given, it gets rid of
  all attributes which match that pattern. Note that the restrictions
  above still apply.
[Top]

@wizemit
[Top]

@wizwall
[Top]

@wizpose
  @wizwall <message>
  @wizemit <message>
  @wizpose <message>

  This wiz-only command works similarly to @rwall or @wall, sending
  a message in either say, pose, or emit format to all wizards who
  are currently logged in. 

  @wizwall :<pose> or @wizwall ;<pose> will also send the message in
  pose format.

See also: @wall, @rwall
[Top]

@wizmotd
  @wizmotd <message>

  This is a wizard only command that will set a short temporary message
  that will be shown to all wizards when they connect. It is listed in
  @listmotd as the Wiz MOTD. A more permanent message can be set by
  the siteadmin by editing the file "wiz.txt".
[Top]

@zemit
  @zemit <zone> = <message>

  Emits a message to all rooms in <zone>. You must have control in that
  zone in order to use this command. Because it is computationally
  expensive, it costs 100 pennies.
[Top]

ahelp
  ahelp [<topic>]

  Shows the current admin help for the MUSH. Only ROYALTY and WIZARDS
  can use this command.

See also: anews
[Top]

anews
  anews [<topic>]

  Shows the current admin news for the MUSH. Only ROYALTY and WIZARDS
  can use this command.

See also: ahelp
[Top]

brief
  brief <object> 

  This command works like an abbreviated version of examine. It does not
  print out all the attributes on the object. 

See also: examine
[Top]

cd
[Top]

ch
  cd <name> <password>
  ch <name> <password>

  Not really a MUSH command, but a command available at the connect
  screen for Wizards. If enabled, Wizards who use 'cd' instead of
  'connect' to connect will be set DARK as they connect, and will not
  show arrival messages. Their arrival will, however, be broadcast
  to other admin, but not to MONITOR-flagged mortals.

  ch is a variant of cd that allows Royalty to connect @hidden.

See also: DARK, @hide
[Top]

DOING
  DOING

  This command displays the list of players currently connected to the
  MUSH. For mortals, it is identical to WHO. For wizards, it displays
  the WHO in the format mortals see. The wizard WHO shows location and
  host, but does not show @doing messages. DOING shows @doing messages
  but not location or host.

See also: WHO, @poll, @doing
[Top]

SESSION
  SESSION

  This admin-only form of WHO includes information on how much text
  has been recieved and sent to the connections. It has three fields:

  Sent, which is the number of characters sent TO the mush from that
  connection. Recv, the number of charaters sent FROM the mush to that
  connection, and Pend, the number of characters still waiting to be sent
  from the mush to the connection.

See also: WHO, DOING
[Top]

teach
  teach <command>

  Shows <command> (unparsed) to others in your room and then causes
  you to execute <command> as if you'd typed it in. Useful for
  helping newbies:

  > say To do a pose, use :<action>
  You say "To do a pose, use :<action>"
  > teach :waves hello.
  Javelin types --> :waves hello.
  Javelin waves hello.

  > teach "[sort(c b a)]
  Javelin types --> "[sort(c b a)]
  Javelin says, "a b c"

[Top]

drop
  drop <object>

  Drops <object>, if you are presently carrying it. If the room the object
  is dropped in has a DROP-TO set, the object may automatically be sent
  to another location. Some MUSHes may have @lock/drop enabled, which 
  allows you to set who is permitted to drop the object.

  Note that as of 1.6.6, the TEMPLE flag and SACRIFICING have been 
  disabled.

See also: STICKY, DROP-TO
[Top]

enter
  enter <object>

  Used to enter a thing or player. You can only enter an object if 
  you own it or if it is set ENTER_OK. You must also pass the enter-lock,
  if it is set. Entering an object triggers is @enter/@oenter/@oxenter
  messages and its @aenter actions. If you fail the enter-lock, the
  object's @efail/@oefail/@aefail messages and actions are triggered.

  Insides of objects are best used for vehicles, or storage spaces
  when you don't have a home. You can describe the interior of an
  object differently from its exterior by using @idescribe.  

See: @enter, @oenter, @oxenter, @aenter, leave, @lock, @idesc, INTERIORS
[Top]

events
[Top]

rules
  events [<topic>]
  rules [<topic>]

  These commands, like news, work the same way as the help command, except
  that the information provided in them is specific to this particular
  MUSH. Not all MUSHes will have both or either of these commands enabled.

See also: news, help
[Top]

examine
  examine[/<switch>] <object>[/<attribute>] 
  
  Displays all available information about <object>.  <object> may be an 
  object, 'me' or 'here'. You must control the object to examine it.  If 
  you do not own the object, or it is not visible, you will just see the 
  name of the object's owner.  May be abbreviated 'ex <object>'.  If the 
  attribute parameter is given, you will only see that attribute (good 
  for looking at code). You can also wild-card match on attributes.  For 
  example. to see all the attributes that began with a 'v' you could do 
  ex <object>/v*
  
  Examine takes three switches, "brief"  (equivalent to the "brief" command),
  "debug", which is a wizard-only switch, and "mortal".  "debug" examine
  will show the raw values for certain fields in an object. "mortal"
  examine will show an object as if you were a mortal and not the object's
  owner. It's primarily useful to admins.
[Top]

follow
  follow <object>

  If you pass the object's follow lock, you begin following it. As the
  object moves around (except if it @teleports away or goes home), you
  will automatically move around with it, so long as you pass all the
  locks and enter/leave locks on the exits and things the object moves
  through.

See also: unfollow, followers(), @follow, @ofollow, @afollow
[Top]

get
[Top]

take
  get <object>
  take <object>

  You pick up object, if you pass the object's @lock. You can also do 
  get <thing>'s <object>, which will fail if either thing is not ENTER_OK 
  or the object is locked against you. Some MUSHes choose to disable the 
  ability to take an object in someone else's inventory.
  
See also: @lock, ENTER_OK, give, drop, @success, inventory
[Top]

give
  give <player>=<pennies/object>

  Gives player the specified number of pennies or <object>. You can't give 
  someone pennies if their new total would be greater than 10000 pennies. 
  (No reason to get greedy)  You may also give players objects, but the 
  other player must be set ENTER_OK in order to receive something you give.
  
  Giving money to an object gives the money to the object's owner. Some
  MUSHes may have @lock/give enabled, which determines who is allowed to
  give an object.

See also: @pay, @cost, @lock, inventory, @receive, @give
[Top]

go
[Top]

goto
[Top]

move
  go[to] <direction> 
  go[to] home
  move <direction>
  move home

  Goes in the specified direction. <Direction> can be the name or alias of
  an exit in your area, the enter alias of an object in your area, or
  the leave alias of the object you are in. You do not need to use the
  word 'go' or 'move', in fact -- simply typing the direction will have the
  same effect.

  'go home' is a special command that returns you to your home room/object.
  Some MUSHes may disable this command.

See also: HOME, @link, @ealias, @lalias, EXITS
[Top]

index
  index

  A file similar to news, often indexing the news and events files.
  May not be available on some MUSHes.
[Top]

INFO
  INFO

  This command returns some information about the MUSH you are on, such
  as its version number, time of last restart, number of players currently
  connected, and size of database. It can be issued from the connect
  screen.
[Top]

inventory
  inventory

  Lists what you are carrying. Can be abbreviated by just 'i', or 'inv'.
  It also tells you how much MUSH money you have. If you are not set
  OPAQUE, others will also be able to see what is in your inventory by
  looking at you.

  Note that on some MUSHes it is possible to take things that are in 
  someone else's inventory. To be safe, @lock any objects that you do
  not want to lose.
  
See also: score, take, drop, OPAQUE, @lock
[Top]

kill
  kill <player> [=<cost>]

  Attempts to kill the specified player. Killing costs <cost> pennies, which 
  gives you a <cost>% chance of killing the player. Thus, spending 100 
  pennies always works (except against wizards,  who can never be killed). 
  Players cannot be killed in rooms which have been set HAVEN. If you don't 
  specify a cost, the default is 10 (i.e. 10%).  The player, if killed, 
  receives <cost>/2 pennies in insurance.

  This command may be disabled in this MUSH.

See also: BEING KILLED, HAVEN, FLAGS, powers list
[Top]

leave
  leave

  The command leave allows you to exit an object you have enter'ed 
  into. When you leave an object, its @leave/@oleave/@oxleave messages
  are triggered, and its @aleave actions are triggered. 

  The NO_LEAVE flag may be enabled on some MUSHes. Objects set with this
  flag cannot be left. @lock/leave may also be enabled on some MUSHes,
  which allows you to set who can leave the object. If you fail to
  leave, the object's @lfail/@olfail/@alfail messages/actions will be
  triggered.

See also: enter, @leave, @lfail, @lock, INTERIORS 
[Top]

LOGOUT
  LOGOUT

  LOGOUT is similar to QUIT, but instead of disconnecting you from the
  game completely, it merely disconnects you from your current
  character and returns you to the opening welcome screen. This is
  useful if you want to disconnect and then reconnect to another
  character. Unlike most commands, it is case-sensitive and must be
  typed in all caps.
[Top]

look
[Top]

read
  look [<object>]
  look <person>'s <object>
  look/outside

  Displays the description of <object>, or the room you're in if you don't 
  name a specific object.  You can specify object as <name> or #<dbref> or 
  'me' or 'here'. On some MUSHes, 'read' may work the same as 'look'. The 
  second form of this command allows you to look at objects held by other 
  people, if the person is not OPAQUE.
    
  Look can take one switch, "outside". look/outside allows you to
  look at objects outside your current location, as long as your
  immediate location is not a room, and is not OPAQUE.

(continued in help look2)
[Top]

look2
  If you look at an object that is not set OPAQUE, you will see any non-DARK
  items in its inventory. You can look at DARK items in your location if 
  you know what their name is by typing 'look <object>', but they will
  not show up in the list of contents.

  When you type 'look' alone, you look at your current location. For a room,
  this normally shows you the room's description, the list of contents, and
  any obvious exits from the room. For an object, it only shows you the
  interior description (@idescribe).
  
  If a room is set DARK, when you look you will not see any of the exits
  or contents of the room, unless they are set LIGHT. 

  'look' may be abbreviated 'l'.
  
See also: OPAQUE, FLAGS, @describe, @adescribe, @odescribe, DARK, LIGHT
[Top]

news
  news [<topic>]

  The news system works just like the help system. Many MUSHes use it to
  provide standard information on the rules, theme, and customized
  commands of the particular MUSH. It is highly recommended that you 
  read it regularly.
[Top]

page
  page[/<switch>] [<player-list>=]<message>.

  This command sends a message to a player or list of players. If
  the player's name contains spaces, surround it with double-quotes.
  If you have already paged someone since connecting, just typing:

    page <message>

  will send the message to the last person paged. You cannot page a 
  player if they are set HAVEN or if you do not pass their page-lock.

  Examples:
    > page airwolf=hi there!
    You paged Airwolf with 'hi there!'.
    > page see, I don't have to retype the name.
    You paged Airwolf with 'see, I don't have to retype the name.'.
    > page "John Lennon" Ringo=Paul's fine!

(continued in help page2)
[Top]

page2
  Page will attempt a partial match on the name, checking both for an
  @alias and to see if the name matches someone connected. If the first
  character of <message> is a : or a ;, it will send the page in pose
  format.  

  Objects may page players, but not vice versa. If an object pages
  a NOSPOOF player, that player will see the object's number in
  square brackets, in front of the message, in a fashion similar to
  the way NOSPOOF flags emits.

  Page takes two switches: /list and /noeval. 
  The /list switch is not needed to page a list of players, but it 
  informs all the players paged who else was paged and also notifies 
  the pager just once, which makes for less spam.

  The /noeval switch prevents the MUSH from evaluating the message.
  
See also: @lock, @alias, pose, :, ;, HAVEN, NOSPOOF, FLAGS
[Top]

:
[Top]

;
[Top]

pose
[Top]

semipose
  pose[/noeval] <action pose>
  :<action pose>

  pose[/nospace] <action pose>
  semipose[/noeval] <action pose>
  ;<action pose>
 
  Displays your name followed by the statement you posed.  May be abbreviated
  by the ':' symbol. Normally, a space is placed between your name and the
  action you are posing. If you do not wish to have a space inserted, use
  the /nospace switch, the 'semipose' command, or the ';' symbol and don't
  add a space between the ; and the <action pose>.
  The /noeval switch prevents the pose from being evaluated by
  the parser.

(continued in help pose2)
[Top]

pose2
 
  Examples:
    If you are player Bob, and you type in ':laughs out loud.' or
    'pose laughs out loud.' everybody in the room will see:
    "Bob laughs out loud." 
  
    If you are player Bob, and you type in ';'s smiling today.' or
    'pose/nospace 's smiling today.' everybody in the room will see:
    "Bob's smiling today."
[Top]

"
[Top]

say
  say <message>
  say/noeval <message>
  "<message>

  Says <message> out loud. The message will be enclosed in double-quotes.
  A single double-quote is the abbreviation for this common command.

  Say takes one switch, /noeval. The /noeval switch prevents any evaluation 
  of the message, and is handy when you want to say things that use special 
  characters like % or []'s.

  See also: whisper, pose
[Top]

score
  score
  
  Displays how many pennies you are carrying.  Helpful to see if
  any machines are looping. If they are, your pennies will be being 
  rapidly drained. MUSH money may also be used for other purposes in
  the game.
  
See also: LOOPING, @ps, QUEUE, MONEY
[Top]

slay
  slay <player/object> 

  This is a Wizard-only command that kills players without paying any 
  insurance to the victims. It is used in places where 'suicide' should 
  not pay.
  
  (Su-ic-ide is pain-less... {MASH theme})
[Top]

think
  think <message>

  You can use this command to send a private message to yourself. Pronoun
  substitution is performed. This is essentially equivalent to doing a
  "@pemit me=<message>", but with "think", there's no prepended text.
  One possible use: @adesc me=think %N just looked at you.
[Top]

QUIT
  QUIT

  Log out and leave the game. Must be in all capitals.  
[Top]

unfollow
  unfollow
  unfollow <object>

  The first form of this command clears off all your followers, if you
  have any. The second form of this command enables you to stop 
  following an object which you were formerly following. Note that you
  can also stop following by going off in a different direction before
  the object moves.

See also: follow, followers(), @follow, @ofollow, @afollow
[Top]

use
  use <object>

  Attempts to use an object, triggering its @use/@ouse/@ause attributes.
  The person using the object must pass its uselock; no inheritance check
  is necessary. This is may be done remotely, by using a dbref number;
  it provides an easy way for non-INHERIT objects to perform commands on
  INHERIT objects.

  If the person fails to pass the object's uselock, the object's
  @ufail/@oufail/@aufail attributes are triggered.

[Top]

whisper
  whisper <player>=<message>
  whisper/silent <player>=<message>
  whisper/noisy <player>=<message>
  whisper/noeval <player>=<message>
  whisper/list <players>=<message>

  Whispers the message to the named person, if they are in the same
  room as you. No one will see the message you whisper.  You can also
  whisper to things you are carrying, or to things that are carrying
  you. whisper <player>=:<pose> also works, in a fashion similar to
  page-pose.

  In a noisy whisper, other players in the room may be told who you whispered
  to (but not what you whispered): Polgara whispers to Javelin.
  The probability that a noisy whisper will be heard aloud is configurable.
  In a silent whisper, other players will not know that you whispered.
  The default whisper may be configured either silent or noisy (check @config)

(continued in help whisper2)
[Top]

whisper2
  The /noeval switch prevents any evaluation of the message, and
  is handy when you want to say things that use special characters
  like % or []'s.

  The /list switch lets you whisper to many people at once. Multiple
  persons should be space-separated, and names with spaces should be
  enclosed in double-quotes.

  'whisper' can be abbreviated by just 'w'.  
[Top]

WHO
  WHO   

  Displays a list of players currently connected to the MUSH.
  The WHO tells you how long a player has been on and how long they
  have been inactive. Unlike most commands, it is case sensitive.

See also: @doing, @poll, DOING
[Top]

with
  with <obj>=<command>

  Attempts to run a user-defined command on a specific object.

  See 'help USER-DEFINED COMMANDS'.

DynamixMUSH Homepage | Connect Now! | News | Tutorial | JSpace | Players | Fan Art
PennMUSH Commands (170Kb) | Functions (157Kb)
This page was last modified on 10/13/2000 15:38:09 by javin@dynamix.xidus.net

```
