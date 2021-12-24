/// @Description Iterates over all NPCs in the current map and finds the one that has the specified ID
/// @param id_to_find The id of the NPC that can be found in the NPC instance's creation code (npcID)
var id_to_find = argument0;

if(string_length(id_to_find) > 5 && string_copy(id_to_find,1,6) == "player") {
	return instance_find(obj_player, 0);	
}

for (var i = 0; i < instance_number(obj_npc); i ++)
{
   var npc = instance_find(obj_npc,i);
   if(npc.npcID == id_to_find) {
	   return npc;
   }
}