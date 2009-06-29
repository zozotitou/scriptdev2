/**
 *
 * @File : npc_precompense.cpp
 *
 * @Authors : Wilibald09 + modification par guillaumederval
 *
 * @Date : 30/06/2008
 *
 * @Version : 2.3
 *
 * @Synopsis : NPC proposant des recompenses par categorie en fonction du prix en nombre d'item.
 *
 **/


#include "precompiled.h"
#include "sc_recompense.h"
#include <sstream>

#define GOSSIP_ACHAT            1000
#define GOSSIP_NEXT_PAGEC       1001
#define GOSSIP_PREV_PAGEC       1002
#define GOSSIP_NEXT_PAGEI       1003
#define GOSSIP_PREV_PAGEI       1004
#define GOSSIP_SHOW_ITEM        1005
#define GOSSIP_CONFIRM          1006
#define GOSSIP_QUIT             1007
#define GOSSIP_MAIN_MENU        1008

#define MSG_INVITEC             100000
#define MSG_INVITER             100001
#define MSG_VALID               100002

#define NB_CHOIX                10
#define NEXT_PAGE               "-> Page suivante"
#define PREV_PAGE               "<- Page precedente"
#define MAIN_MENU               "<= [Menu Principal]"

#define PLAYER_RENAMED "Et voila $N ! Veuillez vous deconnecter, puis vous reconnecter pour pouvoir changer de nom !"
#define PLAYER_CUSTOMIZED "Et voila $N ! Veuillez vous deconnecter, puis vous reconnecter pour pouvoir costomizer votre personnage !"
#define PAS_ASSEZ_DE_PO "Vous n'avez pas assez de points $N ! Revenez quand vous vous serez remplis les poches !"

using namespace std;
using namespace nsSD2P;
using namespace nsSD2P::nsNpcPRec;

namespace
{
    Page PageC, PageI;
    Page Cat;

    // Fonction ajoutant permettant de donner un ou plusieurs items a un joueur
    bool AddItem(Player *player, uint32 ItemId, uint32 count)
    {
        ItemPosCountVec dest;
        uint8 msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, ItemId, count, NULL);
        if(msg == EQUIP_ERR_OK)
        {
            Item *item = player->StoreNewItem(dest, ItemId, count, true);
            player->SendNewItem(item, count, true, false, false);
            return true;
        }
        return false;
    }

    // Fonction de conversion int->string
    std::string ConvertStr(const int64 &val)
    {
        std::ostringstream ostr;
        ostr << val;
        return ostr.str();
    }

    // Fonction d'affichage des categories
    void AffichCat(Player * const player, Creature * const creature)
    {
        if (PageC[player] > 0)
            player->ADD_GOSSIP_ITEM(7, PREV_PAGE, GOSSIP_PREV_PAGEC, 0);

        VCatRec_t i (PageC[player] * NB_CHOIX);
        for ( ; i < TabCatRec.size() && i < (NB_CHOIX * (PageC[player] + 1)); ++i)
        {
            player->ADD_GOSSIP_ITEM(7, TabCatRec[i].GetName().c_str(), GOSSIP_SHOW_ITEM, i);
        }

        if (i < TabCatRec.size())
            player->ADD_GOSSIP_ITEM(7, NEXT_PAGE, GOSSIP_NEXT_PAGEC, 0);

        player->SEND_GOSSIP_MENU(MSG_INVITEC, creature->GetGUID());
    }

    // Fonction d'affichage des items d'une categorie
    void AffichItem(Player * const player, Creature * const creature)
    {
        if (PageI[player] > 0)
            player->ADD_GOSSIP_ITEM(7, PREV_PAGE, GOSSIP_PREV_PAGEI, 0);

        CatRec::VRec_t i (PageI[player] * NB_CHOIX);
        for ( ; i < TabCatRec[Cat[player]].size() && i < (NB_CHOIX * (PageI[player] + 1)); ++i)
        {
            Rec item = TabCatRec[Cat[player]].GetItem(i);
            player->ADD_GOSSIP_ITEM(5, item.m_name.c_str(), GOSSIP_CONFIRM, i);
        }

        if (i < TabCatRec[Cat[player]].size())
            player->ADD_GOSSIP_ITEM(7, NEXT_PAGE, GOSSIP_NEXT_PAGEI, 0);

        if (TabCatRec.size() > 1)
            player->ADD_GOSSIP_ITEM(7, MAIN_MENU, GOSSIP_MAIN_MENU, 0);

        player->SEND_GOSSIP_MENU(MSG_INVITER, creature->GetGUID());
    }

    // Fonction de verification avant achat
    void ActionAchat(Player * const player, Creature * const creature, const uint32 &id)
    {
        Rec item = TabCatRec[Cat[player]].GetItem(id);
		int32 points_actuels = player->GetPoints();
		if (points_actuels < item.m_cost)
        {
            std::string Emote ("Vous n'avez pas assez de points !");
            creature->MonsterWhisper(Emote.c_str(), player->GetGUID());
            return;
        }
		
        if (AddItem(player, item.m_entry, 1))
        {
            std::string Emote ("Felicitation ! Vous venez de recevoir " + item.m_name + ".");
            creature->MonsterWhisper(Emote.c_str(), player->GetGUID());
            player->RemovePoints(item.m_cost);
        }
        else
            creature->MonsterWhisper("Vous n'avez pas assez de place dans votre inventaire pour recevoir votre recompense.", player->GetGUID());
    }

    // Fonction de demande de confirmation d'un achat
    void Confirmation(Player * const player, Creature * const creature, const uint32 &id)
    {
        Rec item = TabCatRec[Cat[player]].GetItem(id);

        std::string choixOui ("Oui je desire echanger " + ConvertStr(item.m_cost) + " points contre " + item.m_name + ".");
        player->ADD_GOSSIP_ITEM(2, choixOui.c_str() , GOSSIP_ACHAT, id);
        player->ADD_GOSSIP_ITEM(2, "Non." , GOSSIP_QUIT, 0);
        player->SEND_GOSSIP_MENU(MSG_VALID, creature->GetGUID());
    }
}

