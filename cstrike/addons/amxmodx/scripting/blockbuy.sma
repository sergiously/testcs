#include <amxmodx>
#include <fakemeta>

new g_msgStatusIcon;

// Define the Plugin Version
new const VERSION[] = "1.0";

public plugin_init()
{
 register_plugin("Block Buy Menu", VERSION, "Shuttle_Wave/ConnorMcleod")
 
// Block BuyZone
 g_msgStatusIcon = get_user_msgid("StatusIcon");
 register_message(g_msgStatusIcon, "msgStatusIcon");
}

// Block buyzone (by ConnorMcLeod)
public msgStatusIcon(msgid, msgdest, id)
{
 static szIcon[8];
 get_msg_arg_string(2, szIcon, 7);
 
 if(equal(szIcon, "buyzone") && get_msg_arg_int(1))
 {
  set_pdata_int(id, 235, get_pdata_int(id, 235) & ~(1<<0));
  return PLUGIN_HANDLED;
 }
 
 return PLUGIN_CONTINUE;
}  