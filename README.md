# InvAnimate

Script module created with AGS 3.6.1 to add inventory animation functionality for your script.

## Examples

### Setting base normal and cursor animations

This example gives an inventory item a looping base animation and a separate cursor animation.

    player.ActiveInventory = iDog

    iDog.InvAnimate_SetBaseAnimation(VIEWDOG, 0, 5, 5, eInvAnimate_Normal);
    iDog.InvAnimate_SetBaseAnimation(VIEWDOG, 1, 5, 5, eInvAnimate_Cursor);

    iDog.InvAnimate_ToggleHideWhileActiveInventory(false);

#### What this does

- Sets a base animation for the normal inventory icon
- Sets a base animation for the cursor icon
- Disables hiding the normal inventory graphic while the item is in the cursor

#### Notes

- Use `eInvAnimate_Normal` to affect only the regular inventory icon
- Use `eInvAnimate_Cursor` to affect only the cursor icon
- Use `eInvAnimate_Both` to affect both at once

### Setting a base animation, and playing another animation every 500 frames

This example sets a base animation, then plays another animation over it with a `delay_between_loops` value of `500`.

    iCat.InvAnimate_SetBaseAnimation(VIEWCAT, 0, 3, 3, eInvAnimate_Normal);
    iCat.InvAnimate_SetAnimation(VIEWCAT, 1, 3, 3, 500, eInvAnimate_RepeatForever, 1, eInvAnimate_Normal);
    iCat.InvAnimate_ToggleCopyNormalGraphicToCursor(true);

#### What this does

- Sets a base animation for the normal inventory icon
- Plays a different animation every `500` frames

#### Notes

- The `500` value here is used as the animation's `delay_between_loops`
- Because `InvAnimate_ToggleWaitForAnimations` is set to `true` by default, it will always wait for the base animation to finish playing before switching to the current animation
- Because `InvAnimate_ToggleShowBaseBetweenLoops` is set to `true` by default, it plays the default animation in between loops of the current one. If disabled, it would display frame `0` of the current animation for `500` frames.
- Because `InvAnimate_TogglePlayWhileBlocked` is set to `true` by default, items will continue to animate even while the script is blocked.
- Because `InvAnimate_ToggleHideWhileActiveInventory` is set to `true` by default, it will temporarily disappear from your inventory while set to the mouse cursor
- If base animation was not set, it would instead display the base graphic between loops. For example, a still cat that licks its paws every 500 frames.

## Enums

### InvAnimate_IconOption

Chooses whether the animation functions work on the normal icon, cursor icon, or both.

- `eInvAnimate_Normal`
- `eInvAnimate_Cursor`
- `eInvAnimate_Both`

### InvAnimate_RepeatStyle

- `eInvAnimate_RepeatForever`
- `eInvAnimate_RepeatFixed`

## Function Reference

### Blocking animation

Functions for playing blocking inventory animations.

#### InvAnimate_PlayBlockingAnimation

    function InvAnimate_PlayBlockingAnimation(this InventoryItem*, int view, int loop, int delay, int delay_between_loops, optional int num_loops = 1)

**Description**  
Plays a blocking animation on the current inventory item. Does not play the base animation between loops.

---

### Base animation and graphic

Functions for setting what the item displays when no temporary animation is playing.

#### InvAnimate_SetBaseGraphic

    function InvAnimate_SetBaseGraphic(this InventoryItem*, int sprite_index, InvAnimate_IconOption icon_option = eInvAnimate_Both, bool delete_base_animation = false)

**Description**  
Sets the base graphic which displays if the inventory item has no base animation set.

Set `delete_base_animation` to `true` to delete any existing base animations. If no parameter is given, it defaults to `false`.

---

#### InvAnimate_SetBaseAnimation

    function InvAnimate_SetBaseAnimation(this InventoryItem*, int view, int loop, int delay, int delay_between_loops, InvAnimate_IconOption icon_style, bool enabled = true)

**Description**  
Sets the animation which is always playing when no other animation is playing on top of it.

---

#### InvAnimate_DisableBaseAnimation

    function InvAnimate_DisableBaseAnimation(this InventoryItem*, optional InvAnimate_IconOption icon_style = eInvAnimate_Both)

**Description**  
Disables the base animation but does not delete it.