bool GossipHello_npc_precompense(Player *player, Creature *creature)
{
    PageC(player) = PageI(player) = Cat(player) = 0;

    if (player->isInCombat())
    {
        player->CLOSE_GOSSIP_MENU();
        creature->MonsterWhisper("Vous etes en combat. Revenez plus tard", player->GetGUID());
        return true;
    }

    AffichCat(player, creature);
    return true;
}

bool GossipSelect_npc_precompense(Player *player, Creature *creature, uint32 sender, uint32 param)
{
    switch(sender) 
    {
      // Affichage des items d'une categorie
      case GOSSIP_SHOW_ITEM:
        Cat(player) = param;
        AffichItem(player, creature);
        break;

      // Page de categories precedente
      case GOSSIP_PREV_PAGEC:
        --PageC(player);
        AffichCat(player, creature);
        break;

      // Page de categories suivante
       case GOSSIP_NEXT_PAGEC:
        ++PageC(player);
        AffichCat(player, creature);
        break;

      // Page d'items precedente
      case GOSSIP_PREV_PAGEI:
        --PageI(player);
        AffichItem(player, creature);
        break;

      // Page d'items suivante
      case GOSSIP_NEXT_PAGEI:
        ++PageI(player);
        AffichItem(player, creature);
        break;

      // Achat
      case GOSSIP_ACHAT:
        player->CLOSE_GOSSIP_MENU();
        ActionAchat(player, creature, param);
        break;

      // Demande de confirmation avant achat
      case GOSSIP_CONFIRM:
        Confirmation(player, creature, param);
        break;

      // Affichage Menu Principal
      case GOSSIP_MAIN_MENU:
        GossipHello_npc_precompense(player, creature);
        break;

      // Fin de conversation avec le NPC
      case GOSSIP_QUIT:
        player->CLOSE_GOSSIP_MENU();
        break;
    }
    return true;
}

/* MERCI DE LAISSER LE COPYRIGHT
ScriptData
SDName: npc_rename
SD%Complete: 100%
SDComment: NPC permettant de rename/customizer les players contre des po
SDAuthor: Tidus + modification et adaptation par guillaumederval
SDCategory: NPC_Custom
EndScriptData */


bool GossipHello_npc_rename(Player *player, Creature *_Creature)
{
    player->ADD_GOSSIP_ITEM( 3, "Rename mon personnage ! [5 Points]"                            , GOSSIP_SENDER_MAIN, 1217);
    player->ADD_GOSSIP_ITEM( 3, "Customizer mon personnage ! [10 Points]"            , GOSSIP_SENDER_MAIN, 1210);
    player->SEND_GOSSIP_MENU(120003,_Creature->GetGUID());
    
    return true;
}

void SendDefaultMenu_npc_rename(Player *player, Creature *_Creature, uint32 action )
{
    // Hors Combat
    if(player->getAttackers().empty())
    {
        player->CLOSE_GOSSIP_MENU();
        _Creature->MonsterWhisper("Tu es en combat $N ! Reviens plus tard !", player->GetGUID());
    }
    
    switch(action)
    {
        case 1210: //customize
			if(player->GetPoints() <= 10)
            {
                player->CLOSE_GOSSIP_MENU();
                _Creature->MonsterWhisper(PAS_ASSEZ_DE_PO, player->GetGUID());
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
				player->RemovePoints(10);
                player->SetAtLoginFlag(AT_LOGIN_CUSTOMIZE);
                //player->GetSession()->KickPlayer();
                _Creature->MonsterWhisper(PLAYER_CUSTOMIZED, player->GetGUID());
            }
        break;
        
        case 1217: //rename
			if(player->GetPoints() <= 5)
            {
                player->CLOSE_GOSSIP_MENU();
                _Creature->MonsterWhisper(PAS_ASSEZ_DE_PO, player->GetGUID());
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
				player->RemovePoints(5);
                player->SetAtLoginFlag(AT_LOGIN_RENAME);
                //player->GetSession()->KickPlayer();
                _Creature->MonsterWhisper(PLAYER_RENAMED, player->GetGUID());
            }
        break;
    }
}

bool GossipSelect_npc_rename(Player *player, Creature *_Creature, uint32 sender, uint32 action)
{
    // Main menu
    if(sender == GOSSIP_SENDER_MAIN)
    SendDefaultMenu_npc_rename(player, _Creature, action);

    return true;
}

void AddSC_npc_precompense()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="npc_precompense";
    newscript->pGossipHello =  &GossipHello_npc_precompense;
    newscript->pGossipSelect = &GossipSelect_npc_precompense;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name="npc_rename";
    newscript->pGossipHello = &GossipHello_npc_rename;
    newscript->pGossipSelect = &GossipSelect_npc_rename;
    newscript->RegisterSelf();
}