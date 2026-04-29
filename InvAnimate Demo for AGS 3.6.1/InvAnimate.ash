//Header
//The following license applies to the InvAnimate module:
/*
Zero-Clause BSD
=============

Permission to use, copy, modify, and/or distribute this software for
any purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL
WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE
FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY
DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*/


#define InvAnimate_VERSION 1000 // current version
#define InvAnimate_VERSION_1000 // provides v1.000 functionality

enum InvAnimate_IconOption 
{
  eInvAnimate_Normal, 
  eInvAnimate_Cursor, 
  eInvAnimate_Both
};
enum InvAnimate_RepeatStyle 
{
  eInvAnimate_RepeatForever, 
  eInvAnimate_RepeatFixed
};
/// InvAnimate_PlayBlockingAnimation Plays a blocking animation on the current inventory item. Does not play base between animations. 
import function InvAnimate_PlayBlockingAnimation(this InventoryItem*, int view, int loop, int delay, int delay_between_loops, int num_loops = 1);
/// InvAnimate_DisableBaseAnimation Disables the base animation but does not delete it (Will not wait for current animation to finish). Can be re-enabled later. If argument is not given, applies to both normal icon and cursor.
import function InvAnimate_DisableBaseAnimation(this InventoryItem*, InvAnimate_IconOption icon_style = eInvAnimate_Both);
/// InvAnimate_EnableBaseAnimation Enables the base animation that was previously disabled. If arguments are not given, it enables both normal icon and cursor, and plays them from the beginning instead of where they left off.
import function InvAnimate_EnableBaseAnimation(this InventoryItem*, InvAnimate_IconOption icon_style = eInvAnimate_Both,  bool play_from_beginning = true);
/// InvAnimate_DisableAnimation Disables the held animation but does not delete it (Will not wait for current animation to finish). Can be re-enabled later. If argument is not given, applies to both normal icon and cursor.
import function InvAnimate_DisableAnimation(this InventoryItem*, InvAnimate_IconOption icon_style = eInvAnimate_Both);
/// InvAnimate_EnableAnimation Enables the held animation that was previously disabled. If arguments are not given, it enables both normal icon and cursor, and plays them from the beginning instead of where they left off.
import function InvAnimate_EnableAnimation(this InventoryItem*, InvAnimate_IconOption icon_style = eInvAnimate_Both,  bool play_from_beginning = true);
/// InvAnimate_SetBaseGraphic Sets the base graphic which displays if the inventory item has no base animation set. Set delete_base_animation to true to delete any existing base animations. If no parameter given,  defaults to false.
import function InvAnimate_SetBaseGraphic(this InventoryItem*, int sprite_index, InvAnimate_IconOption icon_option = eInvAnimate_Both, bool delete_base_animation = false);
/// InvAnimate_SetBaseAnimation Sets the animation which is always playing when no other animation is playing on top of it.
import function InvAnimate_SetBaseAnimation(this InventoryItem*, int view, int loop, int delay, int delay_between_loops, InvAnimate_IconOption icon_style, bool enabled = true);
/// InvAnimate_SetAnimation sets an animation which plays over the base animation or graphic, for a specified number of loops, or if repeat_style is set to eInvAnimate_RepeatForever, loops the animation indefinitely. Values of unspecified optional parameters are to repeat forever,  perform 1 loop, both mouse and cursor,  and to start enabled.
import function InvAnimate_SetAnimation(this InventoryItem*, int view, int loop, int delay, int delay_between_loops, InvAnimate_RepeatStyle repeat_style = eInvAnimate_RepeatForever, int num_loops = 1, InvAnimate_IconOption icon_style = eInvAnimate_Both, bool enabled = true);
/// InvAnimate_UnsetBaseAnimation Deletes the base animation of an inventory item. Icon style defaults to both mouse and cursor animations if no parameter given.
import function InvAnimate_UnsetBaseAnimation(this InventoryItem*,  InvAnimate_IconOption icon_style = eInvAnimate_Both);
/// InvAnimate_ToggleHideWhileActiveInventory Inventory item will be hidden while inventory item is selected. Defaults to true for all inventory items. If no parameter given, will be set to true.
import function InvAnimate_ToggleHideWhileActiveInventory(this InventoryItem*, bool enabled = true);
/// InvAnimate_ToggleCopyNormalGraphicToCursor Makes the inventory item in the mouse cursor's animation always match the exact frame of the animation playing in the normal graphic instead of playing its own animation. Defaults to false for all inventory items. If no parameter given, will be set to true.
import function InvAnimate_ToggleCopyNormalGraphicToCursor(this InventoryItem*, bool enabled = true);
/// InvAnimate_ToggleShowBaseBetweenLoops Makes the base animation or graphic play in between loops of the current animation if the current animation isn't ready yet. Defaults to true for all inventory items. If no parameter given,  will be set to true.
import function InvAnimate_ToggleShowBaseBetweenLoops(this InventoryItem*, bool enabled = true);
/// InvAnimate_ToggleWaitForAnimations Waits for the current animation to finish before moving to a new animation. If false, new animations will play right away, or when the given number of frames have passed instead of waiting. Defaults to true for all inventory items. If no parameter given, will be set to true.
import function InvAnimate_ToggleWaitForAnimations(this InventoryItem*, bool enabled = true);
/// InvAnimate_TogglePlayWhileBlocked The current inventory item's animations will continue to play even when blocked by another script (but not certain dialogue). All inventory items default to true. If no parameter given,  will be set to true.
import function InvAnimate_TogglePlayWhileBlocked(this InventoryItem*, bool enabled = true);