Does not wait for the current animation to finish. Can be re-enabled later. If no argument is given, it applies to both the normal icon and cursor.

---

#### InvAnimate_EnableBaseAnimation

    function InvAnimate_EnableBaseAnimation(this InventoryItem*, InvAnimate_IconOption icon_style = eInvAnimate_Both, bool play_from_beginning = true)

**Description**  
Enables the base animation that was previously disabled.

If no arguments are given, it enables both the normal icon and cursor, and plays them from the beginning instead of where they left off.

---

#### InvAnimate_UnsetBaseAnimation

    function InvAnimate_UnsetBaseAnimation(this InventoryItem*, InvAnimate_IconOption icon_style = eInvAnimate_Both)

**Description**  
Deletes the base animation of an inventory item.

If no argument is given, the icon style defaults to both the normal icon and cursor.

---

### Active animation

Functions for playing and controlling temporary animations over the base animation or graphic.

#### InvAnimate_SetAnimation

    function InvAnimate_SetAnimation(this InventoryItem*, int view, int loop, int delay, int delay_between_loops, InvAnimate_RepeatStyle repeat_style = eInvAnimate_RepeatForever, int num_loops = 1, InvAnimate_IconOption icon_style = eInvAnimate_Both, bool enabled = true)

**Description**  
Sets an animation which plays over the base animation or graphic for a specified number of loops.

If `repeat_style` is set to `eInvAnimate_RepeatForever`, the animation loops indefinitely.

Values of unspecified optional parameters are:
- repeat forever
- perform `1` loop
- apply to both mouse and cursor
- start enabled

---

#### InvAnimate_DisableAnimation

    function InvAnimate_DisableAnimation(this InventoryItem*, InvAnimate_IconOption icon_style = eInvAnimate_Both)

**Description**  
Disables the held animation but does not delete it.

Does not wait for the current animation to finish. Can be re-enabled later. If no argument is given, it applies to both the normal icon and cursor.

---

#### InvAnimate_EnableAnimation

    function InvAnimate_EnableAnimation(this InventoryItem*, InvAnimate_IconOption icon_style = eInvAnimate_Both, bool play_from_beginning = true)

**Description**  
Enables the held animation that was previously disabled.

If no arguments are given, it enables both the normal icon and cursor, and plays them from the beginning instead of where they left off.

---

### Behavior toggles

Functions for changing how inventory animations behave.

#### InvAnimate_ToggleHideWhileActiveInventory

    function InvAnimate_ToggleHideWhileActiveInventory(this InventoryItem*, bool enabled = true)

**Description**  
Makes the inventory item hidden while that inventory item is selected.

This defaults to `true` for all inventory items. If no argument is given, it will be set to `true`.

---

#### InvAnimate_ToggleCopyNormalGraphicToCursor

    function InvAnimate_ToggleCopyNormalGraphicToCursor(this InventoryItem*, bool enabled = true)

**Description**  
Makes the inventory item in the mouse cursor always match the exact frame of the animation playing in the normal graphic instead of playing its own animation.

This defaults to `false` for all inventory items. If no argument is given, it will be set to `true`.

---

#### InvAnimate_ToggleShowBaseBetweenLoops

    function InvAnimate_ToggleShowBaseBetweenLoops(this InventoryItem*, bool enabled = true)

**Description**  
Makes the base animation or graphic play between loops of the current animation if the current animation is not ready yet.

This defaults to `true` for all inventory items. If no argument is given, it will be set to `true`.

---

#### InvAnimate_ToggleWaitForAnimations

    function InvAnimate_ToggleWaitForAnimations(this InventoryItem*, bool enabled = true)

**Description**  
Waits for the current animation to finish before moving to a new animation.

If set to `false`, new animations will play right away, or when the given number of frames have passed instead of waiting.

This defaults to `true` for all inventory items. If no argument is given, it will be set to `true`.

---

#### InvAnimate_TogglePlayWhileBlocked

    function InvAnimate_TogglePlayWhileBlocked(this InventoryItem*, bool enabled = true)

**Description**  
Makes the current inventory item's animations continue to play even when blocked by another script, but not during certain dialogue.

This defaults to `true` for all inventory items. If no argument is given, it will be set to `true`.
