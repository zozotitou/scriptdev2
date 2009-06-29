/**
 *
 * @File : sd2p_sc_npc_guild_guard.h
 *
 * @Authors : Wilibald09
 *
 * @Date : 13/06/2009
 *
 * @Version : 2.0
 *
 **/


#ifndef SC_GUILD_GUARD_H
#define SC_GUILD_GUARD_H

#include <vector>
#include "sd2p_util.h"

#define SD2P_GUILD_GUARD_NAMESPACE_DEB   namespace nsGuildGuard {
#define SD2P_GUILD_GUARD_NAMESPACE_FIN   }

SD2P_NAMESPACE_DEB
SD2P_GUILD_GUARD_NAMESPACE_DEB


/************************
 * STRUCTURES ET CLASSES
 ************************/

struct Guard
{
    uint32 m_Entry;
    uint32 m_GuildId;
};

/************
 * FONCTIONS
 ************/

Guard const * GetGuard(const uint32 &Entry);
void LoadDatabase(QueryResult *);


/******************
 * TYPE DE DONNEES
 ******************/

typedef UNORDERED_MAP<uint32, Guard> MGuard_t;
typedef std::vector<uint32>          VGuardDest_t;


/*********************************
 * DECLARATION VARIABLES GLOBALES
 *********************************/

extern MGuard_t     MGuard;
extern VGuardDest_t VGuardDest;


SD2P_GUILD_GUARD_NAMESPACE_FIN
SD2P_NAMESPACE_FIN

#endif /* SC_GUILD_GUARD_H */
